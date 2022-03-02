//
//  Frappucchino.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class Frappuccino: Beverage{
    init(whippingCreamAdded: Bool = false) {
        super.init(name: "Frappuccino", price: 2000, stock: 15)
        self.whippingCreamAdded = whippingCreamAdded
    }
}
