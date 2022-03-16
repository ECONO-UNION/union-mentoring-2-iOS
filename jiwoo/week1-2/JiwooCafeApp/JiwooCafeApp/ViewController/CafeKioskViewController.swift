// 1주차에 진행한 mission

import UIKit

class CafeKioskViewController: UIViewController {
    
    var cardBalance : Int = 0 // 카드의 초기 잔액은 0원
    

    var menuList : [Menu] = []// = [americano, latte, cheeseCake, browny, chocoMilk, frappe]
    
    var favoriteMenuList : [Menu] = []
    var purchasableMenuList : [Menu] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 각 메뉴 들을 menuList에 append
        appendMenus(menu: Coffee(name: "americano", price: 2000, quantity: 50, hotOption: false)) // menuList[0]
        appendMenus(menu: Coffee(name: "latte", price:3000, quantity:50, hotOption: true))
        appendMenus(menu: Cake(name: "cheese_cake", price: 5000, quantity: 50, howManyCandles: 0))
        appendMenus(menu: Cake(name: "browny", price: 4000, quantity: 50, howManyCandles: 0))
        appendMenus(menu: Beverage(name: "chocoMilk", price: 2000, quantity: 50, hasWhippedCream: false))
        appendMenus(menu: Beverage(name: "frappe", price: 3000, quantity: 50, hasWhippedCream: true)) // menuList[5]
        
        
    }

 // menuList에 메뉴를 append 해주는 함수
    func appendMenus (menu : Menu) {
        
        menuList.append(menu)
        
    }

    

    

 // 기능 1. 메뉴 주문 하기
    func orderMenu(_ menu : Menu, quantity : Int) {
        if cardBalance >= menu.price * quantity {
        // 잔액이 선택된 수량보다 많거나 같을 경우
            
            if quantity <= menu.quantity {
            // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                // 해당 메뉴의 수량 갱신
                menu.quantity -= quantity
                // 카드 잔액 갱신
                cardBalance -= menu.price*quantity
            }
            
            else {
                // 메뉴의 수량이 선택된 수량보다 적을 경우 (수량 부족)
                print ("메뉴의 수량이 부족합니다.")
                
            }
            
        }
        else {
        // 잔액이 선택된 수량보다 적을경우 (잔액부족)
            print ("잔액이 부족합니다.")
        }
    }

    // 기능 2. 카드 잔액으로 살 수 있는 메뉴 추천하는 기능
    // addPurchasableMenus : 카드 잔액으로 살 수 있는 메뉴를 purchasableMenuList에 추가
    // showPurchasableMenus : purchasableMenuList를 print
        func addPurchasableMenus () {
            
            for anymenu in menuList {
                if anymenu.price <= cardBalance{
                    purchasableMenuList.append(anymenu)
                }
            }
            
            
        }
    
        func showPurchasableMenus() {
            
            print ("잔액으로 구매 가능한 메뉴 리스트 입니다.")
            
            for purchasableMenu in purchasableMenuList {
                print(purchasableMenu)
            }
            
        
        }

        
        
    // 기능 3. 카드를 충전하는 기능
        
        func deposit (deposit : Int){
            cardBalance += deposit
            print("\(deposit)원 충전 완료, 잔액은 \(cardBalance)원입니다. ")
        }
        
    // 기능 4. 메뉴 즐겨찾기 기능
    // addFavoriteMenus : 즐겨찾기 메뉴 리스트에 해당 메뉴 객체를 append 하는 함수
    // showFavoriteMenus : 즐겨찾기 리스트에 속해 있는 메뉴 객체의 이름을 print
        
        func addFavoriteMenus (_ menu : Menu){
            
            favoriteMenuList.append(menu)
            
        }
    
        func showFavoriteMenus (){
            
            for cafemenu in favoriteMenuList {
                print (cafemenu.name)
            }
            
        }
    

   

}
