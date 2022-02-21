//
//  CoffeeOrder.swift
//  CoffeeOrderApp
//
//  Created by seungbong on 2022/02/21.
//

import Foundation

protocol CoffeeOrder {
  func availableMenuList() -> [Product]
  func order(product: Product, count: UInt)
  func chargeCard(money: UInt)
  func addFavoriteProduct(_ product: Product)
}
