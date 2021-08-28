//
//  GitHubAPIClient.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import Combine

protocol GitHubAPIClient {

    func request<Out: Decodable>(_ endpoint: APIEndpoint<Out>) -> AnyPublisher<Out, Error>
}
