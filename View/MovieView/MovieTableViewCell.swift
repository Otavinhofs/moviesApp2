//
//  TableViewCell.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 02/12/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var dateMovie: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var votes: UILabel!
    
    var urlImage = "https://image.tmdb.org/t/p/w500"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configCell(_ movie: Movies) {
        background.layer.cornerRadius = 30
        dateMovie.text = movie.formatDate()
        popularity.text = String(movie.voteAverage)
        votes.text = String(movie.voteCount)
        movieName.text = movie.title
        descriptionMovie.text = movie.overview
        movieImage.setImage(urlAdress: urlImage + movie.posterPath)
    }

}
