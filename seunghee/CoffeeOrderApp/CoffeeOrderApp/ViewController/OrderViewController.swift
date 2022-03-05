//
//  OrderViewController.swift
//  CoffeeOrderApp
//
//  Created by seungbong on 2022/03/06.
//

import UIKit

protocol OrderViewControllerDelegate: AnyObject {
  func didFinishOrder(_ viewController: OrderViewController, product: Product, qunatity: Int)
}

class OrderViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var quantityLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  
  weak var delegate: OrderViewControllerDelegate?
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
    guard let product = product else { return }
    
    delegate?.didFinishOrder(self, product: product, qunatity: productQuantity)
    navigationController?.popViewController(animated: true)
  }
}
