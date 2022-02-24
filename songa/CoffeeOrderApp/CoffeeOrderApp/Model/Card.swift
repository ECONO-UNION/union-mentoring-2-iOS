//
//  Card.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation

class Card {
    var money: Int = 0
    
    func charge(chargeMoney: Int) {
        money += chargeMoney
    }
}
