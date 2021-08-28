//
//  User.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

import Foundation

struct User {

    let id = UUID()
    let login: String
    let avatarURL: URL
}

extension User: Decodable {

    enum CodingKeys: String, CodingKey {

        case login = "login"
        case avatarURL = "avatar_url"
    }
}
