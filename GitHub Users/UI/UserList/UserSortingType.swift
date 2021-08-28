//
//  UserSortingType.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import SwiftUI

enum UserSortingType: String, Equatable, CaseIterable {

    case followers
    case repositories
    case joined
    case bestMatch = "best match"

    var title: String {
        switch self {
        case .followers:
            return "Followers"
        case .repositories:
            return "Repositories"
        case .joined:
            return "Joined"
        case .bestMatch:
            return "Best match"
        }
    }

    var image: Image {
        switch self {
        case .followers:
            return Image(systemName: "person.2")
        case .repositories:
            return Image(systemName: "folder")
        case .joined:
            return Image(systemName: "timer")
        case .bestMatch:
            return Image(systemName: "wand.and.stars")
        }
    }
}
