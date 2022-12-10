//
//  PersonTableViewCell.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var departament: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imagePerson: UIImageView!
    var urlImage = "https://image.tmdb.org/t/p/w500"
    
    func configPersonCell(_ person: PersonData) {
        background.layer.cornerRadius = 30
        departament.text = person.department ?? ""
        popularity.text = String(person.popularity ?? 0)
        name.text = String(person.name ?? "")
        if person.profile !=  nil {
            imagePerson.setImage(urlAdress: urlImage + (person.profile ?? ""))
        } else {
            imagePerson.image = UIImage(systemName: "person.fill")
        }
        
    }
}
