//
//  MenuOrderViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import Foundation
import UIKit

class MenuOrderViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        showMenuList()
    }
    
    func showMenuList(){
        print("Coffee - Americano, VanillaLatte")
        print("Beverage - Frappuccino, HotChoco")
        print("Cake - StrawberryCake, ChocoCake")
    }
    
    
}
