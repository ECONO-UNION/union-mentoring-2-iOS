//
//  TestViewController.swift
//  AutoResizingProject
//
//  Created by seungbong on 2022/03/22.
//

import UIKit

class TestViewController: UIViewController {
  
  @IBOutlet weak var testCollectionView: UICollectionView!
  
  let testArray = ["asdfas", "ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴ", "123123", "ㅎㅎ","1134ㄱㅇ롷ㄴㅇ43"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    testCollectionView.delegate = self
    testCollectionView.dataSource = self
    
    let flowlayout = UICollectionViewFlowLayout()
    flowlayout.scrollDirection = .vertical
//    testCollectionView.collectionViewLayout = flowlayout
  }
}

extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return testArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let testCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as? TestCell else {
      return UICollectionViewCell()
    }
    testCell.keywordLabel.text = testArray[indexPath.row]
    return testCell
  }
}

class TestCell: UICollectionViewCell {
  @IBOutlet weak var keywordLabel: UILabel!
}
