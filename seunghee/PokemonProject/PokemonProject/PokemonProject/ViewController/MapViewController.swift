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
  
  var totalHabitat: TotalHabitat?
  var loadedHabitatList: [PokeHabitat] = []
  
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
    mapCollectionView.delegate = self
    
    let nib = UINib(nibName: HabitatCell.id, bundle: nil)
    mapCollectionView.register(nib, forCellWithReuseIdentifier: HabitatCell.id)
  }
  
  private func fetchTotalHabitat() {
    NetworkAgent.shared.requestGET(NetworkConstants.habitateAPI,
                                   responseType: TotalHabitat.Response.self) { response in
      self.totalHabitat = TotalHabitat(json: response)
      DispatchQueue.main.async {
        self.mapCollectionView.reloadData()
      }
    }
  }
  
  private func fetchHabitat(url: String, completion: @escaping (PokeHabitat)->Void) {
    NetworkAgent.shared.requestGET(url, responseType: PokeHabitat.Response.self) { response in
      completion(PokeHabitat(json: response))
    }
  }
  
  private func fetchSpecies(url: String, completion: @escaping (PokeSpecies)->Void) {
    NetworkAgent.shared.requestGET(url, responseType: PokeSpecies.Response.self) { response in
      completion(PokeSpecies(json: response))
    }
  }
}

// MARK: - CollectionView Delegate
extension MapViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return totalHabitat?.habitatInfoList.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitatCell.id, for: indexPath) as? HabitatCell else {
      return UICollectionViewCell()
    }
    
    guard let habitatList = totalHabitat else { return UICollectionViewCell() }
    
    cell.habitatNameLabel.text = habitatList.habitatInfoList[indexPath.row].name
    cell.setCornerRadius()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedHabitatUrl = totalHabitat?.habitatInfoList[indexPath.row].url ?? ""
    fetchHabitat(url: selectedHabitatUrl, completion: { [weak self] habiatat in
      guard let self = self else { return }
      
      let random = Int.random(in: 0..<habiatat.speciesInfoList.count)
      let randomSpeciesUrl = habiatat.speciesInfoList[random].url
      
      self.fetchSpecies(url: randomSpeciesUrl, completion: { species in
        DispatchQueue.main.async {
          let id = FieldViewController.id
          if let fieldVC = self.storyboard?.instantiateViewController(withIdentifier: id) as? FieldViewController {
            fieldVC.pokeSpecies = species
            self.navigationController?.pushViewController(fieldVC, animated: true)
          }
        }
      })
    })
  }
}
