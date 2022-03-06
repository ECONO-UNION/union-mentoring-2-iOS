//
//  CafeKioskViewController.swift
//  JiwooCafeApp
//
//  Created by 황지우 on 2022/03/05.
//

import UIKit

class CafeKioskViewController: UIViewController {
    
    var cardBalance : Int = 0 // 카드의 초기 잔액은 0원
    

    // Coffee 타입의 메뉴
    var americano = Coffee(name: "americano", price: 2000, quantity: 50, hotOption: false)
    var latte = Coffee(name: "latte", price:3000, quantity:50, hotOption: true)
    
    // Cake 타입의 메뉴
    var cheeseCake = Cake(name: "cheese_cake", price: 5000, quantity: 50, howmanyCandles: 0)
    var browny = Cake(name: "browny", price: 4000, quantity: 50, howmanyCandles: 0)

    // Beverage 타입의 메뉴
    var chocoMilk = Beverage(name: "chocoMilk", price: 2000, quantity: 50, creamOption: false)
    var frappe = Beverage(name: "frappe", price: 3000, quantity: 50, creamOption: true)

    lazy var menuList : [Menu] = [americano, latte, cheeseCake, browny, chocoMilk, frappe]

    lazy var menuNameList : [String] = [americano.name, latte.name, cheeseCake.name, browny.name, frappe.name]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
 // 기능 1. 메뉴 주문 하기
 // 1-1. 메뉴 종류 고르기
        
        func selectMenuKind (menukind : Int) {
            
            switch menukind {
                // 0 - 커피 메뉴 종류, 1 - 음료 메뉴 종류, 2 - 케익 메뉴 종류
            case 0:
                print ("커피 메뉴를 선택해주세요")
                // selectCoffeeMenu
            case 1:
                print ("음료 메뉴를 선택해주세요.")
                // selectBeverageMenu
            case 2:
                print ("케익 메뉴를 선택해주세요.")
                // selectCakeMenu
            default :
                print ("존재하지 않는 메뉴 종류입니다.")
            }
            
        }
    // 1-2.
    //커피 메뉴 선택하기
        func selectCoffeeMenu (coffeemenu : Int) {
            switch coffeemenu {
                // 0 - 아메리카노, 1 - 라떼
            case 0:
                print ("아메리카노의 수량과 옵션을 선택해주세요")
                print ("옵션 : true - hot, false - ice")
                // orderAmericano code
            case 1:
                print ("라떼의 수량과 옵션을 선택해주세요")
                print ("옵션 : true - hot, false - ice")
                // orderLatte code
            default:
                print ("존재하지 않는 메뉴 입니다.")
            
            }
        }

     // 음료 메뉴 선택하기
        func selectBeverageMenu (beveragemenu : Int){
            switch beveragemenu {
                // 0 - 초코우유, 1 - 프라페
            case 0:
                print ("초코우유의 수량과 옵션을 선택해주세요")
                print ("옵션 : true - 휘핑크림 넣기 , false - 휘핑크림 빼기")
                // orderChocomilk code
            case 1:
                print ("프라페의 수량과 옵션을 선택해주세요")
                print ("옵션 : true - 휘핑크림 넣기 , false - 휘핑크림 빼기")
                // orderFrappe code
            default:
                print ("존재하지 않는 메뉴 입니다.")
            
            }
            
        }
        
        // 케익 메뉴 선택하기
           func selectCakeMenu (cakemenu : Int){
               switch cakemenu {
                   // 0 - 치즈케익, 1 - 브라우니
               case 0:
                   print ("치즈케익의 수량과 초 개수를 선택해주세요")
                   // orderCheesecake code
               case 1:
                   print ("브라우니의 수량과 초 개수를 선택해주세요")
                   // orderBrowny code
               default:
                   print ("존재하지 않는 메뉴 입니다.")
               
               }
               
           }

    // 1-3 메뉴 주문하기
    // 아메리카노

        func orderAmericano (quantity : Int, option : Bool) {
            
            if cardBalance >= americano.price * quantity {
            // 잔액이 선택된 수량보다 많거나 같을 경우
                if quantity <= americano.quantity {
                // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                    if option == true {
                        print("아메리카노를 \(quantity)개 주문 성공, option - hot")
                    }
                    else {
                        print ("아메리카노를 \(quantity)개 주문 성공, option - ice")
                    }
                    // 해당 음료의 수량 갱신
                    americano.quantity -= quantity
                    // 카드 잔액 갱신
                    cardBalance -= americano.price*quantity
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
        
    // 라떼
        
        func orderLatte (quantity : Int, option : Bool) {
            
            if cardBalance >= latte.price * quantity {
            // 잔액이 선택된 수량보다 많거나 같을 경우
                if quantity <= latte.quantity {
                // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                    if option == true {
                        print("라떼를 \(quantity)개 주문 성공, option - hot")
                    }
                    else {
                        print ("라떼를 \(quantity)개 주문 성공, option - ice")
                    }
                    // 해당 음료의 수량 갱신
                    latte.quantity -= quantity
                    // 카드 잔액 갱신
                    cardBalance -= americano.price*quantity
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
        
    // 초코우유
        
        func orderChocomilk (quantity : Int, option : Bool) {
            
            if cardBalance >= chocoMilk.price * quantity {
            // 잔액이 선택된 수량보다 많거나 같을 경우
                if quantity <= chocoMilk.quantity {
                // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                    if option == true {
                        print("초코우유를 \(quantity)개 주문 성공, option - 휘핑크림 O")
                    }
                    else {
                        print ("초코우유를 \(quantity)개 주문 성공, option - 휘핑크림 X")
                    }
                    // 해당 음료의 수량 갱신
                    chocoMilk.quantity -= quantity
                    // 카드 잔액 갱신
                    cardBalance -= chocoMilk.price*quantity
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

    // 프라페
            
            func orderFrappe (quantity : Int, option : Bool) {
                
                if cardBalance >= frappe.price * quantity {
                // 잔액이 선택된 수량보다 많거나 같을 경우
                    if quantity <= frappe.quantity {
                    // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                        if option == true {
                            print("프라페를 \(quantity)개 주문 성공, option - 휘핑크림 O")
                        }
                        else {
                            print ("프라페를 \(quantity)개 주문 성공, option - 휘핑크림 X")
                        }
                        // 해당 음료의 수량 갱신
                        frappe.quantity -= quantity
                        // 카드 잔액 갱신
                        cardBalance -= frappe.price*quantity
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
        
    // 치즈케익
        
        func orderCheesecake (quantity : Int, option : Int) {
            
            if cardBalance >= cheeseCake.price * quantity {
            // 잔액이 선택된 수량보다 많거나 같을 경우
                if quantity <= cheeseCake.quantity {
                // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                    if option <= 100 {
                        print("치즈케익을 \(quantity)개 주문 성공, 초 개수 : \(option) 개")
                        // 해당 음료의 수량 갱신
                        frappe.quantity -= quantity
                        // 카드 잔액 갱신
                        cardBalance -= frappe.price*quantity
                    }
                    else {
                        print ("초의 개수는 100개 이하로 선택 가능합니다.")
                    }
                   
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

    // 브라우니
            
        func orderBrowny (quantity : Int, option : Int) {
            
            if cardBalance >= browny.price * quantity {
            // 잔액이 선택된 수량보다 많거나 같을 경우
                if quantity <= browny.quantity {
                // 선택한 음료의 수량이 해당 음료의 잔여 수량보다 적거나 같을 경우
                    if option <= 100 {
                        print("브라우니를 \(quantity)개 주문 성공, 초 개수 : \(option) 개")
                        // 해당 음료의 수량 갱신
                        browny.quantity -= quantity
                        // 카드 잔액 갱신
                        cardBalance -= browny.price*quantity
                    }
                    else {
                        print ("초의 개수는 100개 이하로 선택 가능합니다.")
                    }
                   
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
        
        func menuRecommend () {
            
            var recommendList : [String] = []
            
            for anymenu in menuList {
                if anymenu.price <= cardBalance{
                    recommendList.append(anymenu.name)
                }
            }
            
            print ("잔액으로 구매 가능한 메뉴 리스트 입니다.")
            
            for recommendedMenu in recommendList {
                print(recommendedMenu)
            }
            
        }

        
        
    // 기능 3. 카드를 충전하는 기능
        
        func deposit (deposit : Int){
            cardBalance += deposit
            print("\(deposit)원 충전 완료, 잔액은 \(cardBalance)원입니다. ")
        }
        
    // 기능 4. 메뉴 즐겨찾기 기능
        func favoritesList (menuname : String){
            var favMenuList : [String] = []
            let favMenuIndex = menuNameList.firstIndex(of: menuname)
            if let selectedFavMenuIndex = favMenuIndex{
                favMenuList.append(menuList[selectedFavMenuIndex].name)
            }
            else {
                print("선택하신 메뉴는 없는 메뉴 입니다.")
            }
            print ("현재 메뉴 즐겨찾기 리스트 입니다.")
            
            for cafemenu in favMenuList {
                print (cafemenu)
            }
        }
    

   

}
