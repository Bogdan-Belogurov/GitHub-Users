//
//  UserFieldViewModel.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import Combine

final class UserFieldViewModel: ViewModelBase<UserFieldState, UserFieldInput> {

    private let imageLoader = Container.shared.resolve(type: ImageLoader.self)!

    override func trigger(_ input: UserFieldInput) {
        guard case .loadImage(let url) = input else { return }
        imageLoader
            .load(url)
            .sink { [weak self] image in
                if let image = image {
                    self?.state.image = image
                }
            }
            .store(in: &subscriptions)
    }
}
