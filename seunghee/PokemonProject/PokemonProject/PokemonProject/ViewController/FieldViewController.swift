//
//  FieldViewController.swift
//  PokemonProject
//
//  Created by seunghee on 2022/04/18.
//

import UIKit

class FieldViewController: UIViewController {
  
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var pokemonNameLabel: UILabel!
  
  static let id = "FieldViewController"
  
  var pokeSpecies: PokeSpecies?
  var pokemon: Pokemon?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchPokemon()
    configureView()
  }
  
  private func configureView(){
    pokemonNameLabel.text = pokeSpecies?.name ?? "??"
  }
  
  private func fetchPokemon() {
    guard let species = pokeSpecies else { return }
    
    let urlString = NetworkConstants.pokemonAPI + "\(species.id)"
    NetworkAgent.shared.requestGET(urlString, responseType: Pokemon.Response.self) { [weak self] response in
      guard let self = self else { return }
      
      self.pokemon = Pokemon(json: response)
      
      self.loadPokemonImage()
    }
  }
  
  private func loadPokemonImage() {
    let iamgeUrl = pokemon?.sprites?.front_default ?? ""
    ImageDownloader.shared.downloadImage(from: iamgeUrl) { [weak self] pokemonImage in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        self.pokemonImageView.image = pokemonImage
        self.pokemonImageView.rotate()
      }
    }
  }
  
  @IBAction func throwButtonDidTap(_ sender: Any) {
    guard let pokemon = pokemon else { return}

    let randomNum = Int.random(in: 0...255)
    print("capture rate: \(pokeSpecies?.captureRate ?? 0), randomNum: \(randomNum)")
    if randomNum <= pokeSpecies?.captureRate ?? 0 {
      print("\(pokemon.name) 을(를) 잡았다!")
      User.shared.addPokemon(pokemon)
      dismiss(animated: true, completion: nil)
    } else {
      let escapingPercentage = Double(pokeSpecies?.captureRate ?? 0) * 0.1
      if randomNum < Int(escapingPercentage) {
        print("\(pokemon.name) 이(가) 도망갔다!")
      } else {
        print("\(pokemon.name) 이(가) 잡히지 않았다.")
      }
    }
  }
}
