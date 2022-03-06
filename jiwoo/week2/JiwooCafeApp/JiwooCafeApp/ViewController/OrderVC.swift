//
//  OrderVCViewController.swift
//  JiwooCafeApp
//
//  Created by 황지우 on 2022/03/06.
//

import UIKit

class OrderVC: UIViewController {
    var completionHandler: ((Int) -> Void)?
    var howMuchToBuy = 0
    
    var name: String = ""
    var price = 0
    
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var menuName: UILabel!
    
    
    @IBOutlet weak var menuPrice: UILabel!
    
    
    @IBOutlet weak var menuQuantity: UILabel!
    
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuName.text = name
        menuPrice.text = "\(price) 원"
        menuName.sizeToFit()
        menuPrice.sizeToFit()
                
    }
    
    
    @IBAction func selectQuantity(_ sender: UIStepper) {
        //menuQuantity.text =
        stepper.stepValue = Double(price)
        totalPrice.text = Int(sender.value).description + "원"
        menuQuantity.text = "\(Int(sender.value)/price)개"
        menuQuantity.sizeToFit()
        totalPrice.sizeToFit()
        howMuchToBuy = Int(sender.value)
    }
    
    @IBAction func pushOrderbutton(_ sender: Any) {
        _ = completionHandler?(howMuchToBuy)
        self.navigationController?.popViewController(animated: true)
    }
    
}
