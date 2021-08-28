//
//  ImageCacheService.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import UIKit

final class ImageCacheService: ImageCacheManager {

    private var cache = NSCache<NSString, UIImage>()

    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }

    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}
