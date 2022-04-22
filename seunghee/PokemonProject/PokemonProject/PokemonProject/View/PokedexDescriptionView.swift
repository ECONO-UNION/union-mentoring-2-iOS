//
//  DescriptionView.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/22.
//


import UIKit

class PokedexDescriptionView: UIView {
  private let id = "PokedexDescriptionView"
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    let view = Bundle.main.loadNibNamed(id, owner: self, options: nil)?.first as! UIView
    view.frame = self.bounds
    self.addSubview(view)
  }
  
  func updateLabel(species: PokeSpecies) {
    var descriptionText = "이름: \(species.name)\n타입: \(species.type)"
    for description in species.descriptions {
      let textRemovedLineSpacing = description.replacingOccurrences(of: "\n", with: " ")
      descriptionText += "\n\(textRemovedLineSpacing)"
    }
    descriptionLabel.text = descriptionText
  }
  
  @IBAction func closeButtonDidTap(_ sender: Any) {
    self.removeFromSuperview()
  }
}
 
