//
//  OrderViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/03/03.
//

import UIKit

class OrderViewController: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!

    var name: String = ""
    var price: Int = 0
    var money: Int = 0
    weak var delegate: OrderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        orderPriceLabel.text = "\(price)원"
        money = price
    }
    
    @IBAction func presentStepper(_ sender: UIStepper){
        let quantity = Int(sender.value)
        quantityLabel.text = String(quantity)+"개"
        orderPriceLabel.text = "\(quantity * price)원"
        money = quantity * price
    }
    
    @IBAction func touchOrderButton(){
        delegate?.sendOrderMoney(money)
        self.navigationController?.popViewController(animated: true)
    }
}

protocol OrderDelegate: AnyObject {
    func sendOrderMoney(_ money: Int)
}
