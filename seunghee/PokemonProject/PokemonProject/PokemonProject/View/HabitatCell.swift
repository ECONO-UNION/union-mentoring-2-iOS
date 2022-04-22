//
//  HabitatCell.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/18.
//

import UIKit

class HabitatCell: UICollectionViewCell {
  
  @IBOutlet weak var habitatNameLabel: UILabel!
  
  static let id = "HabitatCell"
  
  override func prepareForReuse() {
    habitatNameLabel.text = ""
  }
}
