//
//  URLSessionNetwork.swift
//  PokemonApp
//
//  Created by asong on 2022/04/12.
//

import Foundation

class URLSessionNetwork{
    
    static func fetchApiData(completion: @escaping (Result<Any, Error>) -> ()){
        let urlString = "https://pokeapi.co/api/v2/pokemon-habitat/1/"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            var requestURL = URLRequest(url: url)
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
                        print(safeData.description)
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
