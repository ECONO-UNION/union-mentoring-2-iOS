//
//  ImageCacheManager.swift
//  RandomImageApp
//
//  Created by asong on 2022/03/25.
//

import UIKit

class ImageCacheManager{
    static let shared = NSCache<NSString, UIImage>()
    private init(){}
}
