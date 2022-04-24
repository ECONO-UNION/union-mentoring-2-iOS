//
//  PokedexCell.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/17.
//

import UIKit

class PokedexCell: UICollectionViewCell {
    
  static let id = "PokedexCell"
  
  @IBOutlet weak var pokemonImageView: UIImageView!
  
  override func prepareForReuse() {
    pokemonImageView.image = nil
  }
}
