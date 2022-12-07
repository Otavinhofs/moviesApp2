//
//  Json.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 02/12/22.
//

import Foundation
protocol MoviesDelegate {
    func dataError(_ error: Error?)
    func dataSucces(_ moveData: MovieResults?)
}

struct MoviesBrain {
    var delegate: MoviesDelegate?
    
    func getMovies() {
        
        let urlString = "https://api.themoviedb.org/3/trending/movie/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.dataError(error)
                    return
                }
                if let data = data {
                    let movie = self.parseJson(data)
                    self.delegate?.dataSucces(movie)
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ movies: Data) -> MovieResults? {
        let decoder = JSONDecoder()
        do{
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormater)
            let moviesDecoder = try decoder.decode(MovieResults.self, from: movies)
            
            return moviesDecoder
        } catch let error {
            print(error)
            return nil
        }
        
    }
    
    
    
}
