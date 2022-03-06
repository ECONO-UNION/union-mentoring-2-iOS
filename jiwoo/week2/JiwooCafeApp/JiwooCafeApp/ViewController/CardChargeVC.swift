//
//  CardChargeVC.swift
//  JiwooCafeApp
//
//  Created by 황지우 on 2022/03/06.
//

import UIKit

class CardChargeVC: UIViewController {

    var completionHandler: ((Int) -> Void)?
    var howMuchToCharge : Int = 0
    
    @IBOutlet weak var cardbalance: UILabel!
    @IBOutlet weak var cardChargeStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardChargeStepper.wraps = true
        cardChargeStepper.autorepeat = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moneyCharge(_ sender: UIStepper) {
        
        cardbalance.text = Int(sender.value).description
        cardbalance.sizeToFit()
        howMuchToCharge = Int(sender.value)
        
    }
    
    
    @IBAction func chargeButton(_ sender: Any) {
        _ = completionHandler?(howMuchToCharge)
        self.dismiss(animated: true, completion: nil)
        

    }
    
}
