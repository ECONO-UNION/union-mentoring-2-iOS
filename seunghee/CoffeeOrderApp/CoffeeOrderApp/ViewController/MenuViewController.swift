//
//  MenuViewController.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import UIKit

class MenuViewController: UIViewController {
  
  @IBOutlet weak var balanceLabel: UILabel!
  @IBOutlet var productImageViews: [UIImageView]!
  @IBOutlet var productNameLabvels: [UILabel]!
  @IBOutlet var productPriceLabels: [UILabel]!
  
  var menuList: [Product] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingMenu()
  }
  
  private func settingMenu() {
    menuList.append(Americano())
    menuList.append(Latte())
    menuList.append(StrawberrySmoothi())
    menuList.append(JavachipFrapuccino())
    menuList.append(ChocolateCake())
    menuList.append(StrawberryCreamCake())
    
    for (i, product) in menuList.enumerated() {
      productNameLabvels[i].text = product.name
      productPriceLabels[i].text = "\(product.price)"
      productImageViews[i].image = UIImage(named: product.imageName)
    }
  }
  
  @IBAction func adminPageDidTap(_ sender: Any) {
    
  }
}
