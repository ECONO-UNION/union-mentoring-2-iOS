//
//  MenuOrderViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation
import UIKit

class MenuOrderViewController: UIViewController{
    var card: Card = Card(money: 5000)
    var menuList: [Menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMenuList()
        setMenuList()
    }
    
    func showMenuList(){
        print("Coffee - Americano, VanillaLatte")
        print("Beverage - Frappuccino, HotChoco")
        print("Cake - StrawberryCake, ChocoCake")
    }
    
    func setMenuList(){
        menuList.append(Frappuccino())
        menuList.append(HotChoco())
        menuList.append(StrawberryCake())
        menuList.append(ChocoCake())
        menuList.append(Americano())
        menuList.append(VanillaLatte())
    }
    
    func order(orderMenu: Menu, quantity: Int){
        
    }
    
    func checkOrderAvailableMenu(){
        var orderAvailableMenuName: String = ""
        for i in 0..<menuList.count{
            if menuList[i].price < card.money {
                orderAvailableMenuName += menuList[i].name + " "
            }
        }
        print("현재 금액으로 주문할 수 있는 메뉴는 \(orderAvailableMenuName)입니다.")
    }
}
