//
//  HotChoco.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class HotChoco: Beverage {
    init(whippingCreamAdded: Bool = false) {
        super.init(name: "HotChoco", price: 2000, stock: 10)
        self.whippingCreamAdded = whippingCreamAdded
    }
}
