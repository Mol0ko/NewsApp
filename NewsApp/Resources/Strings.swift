//
//  Strings.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import Foundation

enum Strings {
    private static let hostingBundle = Bundle.main

    static let error = NSLocalizedString("error", bundle: hostingBundle, comment: "")
    static let ok = NSLocalizedString("ok", bundle: hostingBundle, comment: "")

    static let feed = NSLocalizedString("feed", bundle: hostingBundle, comment: "")
    static let articlesSearchPlaceholder = NSLocalizedString(
        "articlesSearchPlaceholder",
        bundle: hostingBundle,
        comment: ""
    )
}
