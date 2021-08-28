//
//  UserListState.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

struct UserListState {

    var users: Users = .empty
    var searchText: String = ""
    var currentPage = 1
    var userSortingType: UserSortingType = .bestMatch

    /// An empty user list state.
    static let empty = UserListState()
}
