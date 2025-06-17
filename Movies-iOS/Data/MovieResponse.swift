//
//  MovieResponse.swift
//  Movies-iOS
//
//  Created by Mañanas on 17/6/25.
//

import Foundation

struct MovieResponse : Codable {
    let Search: [Movie]
    let totalResults: String
    let Response: String
}

struct Movie : Codable {
    
    let id: String
    let title: String
    let year: String
    let poster: String
    let plot: String?
    let runtime: String?
    let director: String?
    let genre: String?
    let country: String?
    
    
    enum CodingKeys : String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"
        case runtime = "Runtime"
        case director = "Director"
        case genre = "Genre"
        case country = "Country"
        
    }
       
}
