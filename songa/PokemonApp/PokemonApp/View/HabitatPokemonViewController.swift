//
//  HabitatPokemonViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/12.
//

import UIKit

class HabitatPokemonViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
       
    var data: [PokemonSpecies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension HabitatPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell else{ return UICollectionViewCell() }
        cell.nameLabel.text = data[indexPath.row].name
        return cell
    }
}
