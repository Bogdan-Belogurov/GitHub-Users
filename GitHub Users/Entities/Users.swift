//
//  Users.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

struct Users {

    let totalCount: Int
    let incompleteResults: Bool
    let items: [User]

    static let empty = Users(totalCount: .zero,
                             incompleteResults: false,
                             items: [])
}

extension Users: Decodable {

    enum CodingKeys: String, CodingKey {

        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items = "items"
    }
}
