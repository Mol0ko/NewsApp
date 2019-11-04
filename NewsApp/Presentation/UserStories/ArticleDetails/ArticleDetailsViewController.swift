//
//  ArticleDetailsViewController.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let model: ArticleModel

    // MARK: - Lifecycle

    init(model: ArticleModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    // MARK: - PrepareView

    private func prepareView() {
        title = model.title
        titleLabel.text = model.title
        authorLabel.text = model.author
        dateLabel.text = model.publishedAt
        descriptionLabel.text = model.description
        imageView.sd_setImage(with: model.urlToImage)
    }
}
