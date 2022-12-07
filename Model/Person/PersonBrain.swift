//
//  PersonBrain.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import Foundation

protocol PersonDelegate {
    func dataError(_ error: Error?)
    func dataSucces(_ moveData: PersonResults?)
}

struct PersonBrain {
    var delegate: PersonDelegate?
    
    func getPerson() {
        
        let urlString = "https://api.themoviedb.org/3/trending/person/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let personTask = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.dataError(error)
                    return
                }
                if let data = data {
                    let person = self.parsePersonJSON(data)
                    self.delegate?.dataSucces(person)
                    print(data)
                }
            }
            personTask.resume()
        }
    }
    
    func parsePersonJSON(_ person: Data) -> PersonResults? {
        let decoder = JSONDecoder()
        do {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormater)
            
            let personDecoder = try decoder.decode(PersonResults.self, from: person)

            return personDecoder
        } catch let error {
            print(error)
            return nil
        }
        
    }
    
    
    
}
