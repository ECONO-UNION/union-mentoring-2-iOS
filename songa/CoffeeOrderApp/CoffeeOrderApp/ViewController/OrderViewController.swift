//
//  OrderViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/03/03.
//

import Foundation
import UIKit

class OrderViewController: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!

    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    
    @IBAction func presentStepper(_ sender: UIStepper){
        quantityLabel.text = String(Int(sender.value))+"개"
    }
}
