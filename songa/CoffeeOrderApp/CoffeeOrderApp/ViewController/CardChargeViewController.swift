//
//  CardChargeViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/03/03.
//

import UIKit

class CardChargeViewController: UIViewController{
    @IBOutlet weak var moneyLabel: UILabel!
    
    var completionHandler: ((Int) -> Void)?
    var money: Int = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func presentStepper(_ sender: UIStepper){
        moneyLabel.text = String(Int(sender.value))+"원"
        money = Int(sender.value)
    }
    
    @IBAction func touchChargeButton(_ sender: Any){
        completionHandler?(money)
        self.dismiss(animated: true, completion: nil)
    }
}
