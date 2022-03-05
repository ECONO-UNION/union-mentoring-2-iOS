

import Foundation

class Beverage : Menu {
    
    var creamOption: Bool = true
    // true: 휘핑크림 올라간, false: 휘핑크림 안올라간
    
    init(name:String, price: Int, quantity: Int, creamOption:Bool ){
    
    self.creamOption = creamOption
    super.init(name: name, price: price, quantity: quantity)
        
    }
    
}
