//
//  GitHubAPI.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

enum GitHubAPI {

    enum Search {

        static func users(by name: String,
                          page: Int,
                          sortingTyle: UserSortingType = .bestMatch)
        -> APIEndpoint<Users> {
            return .init(path: "/search/users",
                         queryItems: [.init(name: "q", value: name),
                                      .init(name: "page", value: String(page)),
                                      .init(name: "sort", value: sortingTyle.rawValue)])
        }
    }
}
