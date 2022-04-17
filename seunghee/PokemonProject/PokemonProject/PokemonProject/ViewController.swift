//
//  ViewController.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/16.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var habitatNameLabel: UILabel!
  @IBOutlet weak var speciesNameLabel: UILabel!
  @IBOutlet weak var pokemonNameLabel: UILabel!
  @IBOutlet weak var spriteImage: UIImageView!
  
  var habitatList: [PokeHabitat] = []
  var speciesInfoList: [PokeHabitat.PokeSpeciesInfo] = []
  var loadedSpecies: PokeSpecies?
  var loadedPokemon: Pokemon?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchAllHabaitat()
  }

  private func fetchAllHabaitat() {
    NetworkAgent.shared.requestGET("https://pokeapi.co/api/v2/pokemon-habitat") { data in
      if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
        if let results = json["results"] as? [[String: Any]] {
          print(results)
          DispatchQueue.main.async {
            self.habitatNameLabel.text = results.first?["name"] as? String ?? ""
          }
        }
      }
    }
  }

  @IBAction func fetchHabitat(_ sender: Any) {
    guard let habiatatName = self.habitatNameLabel.text else { return }
    NetworkAgent.shared.requestGET("https://pokeapi.co/api/v2/pokemon-habitat/\(habiatatName)") { data in
      let decoder = JSONDecoder()
      if let json = try? decoder.decode(PokeHabitat.Response.self, from: data) {
        let pokeHabitat = PokeHabitat(json: json)
        self.speciesInfoList = pokeHabitat.speciesInfoList
        DispatchQueue.main.async {
          self.habitatNameLabel.textColor = .blue
        }
      }
    }
  }
  
  @IBAction func fetchSpecies(_ sender: Any) {
    let randomID = Int.random(in: 0..<speciesInfoList.count)
    NetworkAgent.shared.requestGET("https://pokeapi.co/api/v2/pokemon-species/\(randomID)") { data in
      let decoder = JSONDecoder()
      if let json = try? decoder.decode(PokeSpecies.Response.self, from: data) {
        self.loadedSpecies = PokeSpecies(json: json)
        DispatchQueue.main.async {
          self.speciesNameLabel.text = self.loadedSpecies?.name
        }
        print("catch rate: \(self.loadedSpecies?.catureRate)")
      }
    }

  }
  
  @IBAction func fetchPokemon(_ sender: Any) {
    guard let pokemonId = loadedSpecies?.id else { return }
    NetworkAgent.shared.requestGET("https://pokeapi.co/api/v2/pokemon/\(pokemonId)") { data in
      let decoder = JSONDecoder()
      if let json = try? decoder.decode(Pokemon.Response.self, from: data) {
        self.loadedPokemon = Pokemon(json: json)
        DispatchQueue.main.async {
          self.speciesNameLabel.text = self.loadedSpecies?.name
        }
        self.loadPokemonImage()
      }
    }
  }
  
  private func loadPokemonImage() {
    DispatchQueue.global().async {
      guard let urlString = self.loadedPokemon?.sprites?.front_default,
            let url = URL(string: urlString),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) else { return }
      
      DispatchQueue.main.async {
        self.spriteImage.image = image
      }
    }
  }
}

