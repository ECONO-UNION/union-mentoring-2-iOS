//
//  ViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/08.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchHabitatVC(){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HabitatsViewController") as? HabitatsViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

