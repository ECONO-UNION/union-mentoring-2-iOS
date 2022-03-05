//
//  MenuViewController.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import UIKit


class MenuViewController: UIViewController {
  
  var menuList: [Product] = []
  var favoriteMenuList: [Product] = []
  var userCard = Card()
  
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
    
    if let cake = StrawberryCreamCake(numberOfCandles: 30) {
      menuList.append(cake)
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
    if totalPrice < userCard.money {
      print("금액이 부족합니다..")
    } else {
      userCard.pay(amount: totalPrice)
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
