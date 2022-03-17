
import Foundation

class Menu {
    var name: String = ""
    var price: Int = 0
    var quantity: Int = 50
   
   //initializing
    init(name: String, price: Int, quantity: Int){
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}
