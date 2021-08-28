//
//  UserFieldView.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import SwiftUI

struct UserFieldView: View {

    @ObservedObject
    private var viewModel = UserFieldViewModel(state: .init())
    private let user: User

    init(user: User) {
        self.user = user
        viewModel.trigger(.loadImage(user.avatarURL))
    }

    var body: some View {
        HStack {
            if let image = viewModel.state.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())

            }
            Text("\(user.login)")
        }
    }
}
