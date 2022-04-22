//
//  ImageCell.swift
//  ImageCachingProject
//
//  Created by seungbong on 2022/03/27.
//

import UIKit

class ImageCell: UICollectionViewCell {
  
  static let id = "ImageCell"
  
  var imageView = UIImageView()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    configureView()
  }
  
  override func prepareForReuse() {
    imageView.image = nil
  }
  
  private func configureView() {
    self.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      imageView.topAnchor.constraint(equalTo: self.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  
  func updateUI(index: Int, imageUrl: String) {
    ImageDownloader.shared.downloadImage(urlString: imageUrl,
                                         index: index) { loadedImage in
      DispatchQueue.main.async {
        self.imageView.image = loadedImage
      }
    }
  }
}
