//
//  Pokemon.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/16.
//

import UIKit

struct Pokemon {
  var id: Int
  var name: String
  var species: SpaiesInfo?
  var sprites: SpriteInfo?
    
  var spriteImages: [UIImage] = []
  var pokeSpacies: PokeSpecies?
  
  init(json: Response) {
    self.id = json.id
    self.name = json.name
    self.species = json.species
    self.sprites = json.sprites    
  }
}

// MARK: - Poke Species Property Types
extension Pokemon {
  struct Response: Codable {
    var id: Int
    var name: String
    var species: SpaiesInfo?
    var sprites: SpriteInfo?
  }
  
  struct SpaiesInfo: Codable {
    var name: String
    var url: String
  }
  
  struct SpriteInfo: Codable {
    var back_default: String?
    var back_shiny: String?
    var front_default: String?
    var front_shiny: String?
  }
}
