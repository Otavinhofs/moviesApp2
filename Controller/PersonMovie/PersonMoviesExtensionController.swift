//
//  ExtensionController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit
extension PersonMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personMovieCell = tableView.dequeueReusableCell(withIdentifier: "personMovie", for: indexPath) as! PersonMovieTableViewCell
        personMovieCell.configPersonMovieCell(personMovies[indexPath.row])
        return personMovieCell
    }
    
    
}
