

import Foundation

class Beverage : Menu {
    
    var hasWhippedCream: Bool = true
    // true: 휘핑크림 올라간, false: 휘핑크림 안올라간
    
    init(name:String, price: Int, quantity: Int, hasWhippedCream:Bool ){
    
    self.hasWhippedCream = hasWhippedCream
    super.init(name: name, price: price, quantity: quantity)
        
    }
    
}

