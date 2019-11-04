//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import Foundation

struct ArticleModel: Equatable {
    let title: String
    let author: String
    let description: String
    let publishedAt: String
    let urlToImage: URL?

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title &&
            lhs.author == rhs.author &&
            lhs.description == rhs.description &&
            lhs.publishedAt == rhs.publishedAt &&
            lhs.urlToImage == rhs.urlToImage
    }
}
