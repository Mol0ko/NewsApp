//
//  DateUtilsTestData.swift
//  NewsAppTests
//
//  Created by Никита Красавин on 05.02.2020.
//

struct DateUtilsTestData {

    typealias Input = (fromIso8601String: String, format: String)
    
    // MARK: - Test Input

    let input: [Input] = [
        ("", ""),
        ("2019", "dd.MM.YYYY")
    ]

    // MARK: - Test Output

    let output = [
        "123",
        ""
    ]
}
