//
//  PokeSpecies.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/16.
//

import Foundation

struct PokeSpecies: Codable {
  
  var id: Int
  var name: String
  var habitatName: String // 서식지
  var captureRate: Int // 포획률 (the higher the number, the easier the catch, 0~255)
  var type: String
  var descriptions: [String]
  var habitat: NameUrlInfo?
    
  init(json: Response) {
    self.id = json.id
    self.name = PokeSpecies.korLanguage(from: json.names) ?? json.name
    self.type = PokeSpecies.korType(from: json.genera)
    self.habitat = json.habitat
    self.captureRate = json.capture_rate
    self.habitatName = json.habitat?.name ?? ""
    self.descriptions = PokeSpecies.descriptionList(from: json.flavor_text_entries)
  }
  
  
  static func korLanguage(from nameList: [LanguageInfo]) -> String? {
    let korName = nameList.filter{$0.language.name == "ko"}.first.map({$0.name})
    return (korName?.count == 0) ? nil : korName
  }
  
  static func korType(from generaInfo: [GeneraInfo]) -> String {
    return generaInfo.filter{$0.language.name == "ko"}.first.map({$0.genus}) ?? "???"
  }
  
  static func descriptionList(from infoList: [DescriptionInfo]) -> [String] {
    var list: [String] = []
    for info in infoList {
      if info.language.name == "ko" && list.contains(info.flavor_text) == false {
        list.append(info.flavor_text)
      }
    }
    return list
  }
}

// MARK: - Poke Species Property Types
extension PokeSpecies {
  
  struct Response: Codable {
    var id: Int
    var name: String
    var names: [LanguageInfo]
    var habitat: NameUrlInfo?
    var capture_rate: Int
    var flavor_text_entries: [DescriptionInfo]
    var genera: [GeneraInfo]
  }
  
  struct NameUrlInfo: Codable {
    var name: String
    var url: String
  }
  
  struct LanguageInfo: Codable {
    var name: String
    var language: NameUrlInfo
  }
  
  struct DescriptionInfo: Codable {
    var flavor_text: String
    var language: NameUrlInfo
    var version: NameUrlInfo
  }
  
  struct GeneraInfo: Codable {
    var genus: String
    var language: NameUrlInfo
  }
}


