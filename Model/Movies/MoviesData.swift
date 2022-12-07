//
//  MoviesData.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 02/12/22.
//

import Foundation
struct Movies: Codable {
    var title: String
    var posterPath: String
    var voteCount: Int
    var releaseDate: Date?
    var voteAverage: Double
    var overview: String
    
    func formatDate() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        if let releaseDate = self.releaseDate {
            return dateFormat.string(from: releaseDate)
        } else {
            return ""
        }
    }
    enum CodingKeys:String, CodingKey {
        case title
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case overview
        
    }
}

