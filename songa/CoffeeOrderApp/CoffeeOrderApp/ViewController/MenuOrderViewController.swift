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
    var favoriteMenu: [Menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMenuList()
        setMenuList()
        order(menu: HotChoco(whippingCreamAdded: true), quantity: 5)
        checkOrderAvailableMenu()
        addFavoriteMenu(menu: VanillaLatte(isHot: false))
        showFavoriteMenuList()
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
    
    func order(menu: Menu, quantity: Int){
        if menu.stock < quantity {
            print("이 메뉴는 현재 재고가 부족합니다.")
            return
        }
        
        if (menu.price * quantity) > card.money {
            print("카드에 금액이 부족합니다.")
            return
        }
        card.money -= menu.price
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
    
    func addFavoriteMenu(menu: Menu){
        favoriteMenu.append(menu)
    }
    
    func showFavoriteMenuList(){
        var favoriteMenuListStr: String = ""
        for i in 0..<favoriteMenu.count{
            favoriteMenuListStr += favoriteMenu[i].name + " "
        }
        print("즐겨찾기 목록 : \(favoriteMenuListStr)")
    }
}
