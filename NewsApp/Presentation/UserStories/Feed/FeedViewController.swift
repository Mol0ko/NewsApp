//
//  FeedViewController.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import UIKit
import RxSwift
import RxCocoa

class FeedViewController: UIViewController {
    // MARK: - Properties

    private let tableView = UITableView()
    private let searchController = UISearchController()
    private let viewModel: FeedViewModel
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        bindViewModel()
    }

    // MARK: - PrepareView

    private func prepareView() {
        title = Strings.feed
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        prepareSearchController()
        prepareTableView()
    }

    private func prepareSearchController() {
        searchController.searchBar.placeholder = Strings.articlesSearchPlaceholder
        searchController.searchBar.sizeToFit()
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    private func prepareTableView() {
        let cellNib = UINib(nibName: ArticleCell.className, bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: ArticleCell.className)
        tableView.rowHeight = 200
        tableView.dataSource = nil
        tableView.delegate = nil

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableContraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(tableContraints)
    }

    // MARK: - Bind ViewModel

    private func bindViewModel() {
        bindSearchBar()
        bindTableViewDatasource()
        bindTableViewSelection()
        bindErrorAlert()
    }

    private func bindSearchBar() {
        searchController.searchBar.rx.text
            .bind(to: viewModel.searchQuery)
            .disposed(by: disposeBag)
    }

    private func bindTableViewDatasource() {
        viewModel.searchResults
            .asDriver()
            .drive(tableView.rx.items(cellIdentifier: ArticleCell.className)) { _, model, cell in
                guard let articelCell = cell as? ArticleCell else { return }
                articelCell.model = model
        }.disposed(by: disposeBag)
    }

    private func bindTableViewSelection() {
        tableView.rx.itemSelected
            .map { $0.row }
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        tableView.rx.itemSelected
            .bind(onNext: { [weak tableView] index in
                tableView?.deselectRow(at: index, animated: true)
            })
            .disposed(by: disposeBag)
    }

    private func bindErrorAlert() {
        viewModel.viewErrorText
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [weak self] errorText in
                guard let self = self else { return }
                let alertController = UIAlertController(title: Strings.error, message: errorText, preferredStyle: .alert)
                let okAction = UIAlertAction(title: Strings.ok, style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            })
            .disposed(by: disposeBag)
    }
}

