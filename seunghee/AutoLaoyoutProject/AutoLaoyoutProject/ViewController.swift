//
//  ViewController.swift
//  AutoLaoyoutProject
//
//  Created by seungbong on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var buttons: [UIButton]!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    print("뭐임요")
    
    for button in buttons {
      button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
      button.titleLabel?.numberOfLines = 1
      button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
  }


}

 
