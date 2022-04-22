//
//  ChargingViewController.swift
//  CoffeeOrderApp
//
//  Created by seungbong on 2022/03/06.
//

import UIKit

class ChargingViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var amountLabel: UILabel!
  
  var completion: ((Int)->Void)?
  var amount: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func stepperValudChanged(_ sender: UIStepper) {
    amount = Int(sender.value) * 10000
    amountLabel.text = "\(amount) 원"
  }
  
  @IBAction func chargeButtonDidTap(_ sender: Any) {
    completion?(amount)
    dismiss(animated: true, completion: nil)
  }
}
