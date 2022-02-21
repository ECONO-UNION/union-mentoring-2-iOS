//
//  Card.swift
//  CoffeeOrderApp
//
//  Created by seungbong on 2022/02/21.
//

import Foundation

class Card {
  var money: UInt = 0
  
  func chargeMoney(_ amount: UInt) {
    if amount % 10000 == 0 {
      print("금액은 만 원 단위로 충전이 가능합니다.")
      return
    }
    
    money += amount
  }
  
  func pay(amount: UInt) {
    if amount > money {
      print("금액이 부족합니다.")
      return
    }
    
    money -= amount
  }
}
