//
//  APIEndpoint.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import Foundation

final class APIEndpoint<ResponseData> {

    let path: String
    let method: HTTPMethod
    let queryItems: [URLQueryItem]?

    init(path: String, method: HTTPMethod = .get, queryItems: [URLQueryItem]? = nil) {
        self.method = method
        self.path = path
        self.queryItems = queryItems
    }
}
