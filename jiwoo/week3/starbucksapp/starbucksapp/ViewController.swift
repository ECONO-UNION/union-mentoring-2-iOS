//
//  ViewController.swift
//  starbucksapp
//
//  Created by 황지우 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var detailMessageLabel: UILabel!
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeMessageLabel.numberOfLines = 2
        welcomeMessageLabel.text = "안녕하세요. 스타벅스입니다."
        detailMessageLabel.text = "회원 서비스 이용을 위해 로그인 해주세요."
        // Do any additional setup after loading the view.
    }
    


}

