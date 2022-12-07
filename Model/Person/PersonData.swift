//
//  PersonData.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import Foundation
struct PersonData: Codable {
    var name: String?
    var popularity: Double?
    var department: String?
    var profile: String?
    var knowFor: [KnowFor]
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case popularity = "popularity"
        case department = "known_for_department"
        case profile = "profile_path"
        case knowFor = "known_for"
    }
}
