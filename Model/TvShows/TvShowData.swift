//
//  TvShowData.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 05/12/22.
//

import Foundation

struct TvShowData: Codable {
    var name: String
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
        case name
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case releaseDate = "first_air_date"
        case voteAverage = "vote_average"
        case overview
        
    }

}
