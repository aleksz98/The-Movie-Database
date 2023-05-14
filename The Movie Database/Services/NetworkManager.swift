//
//  DataManager.swift
//  The Movie Database_Lesson 3.2
//
//  Created by Иван on 07.05.2023.
//

import Foundation
import Alamofire

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
    
    func reguestTrendingMovies(completion: @escaping(([Results]) -> ())){
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=99709c91f79d11764afb7ab67218f012"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Movies.self, from: responce.data!) {
                let movies = data.results 
                completion(movies)
            }
        }
    }
    
    func reguestTrendingSerials(completion: @escaping(([Results]) -> ())){
        let url = "https://api.themoviedb.org/3/trending/tv/week?api_key=99709c91f79d11764afb7ab67218f012"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Movies.self, from: responce.data!) {
                let serials = data.results
                completion(serials)
            }
        }
    }
}

