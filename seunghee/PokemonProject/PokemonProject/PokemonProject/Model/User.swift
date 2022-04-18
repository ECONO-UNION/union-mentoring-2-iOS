//
//  User.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/17.
//

import Foundation

class User {
  private static var user: User?
  
  static var shared: User {
    if User.user == nil {
      User.user = User()
    }
    return User.user!
  }
  
  var ownedPokemonList: [Pokemon] = []
  
  func addPokemon(_ pokemon: Pokemon) {
    if ownedPokemonList.filter({$0.id == pokemon.id}).isEmpty {
      ownedPokemonList.append(pokemon)
    }
  }
}
