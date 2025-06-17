//
//  MovieProvider.swift
//  Movies-iOS
//
//  Created by Mañanas on 17/6/25.
//

import Foundation


class MovieProvider {
    
    static func findMoviesByName(query: String) async -> [Movie] {
        
        let url = URL(string: "https://www.omdbapi.com/?apikey=13b99058&s=\(query)")
        
      guard let url = url else {
            print("Error building URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            return result.Search
            
        } catch {
            print(error)
            return []
        }
    }
}



