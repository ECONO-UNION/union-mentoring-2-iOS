//
//  HabitatsViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/11.
//

import UIKit

class HabitatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension HabitatsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitatListTableViewCell", for: indexPath) as? HabitatListTableViewCell else{ return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
     
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
}
