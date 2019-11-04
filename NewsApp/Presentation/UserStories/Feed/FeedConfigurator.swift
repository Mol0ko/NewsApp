//
//  FeedConfigurator.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import UIKit

class FeedConfigurator {
    func configure() -> UIViewController {
        let router = FeedRouter()
        let viewModel = FeedViewModel(router: router)
        let viewController = FeedViewController(viewModel: viewModel)
        router.view = viewController
        
        return viewController
    }
}
