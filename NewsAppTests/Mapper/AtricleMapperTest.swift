//
//  AtricleMapperTest.swift
//  NewsAppTests
//
//  Created by Никита Красавин on 04.11.2019.
//

import XCTest
@testable import NewsApp

class AtricleMapperTest: XCTestCase {

    private let mapper = ArticleMapper()
    private let testData = ArticleMapperTestData()

    func testMapResponseToModel() {
        let testResults = testData.input.map {
            mapper.mapResponseToModel(response: $0)
        }
        XCTAssertEqual(testResults, testData.output)
    }
}
