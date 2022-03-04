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
    var money: Int = 0
    var delegate: OrderDelegate?
    var completionHandler: ((Int) -> Void)?
    
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
        money = price
    }
    
    @IBAction func touchOrderButton(){
        _ = completionHandler?(money)
        self.navigationController?.popViewController(animated: true)
    }
}

protocol OrderDelegate {
    func setPresentOrderPrice(price: Int)
}
