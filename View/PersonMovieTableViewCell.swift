//
//  PersonMovieTableViewCell.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit

class PersonMovieTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var votesCount: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var urlImage = "https://image.tmdb.org/t/p/w500"
    
    func configPersonMovieCell(_ personMovie: KnowFor?) {
        background.layer.cornerRadius = 30
        title.text = personMovie?.title ?? ""
        descriptions.text = personMovie?.overview ?? ""
        popularity.text = String(personMovie?.popularity ?? 0)
        dateLabel.text = personMovie?.formatDate()
        votesCount.text = String(personMovie?.voteCount ?? 0)
        
        if personMovie?.poster != nil {
            movieImage.setImage(urlAdress: urlImage + (personMovie?.poster ?? ""))
        }
    }

}
