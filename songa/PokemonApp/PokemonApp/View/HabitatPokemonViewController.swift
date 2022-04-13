//
//  HabitatPokemonViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/12.
//

import UIKit

class HabitatPokemonViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
       
    var data: [PokemonSpecies] = []
    var habitatName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHabitatPokemonListData(name: habitatName)
    }
}
extension HabitatPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell else{ return UICollectionViewCell() }
        cell.nameLabel.text = data[indexPath.row].name
        return cell
    }
}
extension HabitatPokemonViewController{
    func getHabitatPokemonListData(name: String){
        URLSessionNetwork.fetchApiData(query: name) { [weak self] response in
            switch response{
            case .success(let listData):
                if let decodedData = listData as? HabitatListModel{
                    self?.data.append(contentsOf: decodedData.pokemon_species)
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                    return
                }
            case .failure(let data):
                print("fail", data)
            
            }
        }
    }
}
