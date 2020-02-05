//
//  DateUtilsTest.swift
//  NewsAppTests
//
//  Created by Никита Красавин on 05.02.2020.
//

import XCTest
@testable import NewsApp

class DateUtilsTest: XCTestCase {

    private let dateUtils = DateUtils()
    private let testData = DateUtilsTestData()

    func testDateStringFromIso8601String() {
        let testResults = testData.input.map {
            dateUtils.dateString(fromIso8601String: $0.fromIso8601String, format: $0.format)
        }
        XCTAssertEqual(testResults, testData.output)
    }
}
