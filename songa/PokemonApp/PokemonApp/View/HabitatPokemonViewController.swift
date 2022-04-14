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
    var idList: [String: Int] = [:]
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
        cell.pokemonImageView.setImageWithUrl("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(idList[data[indexPath.row].name] ?? 0)).png")
        return cell
    }
}
extension HabitatPokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
extension HabitatPokemonViewController{
    func getHabitatPokemonListData(name: String){
        URLSessionNetwork.fetchApiData(query: name) { [weak self] response in
            switch response{
            case .success(let listData):
                if let decodedData = listData as? HabitatListModel{
                    self?.data.append(contentsOf: decodedData.pokemon_species)
                    print(decodedData.pokemon_species)
                    for pokemon in decodedData.pokemon_species{
                        self?.getPokemonId(name: pokemon.name)
                    }
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
    
    func getPokemonId(name: String){
        URLSessionNetwork.getPokemonIdData(name: name) { [weak self] response in
            switch response{
            case .success(let data):
                if let decodedData = data as? PokemonModel{
                    self?.idList[name] = decodedData.id
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
