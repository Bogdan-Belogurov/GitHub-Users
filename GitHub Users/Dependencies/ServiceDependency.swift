//
//  ServiceDependency.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

enum ServiceDependency {

    static func assemble() {
        Container.shared.register(type: ImageCacheManager.self, component: ImageCacheService())
        Container.shared.register(type: ImageLoader.self, component: ImageLoaderService())
        Container.shared.register(type: GitHubAPIClient.self, component: GitHubAPIClientService())
    }
}
