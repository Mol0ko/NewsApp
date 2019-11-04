//
//  FeedRouter.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import UIKit

class FeedRouter {

    weak var view: UIViewController?

    func pushArticleDetailsViewController(model: ArticleModel) {
        let viewController = ArticleDetailsViewController(model: model)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
