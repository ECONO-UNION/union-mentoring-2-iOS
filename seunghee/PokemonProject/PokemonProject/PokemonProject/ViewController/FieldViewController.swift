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
  @IBOutlet weak var descriptionLabel: UILabel!
  
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
    descriptionLabel.text = "이(가) 나타났다!"
    descriptionLabel.textColor = .white
  }
  
  private func fetchPokemon() {
    guard let species = pokeSpecies else { return }
    
    let urlString = NetworkConstants.pokemonAPI + "\(species.id)"
    NetworkAgent.shared.requestGET(urlString, responseType: Pokemon.Response.self) { [weak self] response in
      guard let self = self else { return }
      
      self.pokemon = Pokemon(json: response)
      self.fetchPokemonImage()
    }
  }
  
  private func fetchPokemonImage() {
    guard let pokemon = pokemon,
          let sprites = pokemon.sprites else { return }
    
    let imageUrls = [sprites.front_default, sprites.front_shiny, sprites.back_default]
    for imageUrl in imageUrls {
      ImageDownloader.shared.downloadImage(from: imageUrl ?? "") { [weak self] pokemonImage in
        guard let self = self else { return }
        
        DispatchQueue.main.async {
          if imageUrl == sprites.front_default {
            self.pokemonImageView.image = pokemonImage
            self.pokemonImageView.rotate()
          }
        }
      }
    }
  }
  
  @IBAction func throwButtonDidTap(_ sender: Any) {
    guard let pokemon = pokemon else { return}

    let randomNum = Int.random(in: 0...255)
    print("capture rate: \(pokeSpecies?.captureRate ?? 0), randomNum: \(randomNum)")
    if randomNum <= pokeSpecies?.captureRate ?? 0 {
      descriptionLabel.text = "을(를) 잡았다!"
      descriptionLabel.textColor = .orange
      User.shared.addPokemon(pokemon)
      changeImageView(url: pokemon.sprites?.front_shiny ?? "")
      dismissViewController()
    } else {
      let escapingPercentage = Double(pokeSpecies?.captureRate ?? 0) * 0.3
      if randomNum < Int(escapingPercentage) {
        descriptionLabel.text = "이(가) 도망갔다."
        descriptionLabel.textColor = .cyan
        changeImageView(url: pokemon.sprites?.back_default ?? "")
        dismissViewController()
      } else {
        descriptionLabel.text = "이(가) 잡히지 않았다."
        descriptionLabel.textColor = .white
      }
    }
  }
  
  private func dismissViewController() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
      self.navigationController?.popViewController(animated: true)
    })
  }
  
  private func changeImageView(url: String) {
    ImageDownloader.shared.downloadImage(from: url, completion: { image in
      DispatchQueue.main.async {
        self.pokemonImageView.image = image
      }
    })
  }
}
