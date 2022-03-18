

import Foundation

class Cake : Menu {
    
    var howManyCandles : Int = 0
    
    init(name: String, price: Int, quantity: Int, howManyCandles: Int) {
        
        self.howManyCandles = howManyCandles
        super.init(name: name, price: price, quantity: quantity)
        
    }
}
