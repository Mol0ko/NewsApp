//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {
    // MARK: - Properties

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var model: ArticleModel? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.title
            authorLabel.text = model.author
            dateLabel.text = model.publishedAt
            descriptionLabel.text = model.description
            photoImageView.sd_setImage(with: model.urlToImage)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
}
