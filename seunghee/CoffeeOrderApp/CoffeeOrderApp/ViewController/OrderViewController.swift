//
//  OrderViewController.swift
//  CoffeeOrderApp
//
//  Created by seungbong on 2022/03/06.
//

import UIKit

class OrderViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var quantityLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  
  var product: Product?
  var productQuantity: Int = 1 {
    didSet {
      let totalPrice = Int(product?.price ?? 0) * productQuantity
      quantityLabel.text = "\(productQuantity) 개"
      totalPriceLabel.text = "\(totalPrice) 원"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
  }
  
  private func configureView() {
    guard let product = product else { return }
    
    imageView.image = UIImage(named: product.imageName)
    productNameLabel.text = product.name
    productQuantity = 1
  }
  
  @IBAction func stepperValueChanged(_ stepper: UIStepper) {
    productQuantity = Int(stepper.value)
  }
  
  @IBAction func orderButtonDidTap(_ sender: Any) {
    
    navigationController?.popViewController(animated: true)
  }
}
