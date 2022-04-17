//
//  PokedexViewController.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/17.
//

import UIKit

class PokedexViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
  }
  
  private func configureView() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 80, height: 80)
    collectionView.collectionViewLayout = layout
    collectionView.dataSource = self
    
    let nib = UINib(nibName: PokedexCell.id, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: PokedexCell.id)
  }
  
  @IBAction func testAddPokemon(_ sender: Any) {
    var randNumberList: [Int] = []
    for _ in 0..<15 {
      let randomNum = Int.random(in: 1...100)
      if randNumberList.contains(randomNum) {
        continue
      }
      randNumberList.append(randomNum)
      let urlString = NetworkConstants.pokemonAPI + String(randomNum)
      NetworkAgent.shared.requestGET(urlString,
                                     responseType: Pokemon.Response.self) { response in
        let pokemon = Pokemon(json: response)
        User.shared.ownedPokemonList.append(pokemon)
        
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }
  }
}

extension PokedexViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return User.shared.ownedPokemonList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print("cellForItemAt")
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCell.id, for: indexPath) as? PokedexCell else {
      return UICollectionViewCell()
    }
    
    let pokemon = User.shared.ownedPokemonList[indexPath.row]
    let downloadUrl = pokemon.sprites?.front_default ?? ""
    ImageDownloader.shared.downloadImage(from: downloadUrl) { image in
      DispatchQueue.main.async {
        cell.pokemonImageView.image = image
      }
    }
    return cell
  }
}
