//
//  AdminViewController.swift
//  CoffeeOrderApp
//
//  Created by seunghee on 2022/02/16.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var menuPickerView: UIPickerView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuPickerView.delegate = self
    }
    
    @IBAction func stepperValueDidChange(_ sender: UIStepper) {
        let value = Int(sender.value)
        amountLabel.text = String(value)
    }
    
    @IBAction func stockAdditionButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: {
            // 재고 업데이트
        })
    }
}

extension AdminViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return productList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return productList[row].name
    }
}
