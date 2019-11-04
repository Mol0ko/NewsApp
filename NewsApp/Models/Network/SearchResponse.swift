//
//  SearchResponse.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

struct SearchResponse: Decodable {
    let articles: [ArticleResponse]?
}
