//
//  PokeHabitat.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/16.
//

import Foundation

struct PokeHabitat: Codable {
  var id: Int
  var name: String
  var speciesInfoList: [PokeSpeciesInfo]
  
  var response: Response?
  
  init(json: Response) {
    self.id = json.id
    self.name = json.name
    self.speciesInfoList = json.pokemon_species ?? []
  }
}

// MARK: - Poke Species Property Types
extension PokeHabitat {
  struct Response: Codable {
    var id: Int
    var name: String
    var pokemon_species: [PokeSpeciesInfo]?
  }
  
  struct PokeSpeciesInfo: Codable {
    var name: String
    var url: String
  }
}
