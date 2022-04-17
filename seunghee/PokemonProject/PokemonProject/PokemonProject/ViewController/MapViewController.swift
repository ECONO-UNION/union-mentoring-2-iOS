//
//  MapViewController.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/18.
//

import UIKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapCollectionView: UICollectionView!
  
  static let id = "MapViewController"
  
  var habitatList: TotalHabitat?
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    fetchTotalHabitat()
    configureView()
  }
  
  private func configureView() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 120, height: 120)
    mapCollectionView.collectionViewLayout = layout
    mapCollectionView.dataSource = self
    
    let nib = UINib(nibName: HabitatCell.id, bundle: nil)
    mapCollectionView.register(nib, forCellWithReuseIdentifier: HabitatCell.id)
  }
  
  private func fetchTotalHabitat() {
    NetworkAgent.shared.requestGET(NetworkConstants.habitateAPI,
                                   responseType: TotalHabitat.Response.self) { response in
      self.habitatList = TotalHabitat(json: response)
      DispatchQueue.main.async {
        self.mapCollectionView.reloadData()
      }
    }
  }
}

extension MapViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return habitatList?.habitatInfoList.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitatCell.id, for: indexPath) as? HabitatCell else {
      return UICollectionViewCell()
    }
    
    guard let habitatList = habitatList else { return UICollectionViewCell() }
    
    cell.habitatNameLabel.text = habitatList.habitatInfoList[indexPath.row].name
    return cell
  }
}
