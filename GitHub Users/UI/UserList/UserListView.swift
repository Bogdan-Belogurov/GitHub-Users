//
//  ContentView.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

import SwiftUI
import Combine

struct UserListView: View {

    @ObservedObject
    private var viewModel = UserListViewModel(state: .empty)
    @State
    private var showDetails = false

    var body: some View {
        VStack {
            HStack {
                Text("GitHub Users")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                Spacer()
                Menu {
                    ForEach(UserSortingType.allCases, id: \.rawValue) { sortType in
                        Button {
                            viewModel.trigger(.selectUserSortingType(sortType))
                        } label: {
                            HStack {
                                sortType.image
                                Text(sortType.title)
                            }
                        }
                    }
                } label: {
                    viewModel.state.userSortingType.image
                }
            }
            .padding()
            SearchBar(text: $viewModel.state.searchText)
                .padding(.top, -20)
                .padding(.horizontal, 10)
                .onChange(of: viewModel.state.searchText) { value in
                    viewModel.trigger(.search(name: viewModel.state.searchText))
                }

            if viewModel.state.searchText.isEmpty {
                Text("Enter your search query!👆🏻")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                Spacer()
            } else {
                List {
                    Section {
                        ForEach(viewModel.state.users.items, id: \.id) { user in
                            UserFieldView(user: user)
                                .onAppear {
                                    if user.id == viewModel.state.users.items.last?.id,
                                       viewModel.state.users.totalCount != viewModel.state.users.items.count {
                                        viewModel.trigger(.prefetch)
                                    }
                                }
                        }
                    }
                    .overlay(PullToRefresh { viewModel.trigger(.search(name: viewModel.state.searchText)) }
                                .allowsHitTesting(false)
                                .frame(width: .zero, height: .zero))
                }
            }
        }
    }
}
