//
//  URLSessionNetwork.swift
//  PokemonApp
//
//  Created by asong on 2022/04/12.
//

import Foundation

class URLSessionNetwork{
    
    static func fetchPokemonHabitatApiData(query: String, completion: @escaping (Result<Any, Error>) -> ()){
        let urlString = "https://pokeapi.co/api/v2/pokemon-habitat/\(query)/"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let requestURL = URLRequest(url: url)
            let dataTask = session.dataTask(with: requestURL){ (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    do{
                        let decodedData = try JSONDecoder().decode(HabitatListModel.self, from: safeData)
                        completion(.success(decodedData))
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    static func fetchPokemonApiIdData(name: String, completion: @escaping (Result<Any, Error>) -> ()){
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(name)/"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let requestURL = URLRequest(url: url)
            let dataTask = session.dataTask(with: requestURL){ (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    do{
                        let decodedData = try JSONDecoder().decode(PokemonModel.self, from: safeData)
                        completion(.success(decodedData))
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
