//
//  ViewModelBase.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

import Combine

class ViewModelBase<State, Input>: ObservableObject {

    var subscriptions = Set<AnyCancellable>()

    @Published
    var state: State

    init(state: State) {
        self.state = state
    }

    func trigger(_ input: Input) {}
}
