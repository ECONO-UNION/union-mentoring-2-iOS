//
//  NetworkAgent.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/16.
//

import Foundation

class NetworkAgent {
  
  enum NetworkError: Error {
    case invalidUrl
    case serverError
  }
  
  static var shared = NetworkAgent()
  
  func requestGET(_ urlString: String, completion: @escaping (Data)->Void) {
    guard let url = URL(string: urlString) else { return }
    
    let urlRequest = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if let error = error {
        self.handledClientError(error)
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
              self.handledServerError(response)
              return
      }
      
      guard let data = data else { return }
      completion(data)
      
      let decoder = JSONDecoder()
      if let json = try? decoder.decode(PokeSpecies.Response.self, from: data) {
        
      }
    }
    task.resume()
  }
  
  func requestGET<T: Codable>(_ urlString: String,
                              responseType: T.Type,
                              completion: @escaping (T)->Void) {
    guard let url = URL(string: urlString) else { return }
    
    let urlRequest = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if let error = error {
        self.handledClientError(error)
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
              self.handledServerError(response)
              return
      }
      
      guard let data = data else { return }
      let decoder = JSONDecoder()
      if let json = try? decoder.decode(T.self, from: data) {
        completion(json)
      }
    }
    task.resume()
  }
  
  // MARK: - Error Handling
  private func handledClientError(_ error: Error) {
    print("[client] \(error.localizedDescription)")
  }
  
  private func handledServerError(_ response: URLResponse?) {
    print("[server] \(response?.description ?? "")")
  }
}
