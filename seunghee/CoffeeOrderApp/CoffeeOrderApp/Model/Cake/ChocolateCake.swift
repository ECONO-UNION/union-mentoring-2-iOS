//
//  ChocolateCake.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import Foundation

final class ChocolateCake: Cake {
  init() {
    super.init(name: "초콜릿 케이크",
               price: 6200,
               imageName: "cake")
  }
  
  init?(numberOfCandles: UInt) {
    if numberOfCandles > 100 {
      return nil
    } else {
      super.init(name: "초콜릿 케이크",
                 price: 6200,
                 imageName: "cake")
      self.numberOfCandles = numberOfCandles
    }
  }
}
