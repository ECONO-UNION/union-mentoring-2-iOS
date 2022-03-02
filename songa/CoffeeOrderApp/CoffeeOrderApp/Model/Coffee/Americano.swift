//
//  Americano.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class Americano: Coffee {
    init(isHot: Bool = false) {
        super.init(name: "Americano", price: 1000, stock: 20)
        self.isHot = isHot
    }
}
