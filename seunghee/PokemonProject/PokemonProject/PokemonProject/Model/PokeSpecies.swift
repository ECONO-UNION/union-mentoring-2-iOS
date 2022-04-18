//
//  PokeSpecies.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/16.
//

import Foundation

struct PokeSpecies {
  
  var id: Int         // id
  var name: String    // 이름
  var habitatName: String // 서식지
  var captureRate: Int // 포획률 (the higher the number, the easier the catch, 0~255)
  
  var habitat: HabitatInfo?
    
  init(json: Response) {
    self.id = json.id
    self.name = PokeSpecies.getKorName(from: json.names) ?? json.name
    self.habitat = json.habitat
    self.captureRate = json.capture_rate
    
    self.habitatName = json.habitat?.name ?? ""
  }
  
  static func getKorName(from nameList: [NameInfo]) -> String? {
    let korName = nameList.filter{$0.language.name == "ko"}.first.map({$0.name})
    return (korName?.count == 0) ? nil : korName
  }
}

// MARK: - Poke Species Property Types
extension PokeSpecies {
  
  struct Response: Codable {
    var id: Int
    var name: String
    var names: [NameInfo]
    var habitat: HabitatInfo?
    var capture_rate: Int
  }
  
  struct HabitatInfo: Codable {
    var name: String
    var url: String
  }
  
  struct NameInfo: Codable {
    var language: LanguageInfo
    var name: String
    
    struct LanguageInfo: Codable {
      var name: String
    }
  }
}
