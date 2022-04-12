//
//  HabitatListModel.swift
//  PokemonApp
//
//  Created by asong on 2022/04/11.
//

import Foundation

struct HabitatListModel: Decodable{
    let id: Int
    let name: String
    let pokemon_species: [PokemonSpecies]
}

struct PokemonSpecies: Decodable{
    let name: String
    let url: String
}
