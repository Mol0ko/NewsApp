//
//  ArticleResponse.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

struct ArticleResponse: Decodable {
    let title: String
    let author: String?
    let description: String?
    let publishedAt: String
    let urlToImage: String?
}
