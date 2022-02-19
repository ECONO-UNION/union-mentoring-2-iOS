//
//  Americano.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import Foundation

final class Americano: Coffee {
    init() {
        super.init(name: "아메리카노",
                   price: 4500,
                   imageName: "coffee")
    }
}
