//
//  OrderViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/03/03.
//

import Foundation
import UIKit

class OrderViewController: UIViewController, OrderDelegate{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!

    var name: String = ""
    var price: Int = 0
    var delegate: OrderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        nameLabel.text = name
        orderPriceLabel.text = "\(price)원"
    }
    
    @IBAction func presentStepper(_ sender: UIStepper){
        let quantity = Int(sender.value)
        quantityLabel.text = String(quantity)+"개"
        delegate?.setPresentOrderPrice(price: quantity * price)
    }
    
    func setPresentOrderPrice(price: Int) {
        orderPriceLabel.text = "\(price)원"
        self.price = price
    }
    
    @IBAction func touchOrderButton(){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuViewController else {
            return
        }
        vc.card.money -= price
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

protocol OrderDelegate {
    func setPresentOrderPrice(price: Int)
}
