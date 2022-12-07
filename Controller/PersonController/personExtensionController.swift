//
//  personExtensionController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit
extension PersonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath) as! PersonTableViewCell
        personCell.configPersonCell((person[indexPath.row]))
        return personCell
    }

}
extension PersonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "PersonMovies", bundle: nil)
        let personMovie = storyBoard.instantiateViewController(withIdentifier: "PersonMovie") as! PersonMovieViewController
        personMovie.personMovies = person[indexPath.row].knowFor
        self.navigationController?.pushViewController(personMovie, animated: true)
    }
}
