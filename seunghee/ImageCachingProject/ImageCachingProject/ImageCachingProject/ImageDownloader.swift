//
//  ImageDownloader.swift
//  ImageCachingProject
//
//  Created by seungbong on 2022/03/26.
//

import UIKit

class ImageDownloader {
  
  private static var imageDownloader: ImageDownloader?
  
  static var shared: ImageDownloader {
    if imageDownloader == nil {
      imageDownloader = ImageDownloader()
    }
    return imageDownloader!
  }
  
  func downloadImage(urlString: String,
                     index: Int,
                     completion: @escaping (UIImage?)->Void) {
    let cacheKey: String = urlString + String(index)
    if let image = cachedImage(key: cacheKey) {
      completion(image)
      return
    }
    
    DispatchQueue.global().async {
      guard let url = URL(string: urlString),
            let data = try? Data(contentsOf: url),
            let loadedImage = UIImage(data: data) else {
              completion(nil)
              return
            }
      self.saveLoadedImage(key: cacheKey, image: loadedImage)
      completion(loadedImage)
    }
  }
  
  func cachedImage(key: String) -> UIImage? {
    return ImageCache.shared.object(forKey: key as NSString)
  }
  
  func saveLoadedImage(key: String, image: UIImage) {
    ImageCache.shared.setObject(image, forKey: key as NSString)
  }
  
  func clearCache() {
    ImageCache.clear()
  }
}
