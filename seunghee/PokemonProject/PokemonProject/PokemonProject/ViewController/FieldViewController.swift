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
  
  enum CatchResult {
    case captured
    case miss
    case runAway
    
    var description: String {
      switch self {
      case .captured: return "을(를) 잡았다!"
      case .miss:     return "이(가) 잡히지 않았다."
      case .runAway:  return "이(가) 도망갔다."
      }
    }
    
    var textColor: UIColor {
      switch self {
      case .captured: return .orange
      case .miss:     return .black
      case .runAway:  return .cyan
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchPokemon()
    configureView()
  }
  
  private func configureView(){
    pokemonNameLabel.text = pokeSpecies?.name ?? "??"
    descriptionLabel.text = "이(가) 나타났다!"
    descriptionLabel.textColor = .black
  }
  
  private func fetchPokemon() {
    guard let species = pokeSpecies else { return }
    
    let urlString = NetworkConstants.pokemonAPI + "\(species.id)"
    NetworkAgent.shared.requestGET(urlString, responseType: Pokemon.Response.self) { [weak self] response in
      guard let self = self else { return }
      
      self.pokemon = Pokemon(json: response)
      self.pokemon?.pokeSpacies = self.pokeSpecies
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
            self.pokemonImageView.startRotate()
          }
        }
      }
    }
  }
  
  @IBAction func throwButtonDidTap(_ sender: Any) {
    let captureResult = getCatchResult()
    updateView(state: captureResult)
  }
  
  private func getCatchResult() -> CatchResult {
    let captureRate: Int = pokeSpecies?.captureRate ?? 0
    let runAwayRate: Int = Int(Double(255 - captureRate) * 0.3)
    let random = Int.random(in: 0...255)
    print("\(random) / \(captureRate) / \(runAwayRate)")

    if random <= captureRate {
      return .captured
    } else if random <= runAwayRate {
      return .runAway
    } else {
      return .miss
    }
  }
  
  private func updateView(state: CatchResult) {
    guard let pokemon = self.pokemon else { return }
    descriptionLabel.text = state.description
    descriptionLabel.textColor = state.textColor
    
    switch state {
    case .captured:
      User.shared.addPokemon(pokemon)
      changeImageView(url: pokemon.sprites?.front_shiny ?? "", isRotate: false)
      dismissViewController()
    case .runAway:
      changeImageView(url: pokemon.sprites?.back_default ?? "", isRotate: false)
      dismissViewController()
    case .miss:
      break
    }
  }
  
  private func changeImageView(url: String, isRotate: Bool = false) {
    ImageDownloader.shared.downloadImage(from: url, completion: { image in
      DispatchQueue.main.async {
        self.pokemonImageView.image = image
        if isRotate {
          self.pokemonImageView.startRotate()
        } else {
          self.pokemonImageView.stopRotate()
        }
      }
    })
  }
  
  private func dismissViewController() {
    self.view.isUserInteractionEnabled = false
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
      self.navigationController?.popViewController(animated: true)
    })
  }
}
