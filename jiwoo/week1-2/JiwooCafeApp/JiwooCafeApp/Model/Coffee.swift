
import Foundation

class Coffee : Menu {
    
    var hotOption: Bool = true
    // true: hot, false: cold
    init (name:String, price:Int, quantity:Int, hotOption:Bool){
        self.hotOption = hotOption
        super.init(name: name, price: price, quantity: quantity)
    }
}
