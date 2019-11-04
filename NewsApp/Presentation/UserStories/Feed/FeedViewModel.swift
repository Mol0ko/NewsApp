//
//  FeedViewModel.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import Moya
import RxMoya
import RxSwift
import RxCocoa

class FeedViewModel {
    // MARK: - Properties

    private let router: FeedRouter
    private let apiProvider = MoyaProvider<NewsApi>()
    private let searchScheduler = ConcurrentDispatchQueueScheduler.init(qos: .userInteractive)
    private let searchThrottlingTime: RxTimeInterval = 0.5
    private let disposeBag = DisposeBag()

    // MARK: - View Input

    let searchResults = BehaviorRelay<[ArticleModel]>(value: [])
    let viewErrorText = PublishRelay<String>()

    // MARK: - View Output

    let searchQuery = PublishRelay<String?>()
    let itemSelected = PublishRelay<Int>()

    // MARK: - Lyfecycle

    init(router: FeedRouter) {
        self.router = router
        bindSearch()
        bindItemSelection()
    }

    // MARK: - Bindings

    private func bindSearch() {
        searchQuery
            .map { $0 ?? String() }
            .filter { !$0.isEmpty }
            .throttle(searchThrottlingTime, scheduler: searchScheduler)
            .distinctUntilChanged()
            .map { NewsApi.everything(query: $0) }
            .flatMapLatest { [weak apiProvider] target -> Single<[ArticleResponse]> in
                guard let apiProvider = apiProvider else { return .never() }
                return apiProvider.rx
                    .request(target)
                    .map(SearchResponse.self)
                    .map { $0.articles ?? [] }
                    .catchError { [weak self] error in
                        self?.viewErrorText.accept(error.localizedDescription)
                        return .never()
                }
        }
        .map { articlesResponse in
            let mapper = ArticleMapper()
            let articlesModels = articlesResponse
                .map { mapper.mapResponseToModel(response: $0) }
            return articlesModels
        }
        .bind(to: searchResults)
        .disposed(by: disposeBag)
    }

    func bindItemSelection() {
        itemSelected
            .withLatestFrom(searchResults) { $1[$0] }
            .bind(onNext: { [weak router] item in
                router?.pushArticleDetailsViewController(model: item)
            })
            .disposed(by: disposeBag)
    }
}
