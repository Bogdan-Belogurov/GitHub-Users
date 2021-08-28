//
//  UserListViewModel.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

import Combine
import os.log

final class UserListViewModel: ViewModelBase<UserListState, UserListInput> {

    private let gitHubAPIClient = Container.shared.resolve(type: GitHubAPIClient.self)!

    override func trigger(_ input: UserListInput) {
        switch input {
        case .search(let text):
            state.searchText = text
            state.currentPage = 1
            if text.isEmpty {
                state.users = .empty
                return
            }
            getUsers(page: state.currentPage) { [weak self] users in
                guard let self = self else { return }
                self.state.users = users
            }
        case .prefetch:
            let nextPage = state.currentPage + 1
            getUsers(page: nextPage) { [weak self] users in
                guard let self = self else { return }
                self.state.currentPage = nextPage
                let items = self.state.users.items + users.items
                self.state.users = .init(
                    totalCount: users.totalCount,
                    incompleteResults: users.incompleteResults,
                    items: items
                )
            }
        case .selectUserSortingType(let type):
            state.userSortingType = type
            guard !state.searchText.isEmpty else { return }
            trigger(.search(name: state.searchText))
        }
    }

    private func getUsers(page: Int, completionClosure: @escaping (Users) -> Void) {
        let endpoint = GitHubAPI.Search.users(by: state.searchText,
                                              page: page,
                                              sortingTyle: state.userSortingType)
        gitHubAPIClient
            .request(endpoint)
            .sink {completion in
                switch completion {
                case .failure(let error):
                    os_log(.error, "Failed to load users. Error: %@", error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { users in
                completionClosure(users)
            }
            .store(in: &subscriptions)
    }
}
