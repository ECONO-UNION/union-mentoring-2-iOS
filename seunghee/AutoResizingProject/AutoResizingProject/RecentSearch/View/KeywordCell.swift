//
//  KeywordCell.swift
//  AutoResizingProject
//
//  Created by seungbong on 2022/03/17.
//

import UIKit

class KeywordCell: UICollectionViewCell {
  
  @IBOutlet weak var keywordLabel: UILabel!
  
  static let id = "KeywordCell"
  var buttonAction: (()->Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.layer.borderWidth = 1.0
    self.layer.borderColor = UIColor.gray.cgColor
    self.layer.cornerRadius = 18
  }
  
  func updateUI(title: String) {
    keywordLabel.text = title
  }
  
  @IBAction func removeButtonDidTap(_ sender: Any) {
    if let action = buttonAction {
      action()
    }
  }
}
