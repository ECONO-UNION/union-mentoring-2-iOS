//
//  ViewController.swift
//  ImageCachingProject
//
//  Created by seungbong on 2022/03/23.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  let imageDownloadUrl = "https://picsum.photos/640/360/?random"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
  }
  
  private func configureView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumLineSpacing = 0.0
    flowLayout.minimumInteritemSpacing = 0.0
    flowLayout.scrollDirection = .vertical
    //    flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    collectionView.collectionViewLayout = flowLayout
  }
  
  @IBAction func buttonDidTap(_ sender: Any) {
    ImageCache.clear()
    collectionView.reloadData()
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.id, for: indexPath) as? ImageCell else {
      return UICollectionViewCell()
    }
    
    cell.updateUI(index: indexPath.row, imageUrl: imageDownloadUrl)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let screenWidth = UIScreen.main.bounds.width
    let ratio: Double = 360.0 / 640.0
    return CGSize(width: screenWidth, height: screenWidth * ratio)
  }
}
