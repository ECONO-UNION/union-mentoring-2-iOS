//
//  StrawberryCreamCake.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/17.
//

import Foundation

final class StrawberryCreamCake: Cake {
  init() {
    super.init(name: "딸기 생크림 케이크",
               price: 6700,
               imageName: "cake")
  }
  
  init?(numberOfCandles: UInt) {
    if numberOfCandles > 100 {
      return nil
    } else {
      super.init(name: "딸기 생크림 케이크",
                 price: 6700,
                 imageName: "cake")
      self.numberOfCandles = numberOfCandles
    }
  }
}
