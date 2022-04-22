//
//  RecentSearchingViewController.swift
//  AutoResizingProject
//
//  Created by seungbong on 2022/03/17.
//

import UIKit

class RecentSearchingViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
  
  var keywordList: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
   1ㅂㅈㄷ3ㄱ4ㅅ5  1₩ㅂㅈㄷㄱㅅ5ㅛㅕ7ㅑ8ㅐ9ㅔ0[=]1₩34
    configureView()
  }
  
  private func configureView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    collectionView.collectionViewLayout = layout
    
    let nib = UINib(nibName: KeywordCell.id, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: KeywordCell.id)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    searchBar.delegate = self
  }
  
  private func updateFlowLayout() {
    let height = collectionView.collectionViewLayout.collectionViewContentSize.height
    collectionViewHeightConstraint.constant = height
    view.layoutIfNeeded()
  }
  
  private func addSearchKeyword(_ keyword: String) {
    keywordList.insert(keyword, at: 0)
    collectionView.reloadData()
    searchBar.text = ""
  }
  
  private func removeSearchKeyword(at indexPath: IndexPath) {
    keywordList.remove(at: indexPath.row)
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
}

extension RecentSearchingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return keywordList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCell.id, for: indexPath) as? KeywordCell else {
      return UICollectionViewCell()
    }
  
    cell.updateUI(title: keywordList[indexPath.row])
    cell.buttonAction = { [weak self] in
      guard let self = self else { return }
      self.removeSearchKeyword(at: indexPath)
    }
    updateFlowLayout()
    return cell
  }
}

extension RecentSearchingViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    addSearchKeyword(searchBar.text ?? "")
  }
}
