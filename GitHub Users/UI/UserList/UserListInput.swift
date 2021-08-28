//
//  UserListInput.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

enum UserListInput {

    case search(name: String)
    case prefetch
    case selectUserSortingType(UserSortingType)
}
