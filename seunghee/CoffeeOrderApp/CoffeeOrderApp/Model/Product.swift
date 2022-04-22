//
//  Product.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import Foundation

class Product {
  var name: String
  var price: UInt
  var imageName: String
  
  init(name: String, price: UInt, imageName: String = "default") {
    self.name = name
    self.price = price
    self.imageName = imageName
  }
}
