//
//  HabitatsViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/11.
//

import UIKit

class HabitatsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var habitatDataList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1..<10{
            fetchHabitatListData(id: String(i))
        }
    }
}
extension HabitatsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitatDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitatListTableViewCell", for: indexPath) as? HabitatListTableViewCell else{ return UITableViewCell() }
        cell.habitatNameLabel.text = habitatDataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HabitatPokemonViewController") as? HabitatPokemonViewController else {
            return
        }
        vc.habitatName = habitatDataList[indexPath.row]
        self.navigationController?.navigationBar.topItem?.title = ""
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
    func fetchHabitatListData(id: String){
        URLSessionNetwork.fetchApiData("https://pokeapi.co/api/v2/pokemon-habitat/\(id)/",responseType: HabitatListModel.self) { [weak self] response in
            switch response{
            case .success(let listData):
                if let decodedData = listData as? HabitatListModel{
                    self?.habitatDataList.append(decodedData.name)
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
