//
//  NetworkManager.swift
//  URLSession Part-1 HM
//
//  Created by Dinar on 14.03.2023.
//

import Foundation

//MARK: - Link
enum Link: String {
case urlSpace = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=DEMO_KEY"
case urlImage = ""
}

//MARK: - ErrorNetwork
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

// MARK: - Class NetworManager
class  NetworkManager {
    
    static let shared = NetworkManager()
    
    init() {}
    
    // MARK: - FetchMetods
    func fetch(from url: String?, completion: @escaping(Result <DataSpace,NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No Error")
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let showSpace = try jsonDecoder.decode(DataSpace.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(showSpace))
                }
            } catch {
                completion(.failure(.decodingError))
            }
           
             
        }.resume()
        
    }

    
    
}

