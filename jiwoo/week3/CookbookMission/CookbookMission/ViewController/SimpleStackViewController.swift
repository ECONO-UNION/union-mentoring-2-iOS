//
//  SimpleStackViewController.swift
//  CookbookMission
//
//  Created by 황지우 on 2022/03/17.
//

import UIKit

class SimpleStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToNestedStackView(_ sender: UIButton) {
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier: "NestedStackViewController") as? NestedStackViewController else { return  }
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
