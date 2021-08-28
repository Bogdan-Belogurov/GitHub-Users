//
//  ImageCacheManager.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import UIKit

protocol ImageCacheManager {

    func get(forKey: String) -> UIImage?
    func set(forKey: String, image: UIImage)
}
