//
//  StrawberryCake.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class StrawberryCake: Cake {
    init(){
        super.init(name: "StrawberryCake", price: 4000, stock: 6)
    }
    
    init(candleNumber: Int) {
        super.init(name: "StrawberryCake", price: 4000, stock: 6)
        if candleNumber <= 100 {
            self.candleNumber = candleNumber
        }else{
            print("초는 100개 이하로 주문해주세요.")
        }
    }
}
