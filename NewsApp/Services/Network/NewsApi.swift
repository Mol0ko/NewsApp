//
//  NewsApi.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import Foundation
import Moya

enum NewsApi {
    case everything(query: String)
}

// MARK: - Moya setup

extension NewsApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: AppDefaults.apiBaseUrl) else {
            fatalError("Failed to provide api base url")
        }
        return url
    }

    var path: String {
        switch self {
        case .everything:
            return "everything"
        }
    }

    var method: Moya.Method {
        switch self {
        case .everything:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .everything(query):
            let parameters: [String: Any] = [
                "apiKey": AppDefaults.apiKey,
                "q": query
            ]
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.queryString
            )
        }
    }

    var sampleData: Data {
        return Data()
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return nil
    }
}
