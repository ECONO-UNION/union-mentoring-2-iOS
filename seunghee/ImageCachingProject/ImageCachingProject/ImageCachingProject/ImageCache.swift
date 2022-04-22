//
//  Cache.swift
//  ImageCache
//
//  Created by seungbong on 2022/03/26.
//

import UIKit

class ImageCache {
  private static var imageCache: NSCache<NSString, UIImage>?
  
  static var shared: NSCache<NSString, UIImage> {
    if imageCache == nil {
      imageCache = NSCache<NSString, UIImage>()
    }
    return imageCache!
  }

  static func clear() {
    imageCache = nil
  }
}
