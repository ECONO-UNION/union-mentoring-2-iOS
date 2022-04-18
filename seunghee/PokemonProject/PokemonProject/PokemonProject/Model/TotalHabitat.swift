//
//  TotalHabitat.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/18.
//

import Foundation

struct TotalHabitat {
  var habitatInfoList: [HabitatInfo]
    
  init(json: Response) {
    self.habitatInfoList = json.results
  }
}

// MARK: - Poke Species Property Types
extension TotalHabitat {
  struct Response: Codable {
    var results: [HabitatInfo]
  }
  
  struct HabitatInfo: Codable {
    var name: String
    var url: String
      
  }
}
