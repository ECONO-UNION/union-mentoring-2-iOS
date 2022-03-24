//
//  ViewController.swift
//  SearchList
//
//  Created by asong on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data = ["스위프트", "코로나", "엽떡","크리스피크림", "드라마"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SearchCollectionViewCell else{ return UICollectionViewCell() }
        cell.searchLabel.text = data[indexPath.row]
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SearchCollectionViewCell else{ return }
    }
}

extension ViewController {
    @objc func deleteButtonAction(sender : UIButton) {
        collectionView.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
        data.remove(at: sender.tag)
    }
    
    @IBAction func deleteAllData(){
        data.removeAll()
        collectionView.reloadData()
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let  text = searchBar.text {
            data.insert(text, at: 0)
            collectionView.reloadData()
        }
    }
}
