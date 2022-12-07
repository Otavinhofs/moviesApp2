//
//  KnowFor.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import Foundation
struct KnowFor: Codable {
    var title: String?
    var overview: String?
    var poster: String?
    var popularity: Double
    var releaseDate: Date?
    var voteAvarage: Double?
    var voteCount: Int?
    
    func formatDate() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        if let releaseDate = self.releaseDate {
            return dateFormat.string(from: releaseDate)
        } else {
            return ""
        }
    }
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case poster = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case voteAvarage = "vote_average"
        case voteCount = "vote_count"
        
    }

}
