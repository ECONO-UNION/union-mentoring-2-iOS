//
//  Frappucchino.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class Frappuccino: Beverage{
    init(){
        super.init(name: "Frappuccino", price: 2000, stock: 15)
    }
    
    init(whippingCreamAdded: Bool) {
        super.init(name: "Frappuccino", price: 2000, stock: 15)
        self.whippingCreamAdded = whippingCreamAdded
    }
}
