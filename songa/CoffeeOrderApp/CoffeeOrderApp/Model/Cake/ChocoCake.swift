//
//  ChocoCake.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class ChocoCake: Cake {
    init(){
        super.init(name: "ChocoCake", price: 4000, stock: 6)
    }
    
    init(candleNumber: Int) {
        super.init(name: "ChocoCake", price: 4000, stock: 6)
        self.candleNumber = candleNumber
    }
}
