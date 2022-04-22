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
  
  func downloadImage(from urlString: String,
                     completion: @escaping (UIImage?)->Void) {
    let cacheKey: String = urlString
    if let image = cachedImage(key: urlString) {
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
  
  private func cachedImage(key: String) -> UIImage? {
    return ImageCache.shared.object(forKey: key as NSString)
  }
  
  private func saveLoadedImage(key: String, image: UIImage) {
    ImageCache.shared.setObject(image, forKey: key as NSString)
  }
  
  func clearCache() {
    ImageCache.clear()
  }
}
