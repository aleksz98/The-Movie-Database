//
//  DataManager.swift
//  The Movie Database_Lesson 3.2
//
//  Created by Иван on 07.05.2023.
//

import Foundation

enum Link {
    case moviesUrl
    case serialsUrl
    
    var url: URL {
        switch self {
        case .moviesUrl:
            return URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=99709c91f79d11764afb7ab67218f012")!
        case .serialsUrl:
            return URL(string: "https://api.themoviedb.org/3/trending/tv/week?api_key=99709c91f79d11764afb7ab67218f012")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMovies<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

