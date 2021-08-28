//
//  ImageLoaderService.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import Combine
import Foundation
import UIKit

final class ImageLoaderService {

    private let imageProcessingQueue = DispatchQueue(label: "github-image")
    private let casheManager = Container.shared.resolve(type: ImageCacheManager.self)!
}

extension ImageLoaderService: ImageLoader {

    func load(_ url: URL) -> AnyPublisher<UIImage?, Never> {
        if let image = casheManager.get(forKey: url.absoluteString) {
            return Just(image).eraseToAnyPublisher()
        } else {
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .subscribe(on: imageProcessingQueue)
                .receive(on: DispatchQueue.main)
                .handleEvents(receiveOutput: { [weak self] image in
                    guard let self = self,
                    let image = image else { return }
                    self.casheManager.set(forKey: url.absoluteString, image: image)
                })
                .eraseToAnyPublisher()
        }
    }
}
