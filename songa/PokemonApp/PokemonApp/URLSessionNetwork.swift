//
//  URLSessionNetwork.swift
//  PokemonApp
//
//  Created by asong on 2022/04/12.
//

import Foundation

class URLSessionNetwork{
    
    static func fetchApiData<T: Decodable>(_ urlString: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> ()){
        guard let url = URL(string: urlString) else{ return }
            let session = URLSession(configuration: .default)
            let requestURL = URLRequest(url: url)
            let dataTask = session.dataTask(with: requestURL){ (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                            (200...299).contains(httpResponse.statusCode) else {
                                print("server error: \(response)")
                                return }
                
                if let safeData = data {
                    do{
                        let decodedData = try JSONDecoder().decode(T.self, from: safeData)
                        completion(.success(decodedData))
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
    }
}
