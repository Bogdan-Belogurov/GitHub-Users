//
//  GitHub_UsersApp.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

import SwiftUI

@main
struct GitHubUsersApp: App {

    init() {
        ServiceDependency.assemble()
    }

    var body: some Scene {
        WindowGroup {
            UserListView()
        }
    }
}
