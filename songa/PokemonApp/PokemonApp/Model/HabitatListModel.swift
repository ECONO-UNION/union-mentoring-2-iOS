//
//  HabitatListModel.swift
//  PokemonApp
//
//  Created by asong on 2022/04/11.
//

import Foundation
struct HabitatListModel{
    let id: Int
    let name: String
    let pokemon_species: [PokemonSpecies]
}
struct PokemonSpecies{
    let name: String
    let url: String
}
