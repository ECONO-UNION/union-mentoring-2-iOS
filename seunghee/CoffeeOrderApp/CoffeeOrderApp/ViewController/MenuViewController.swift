//
//  MenuViewController.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import UIKit


class MenuViewController: UIViewController {
  
  @IBOutlet weak var balanceLabel: UILabel!
  @IBOutlet var menuImageViewList: [UIImageView]!
  @IBOutlet var menuNameLabelList: [UILabel]!
  @IBOutlet var menuPriceLabelList: [UILabel]!
  
  var menuList: [Product] = []
  var favoriteMenuList: [Product] = []
  var userCard = Card()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingMenu()
    configureView()
  }
  
  private func settingMenu() {
    menuList.append(Americano())
    menuList.append(Latte())
    menuList.append(StrawberrySmoothi())
    menuList.append(JavachipFrapuccino())
    menuList.append(ChocolateCake())
    
    if let cake = StrawberryCreamCake(numberOfCandles: 130) {
      menuList.append(cake)
    }
  }
  
  private func configureView() {
    for i in 0..<menuList.count {
      guard i < menuImageViewList.count,
            i < menuNameLabelList.count,
            i < menuPriceLabelList.count else { return }
      
      let product = menuList[i]
      menuImageViewList[i].image = UIImage(named: product.imageName)
      menuNameLabelList[i].text = product.name
      menuPriceLabelList[i].text = "\(Int(product.price))"
    }
  }
  
  private func updateCardBalance() {
    DispatchQueue.main.async {
      self.balanceLabel.text = "\(self.userCard.money) 원"
    }
  }
  
  @IBAction func chargingButtonDidTap(_ sender: Any) {
    let id = String(describing: ChargingViewController.self)
    if let chargingVC = storyboard?.instantiateViewController(withIdentifier: id) as? ChargingViewController {
      chargingVC.completion = { [weak self] amount in
        guard let self = self else { return }
        self.userCard.chargeMoney(UInt(amount))
        self.updateCardBalance()
      }
      present(chargingVC, animated: true, completion: nil)
    }
  }
  
  @IBAction func menuButtonDidTap(_ button: UIButton) {
    let index = button.tag - 100
    guard index < menuList.count else { return }
    
    let id = String(describing: OrderViewController.self)
    if let orderVC = storyboard?.instantiateViewController(withIdentifier: id) as? OrderViewController {
      orderVC.product = menuList[index]
      orderVC.delegate = self
      navigationController?.pushViewController(orderVC, animated: true)
    }
  }
}

extension MenuViewController: CoffeeOrder {
  func availableMenuList() -> [Product] {
    var availableList: [Product] = []
    for product in menuList {
      if userCard.money >= product.price {
        availableList.append(product)
      }
    }
    return availableList
  }
  
  func order(product: Product, count: UInt) {
    let totalPrice = product.price * UInt(count)
    if userCard.money < totalPrice {
      print("금액이 부족합니다..")
    } else {
      userCard.pay(amount: totalPrice)
      updateCardBalance()
      print("\(product.name) \(count)개 주문이 완료되었습니다.")
    }
  }

  func chargeCard(money: UInt) {
    userCard.chargeMoney(money)
  }
  
  func addFavoriteProduct(_ product: Product) {
    favoriteMenuList.append(product)
  }
}

extension MenuViewController: OrderViewControllerDelegate {
  func didFinishOrder(_ viewController: OrderViewController, product: Product, qunatity: Int) {
    order(product: product, count: UInt(qunatity))
  }
}
