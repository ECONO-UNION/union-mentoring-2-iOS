//
//  Cake.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import Foundation

class Cake: Product {
    var numberOfStock: UInt = 0
    
    func addStock(numberOfNewStock: UInt) {
        self.numberOfStock += numberOfNewStock
    }
}
