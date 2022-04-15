//
//  MenuSelectVC.swift
//  JiwooCafeApp
//
//  Created by 황지우 on 2022/03/05.
//

import UIKit

class MenuSelectVC: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var cardMoney : Int = 0 // 카드의 초기 잔액은 0원
    

    var menuList : [Menu] = []
    
    var favoriteMenuList : [Menu] = []
    var purchasableMenuList : [Menu] = []
    
    @IBOutlet weak var cardBalance: UILabel!
    
 
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendMenus(menu: Coffee(name: "americano", price: 2000, quantity: 50, hotOption: false)) // menuList[0]
        appendMenus(menu: Coffee(name: "latte", price:3000, quantity:50, hotOption: true))
        appendMenus(menu: Cake(name: "cheese_cake", price: 5000, quantity: 50, howManyCandles: 0))
        appendMenus(menu: Cake(name: "browny", price: 4000, quantity: 50, howManyCandles: 0))
        appendMenus(menu: Beverage(name: "chocoMilk", price: 2000, quantity: 50, hasWhippedCream: false))
        appendMenus(menu: Beverage(name: "frappe", price: 3000, quantity: 50, hasWhippedCream: true)) // menuList[5]
        
        menuTableView.rowHeight = 150

        
    }
    // menuList에 메뉴를 append 해주는 함수
    func appendMenus (menu : Menu) {
           
           menuList.append(menu)
           
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? menuCell
             
        else {return UITableViewCell()}
        
        cell.nameLabel.text = menuList[indexPath.row].name
        cell.nameLabel.sizeToFit()
        cell.priceLabel.text = "\(menuList[indexPath.row].price) 원"
        cell.priceLabel.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let orderVC = self.storyboard?.instantiateViewController(withIdentifier: "Order") as? OrderVC else{return }
        orderVC.name = menuList[indexPath.row].name
        orderVC.price = menuList[indexPath.row].price
        orderVC.completionHandler = {
            howMuchToBuy in
            self.cardMoney -= howMuchToBuy
            self.cardBalance.text = String(self.cardMoney)
            self.cardBalance.sizeToFit()
        }
        
        self.navigationController?.pushViewController(orderVC, animated: true)
        
        
    }
    
  
    @IBAction func CardChargeGo(_ sender: UIButton) {
        let newVC = self.storyboard?.instantiateViewController(identifier: "CardCharge") as? CardChargeVC
            
        newVC?.completionHandler = {
            howMuchToCharge in
            self.cardMoney += howMuchToCharge
            self.cardBalance.text = String(self.cardMoney)
            self.cardBalance.sizeToFit()
        }
            newVC?.modalTransitionStyle = .coverVertical
            newVC?.modalPresentationStyle = .automatic
            self.present(newVC!, animated: true, completion: nil)
    }
    

    

}

// custom table cell

class menuCell:UITableViewCell {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!

}
