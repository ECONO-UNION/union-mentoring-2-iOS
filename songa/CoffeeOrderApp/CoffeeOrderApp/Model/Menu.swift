//
//  Menu.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class Menu {
    var name: String = ""
    var price: Int = 0
    var stock: Int = 0
   
    init(name: String, price: Int, stock: Int){
        self.name = name
        self.price = price
        self.stock = stock
    }
}
