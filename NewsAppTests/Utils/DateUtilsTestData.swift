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
        ("2019-10-15T13:36:00Z", "HH:mm dd.MM.YYYY"),
        ("2020-01-01T12:30:00Z", "HH:mm dd.MM.YYYY"),
        ("", ""),
        ("2019", "dd.MM.YYYY")
    ]

    // MARK: - Test Output

    let output = [
        "16:36 15.10.2019",
        "15:30 01.01.2020",
        "",
        ""
    ]
}
