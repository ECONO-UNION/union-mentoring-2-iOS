//
//  VanillaLatte.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class VanillaLatte: Coffee {
    init(isHot: Bool = false) {
        super.init(name: "VanillaLatte", price: 1500, stock: 15)
        self.isHot = isHot
    }
}
