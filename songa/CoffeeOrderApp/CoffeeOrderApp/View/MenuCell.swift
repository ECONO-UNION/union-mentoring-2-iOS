//
//  MenuCell.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/03/03.
//

import Foundation
import UIKit

class MenuCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func initCell(name: String, price: Int) {
        nameLabel.text = name
        priceLabel.text = String(price)
    }
}
