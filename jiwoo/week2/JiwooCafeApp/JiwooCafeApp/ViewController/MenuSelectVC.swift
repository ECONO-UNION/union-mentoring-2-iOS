//
//  MenuKindSelectVC.swift
//  JiwooCafeApp
//
//  Created by 황지우 on 2022/03/05.
//

import UIKit

class MenuSelectVC: UIViewController, UITableViewDataSource,UITableViewDelegate {
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
    
    
    var cardMoney = 0
    
    @IBOutlet weak var cardBalance: UILabel!
    
 
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.rowHeight = 150

        
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
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
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
