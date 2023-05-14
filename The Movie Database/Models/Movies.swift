//
//  Movies.swift
//  The Movie Database_Lesson 3.2
//
//  Created by Иван on 07.05.2023.
//

import Foundation

struct Movies : Decodable {
    let page : Int
    let results : [ResultsMovies]
    let totalPages : Int
    let totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultsMovies : Decodable {
    let backdropPath : String?
    let originalTitle : String
    let overview : String
    let posterPath : String
    let popularity : Double
    let releaseDate : String
    let voteAverage : Double
    let voteCount : Int
    
    enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Serials : Decodable {
    let page : Int?
    let results : [ResultsSerials]?
    let totalPages : Int?
    let totalResults : Int?

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultsSerials : Decodable {
    let backdropPath : String?
    let originalName : String
    let overview : String
    let posterPath : String
    let popularity : Double
    let firstAirDate : String
    let voteAverage : Double
    let voteCount : Int
    let originCountry : [String]

    enum CodingKeys: String, CodingKey {

        case backdropPath = "backdrop_path"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case popularity = "popularity"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
    }
}
