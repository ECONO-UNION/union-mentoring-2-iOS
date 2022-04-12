//
//  HabitatsViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/11.
//

import UIKit

class HabitatsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [String] = []
    var pokemonData: [PokemonSpecies] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getHabitatListData()
    }
}
extension HabitatsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitatListTableViewCell", for: indexPath) as? HabitatListTableViewCell else{ return UITableViewCell() }
        cell.habitatNameLabel.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HabitatPokemonViewController") as? HabitatPokemonViewController else {
            return
        }
        vc.data = pokemonData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
     
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
}
extension HabitatsViewController{
    func getHabitatListData(){
        URLSessionNetwork.fetchApiData { [weak self] response in
            switch response{
            case .success(let listData):
                if let decodedData = listData as? HabitatListModel{
                    self?.tableData.append(decodedData.name)
                    self?.pokemonData.append(contentsOf: decodedData.pokemon_species)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                    return
                }
            case .failure(let data):
                print("fail", data)
            
            }
        }
    }
}
