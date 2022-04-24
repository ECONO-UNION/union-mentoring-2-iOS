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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    collectionView.reloadData()
  }
  
  private func configureView() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 80, height: 80)
    collectionView.collectionViewLayout = layout
    collectionView.dataSource = self
    collectionView.delegate = self
    
    let nib = UINib(nibName: PokedexCell.id, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: PokedexCell.id)
  }
  
  @IBAction func goToMapButtonDidTap(_ sender: Any) {
    let id = MapViewController.id
    if let mapVC = storyboard?.instantiateViewController(withIdentifier: id) {
      navigationController?.pushViewController(mapVC, animated: true)
    }
  }
}

extension PokedexViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return User.shared.ownedPokemonList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedPokemon = User.shared.ownedPokemonList[indexPath.row]
    guard let species = selectedPokemon.pokeSpacies else { return }
    let descriptionView = PokedexDescriptionView()
    descriptionView.updateLabel(species: species)
    self.view.addSubview(descriptionView)
    descriptionView.setConstraintEqualTo(self.view)
  }
}
