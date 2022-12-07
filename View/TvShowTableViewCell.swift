//
//  TvShowTableViewCell.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 05/12/22.
//

import UIKit

class TvShowTableViewCell: UITableViewCell {
    @IBOutlet weak var nameTvShow: UILabel!
    @IBOutlet weak var imageTvShow: UIImageView!
    @IBOutlet weak var descriptionTvShow: UILabel!
    @IBOutlet weak var totalVotes: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var tvShowDate: UILabel!
    var urlImage = "https://image.tmdb.org/t/p/w500"

    func configTvShowcell(_ TvShow: TvShowData) {
        tvShowDate.text = TvShow.formatDate()
        score.text = String(TvShow.voteAverage)
        totalVotes.text = String(TvShow.voteCount)
        nameTvShow.text = TvShow.name
        descriptionTvShow.text = TvShow.overview
        imageTvShow.setImage(urlAdress: urlImage + TvShow.posterPath)
    }

}
