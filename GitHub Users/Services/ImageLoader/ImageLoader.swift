//
//  ImageLoader.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import Combine
import UIKit

protocol ImageLoader {

    func load(_ url: URL) -> AnyPublisher<UIImage?, Never>
}
