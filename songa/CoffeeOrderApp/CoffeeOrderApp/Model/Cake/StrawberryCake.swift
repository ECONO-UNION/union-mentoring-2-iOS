//
//  StrawberryCake.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class StrawberryCake: Cake {
    init(candleNumber: Int = 0) {
        super.init(name: "StrawberryCake", price: 4000, stock: 6)
        if candleNumber > 100 {
            print("초는 100개 이하로 주문해주세요.")
        }else{
            self.candleNumber = candleNumber
        }
    }
}
