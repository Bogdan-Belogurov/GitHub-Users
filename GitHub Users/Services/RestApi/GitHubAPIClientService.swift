//
//  GitHubAPIClientService.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import Combine
import Foundation
import os.log

final class GitHubAPIClientService {

    private let scheme = "https"
    private let host = "api.github.com"

    private func buildRequest<Out>(_ endpoint: APIEndpoint<Out>) -> URLRequest? where Out: Decodable {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems

        guard let url = urlComponents.url else {
            os_log(.error, "Could not construct URL for request")
            return nil
        }

        var request = URLRequest(url: url)
        request.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        return request
    }
}


extension GitHubAPIClientService: GitHubAPIClient {

    func request<Out>(_ endpoint: APIEndpoint<Out>) -> AnyPublisher<Out, Error> where Out: Decodable {
        guard let request = buildRequest(endpoint),
              let url = request.url else {
            return Fail(error: NSError())
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Out.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
