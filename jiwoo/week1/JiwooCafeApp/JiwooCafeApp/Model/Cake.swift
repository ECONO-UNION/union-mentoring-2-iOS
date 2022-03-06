

import Foundation

class Cake : Menu {
    
    var howmanyCandles : Int = 0
    
    init(name: String, price: Int, quantity: Int, howmanyCandles: Int) {
        
        self.howmanyCandles = howmanyCandles
        super.init(name: name, price: price, quantity: quantity)
        
    }
}
