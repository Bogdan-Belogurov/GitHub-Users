//
//  Dependencies.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 28.08.2021.
//

final class Container {

    static let shared = Container()

    private init() {}

    private var components = [String: Any]()

    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }

    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
