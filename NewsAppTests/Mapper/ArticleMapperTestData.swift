//
//  ArticleMapperTestData.swift
//  NewsAppTests
//
//  Created by Никита Красавин on 04.11.2019.
//

import Foundation
@testable import NewsApp

struct ArticleMapperTestData {
    // MARK: - Test Input

    let input = [
        ArticleResponse(
            title: "The Apple TV app is available on Roku",
            author: "Christine Fisher",
            description: "Apple wants Apple TV+ in as many places as possible",
            publishedAt: "2019-10-15T13:36:00Z",
            urlToImage: "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png"
        ),
        ArticleResponse(
            title: "",
            author: "",
            description: nil,
            publishedAt: "",
            urlToImage: nil
        ),
        ArticleResponse(
            title: "123",
            author: "123",
            description: "123",
            publishedAt: "unknown",
            urlToImage: "unknown"
        )
    ]

    // MARK: - Test Output

    let output = [
        ArticleModel(
            title: "The Apple TV app is available on Roku",
            author: "Christine Fisher",
            description: "Apple wants Apple TV+ in as many places as possible",
            publishedAt: "16:36 15.10.2019",
            urlToImage: URL(string: "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png")
        ),
        ArticleModel(
            title: "",
            author: "",
            description: "",
            publishedAt: "",
            urlToImage: nil
        ),
        ArticleModel(
            title: "123",
            author: "123",
            description: "123",
            publishedAt: "",
            urlToImage: URL(string: "unknown")
        )
    ]
}
