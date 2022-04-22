//
//  ViewController.swift
//  ImageCachingProject
//
//  Created by seungbong on 2022/03/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  // https://picsum.photos/v2/list
  let imageDownloadUrl = "https://picsum.photos/640/360/?random"
  
  var randomNum = Int.random(in: 0...9)

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
  }
  
  private func configureView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.prefetchDataSource = self
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumLineSpacing = 0.0
    flowLayout.minimumInteritemSpacing = 0.0
    flowLayout.scrollDirection = .vertical
    //    flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    collectionView.collectionViewLayout = flowLayout
  }
  
  @IBAction func buttonDidTap(_ sender: Any) {
    ImageCache.clear()
    randomNum = Int.random(in: 0...9)
    collectionView.setContentOffset(.zero, animated: true)
    collectionView.reloadData()
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.id, for: indexPath) as? ImageCell else {
      return UICollectionViewCell()
    }
    
    cell.updateUI(index: indexPath.row, imageUrl: imageDownloadUrl)
    cell.imageView.image = UIImage()

//    let urlString = "https://picsum.photos/id/\(String(indexPath.row))\(randomNum)/640/360"
//    if let url = URL(string: urlString) {
//      let cacheKey = urlString //imageDownloadUrl + String(indexPath.row)
//      let resource = ImageResource(downloadURL: url, cacheKey: cacheKey)
//      let processor = RoundCornerImageProcessor(cornerRadius: 20)
//
//      print("cache key : \(cacheKey)")
//      cell.imageView.kf.indicatorType = .activity
//      cell.imageView.kf.setImage(
//        with: resource,
//        options: [
//          .transition(.fade(1)),
//          .processor(processor)
//        ])
//    }
      
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let screenWidth = UIScreen.main.bounds.width
    let ratio: Double = 360.0 / 640.0
    return CGSize(width: screenWidth, height: screenWidth * ratio)
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    for indexPath in indexPaths {
              print("prefetch >> \(indexPath.row)")
      ImageDownloader.shared.downloadImage(urlString: imageDownloadUrl,
                                           index: indexPath.row,
                                           completion: { image in

        DispatchQueue.main.async {
          collectionView.reloadItems(at: [indexPath])
        }
      })
    }
  }
}
