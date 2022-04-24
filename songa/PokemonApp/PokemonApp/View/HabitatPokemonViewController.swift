//
//  HabitatPokemonViewController.swift
//  PokemonApp
//
//  Created by asong on 2022/04/12.
//

import UIKit

class HabitatPokemonViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var habitatNameLabel: UILabel!
    
    var pokemonSpeciesList: [PokemonSpecies] = []
    var pokemonNameIdDict: [String: Int] = [:]
    var habitatName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHabitatPokemonListData(name: habitatName)
        habitatNameLabel.text = habitatName + "의 포켓몬들!"
    }
}
extension HabitatPokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonSpeciesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell else{ return UICollectionViewCell() }
        cell.nameLabel.text = pokemonSpeciesList[indexPath.row].name
        cell.pokemonImageView.setImageWithUrl("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(pokemonNameIdDict[pokemonSpeciesList[indexPath.row].name] ?? 0)).png")
        return cell
    }
}

extension HabitatPokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
extension HabitatPokemonViewController{
    func fetchHabitatPokemonListData(name: String){
        URLSessionNetwork.fetchApiData("https://pokeapi.co/api/v2/pokemon-habitat/\(name)/",responseType: HabitatListModel.self) { [weak self] response in
            switch response{
            case .success(let listData):
                if let decodedData = listData as? HabitatListModel{
                    self?.pokemonSpeciesList.append(contentsOf: decodedData.pokemon_species)
                    for pokemon in decodedData.pokemon_species{
                        self?.fetchPokemonId(name: pokemon.name)
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
    
    func fetchPokemonId(name: String){
        URLSessionNetwork.fetchApiData("https://pokeapi.co/api/v2/pokemon/\(name)/", responseType: PokemonModel.self) { [weak self] response in
            switch response{
            case .success(let data):
                if let decodedData = data as? PokemonModel{
                    self?.pokemonNameIdDict[name] = decodedData.id
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else{ return }
                        for i in 0..<self.pokemonSpeciesList.count{
                            if self.pokemonSpeciesList[i].name == name{
                                let indexPath = Array(repeating: IndexPath(item: i, section: 0), count: 1)
                                self.collectionView.reloadItems(at: indexPath)
                                break
                            }
                        }
                        
                    }
                    return
                }
            case .failure(let data):
                print("fail", data)
                
            }
        }
    }
}
