//
//  TvShowBrain.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 05/12/22.
//

import Foundation

protocol TvShowDelegate {
    func dataError(_ error: Error?)
    func dataSucces(_ moveData: TvShowResults?)
}

struct TvShowBrain {
    var delegate: TvShowDelegate?
    
    func getTvshow() {
        
        let urlString = "https://api.themoviedb.org/3/trending/tv/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let taskTvShow = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.dataError(error)
                    return
                }
                if let data = data {
                    let tvShow = self.parseTvShowJSON(data)
                    self.delegate?.dataSucces(tvShow)
                    print(data)
                }
            }
            taskTvShow.resume()
        }
    }
    
    func parseTvShowJSON(_ tvShow: Data) -> TvShowResults? {
        let decoder = JSONDecoder()
        do{
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormater)
            
            let TvShowDecoder = try decoder.decode(TvShowResults.self, from: tvShow)
            
            return TvShowDecoder
        } catch let error {
            print(error)
            return nil
        }
        
    }
    
    
    
}
