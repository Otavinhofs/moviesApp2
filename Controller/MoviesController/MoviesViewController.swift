//
//  ViewController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 02/12/22.
//

import UIKit

class MoviesViewController: UIViewController, MoviesDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var moviesBrain = MoviesBrain()
    var movies: [Movies] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesBrain.delegate = self
        tableView.dataSource = self
        moviesBrain.getMovies()
    }
    func dataError(_ error: Error?) {
        let errorMenssager = UIAlertController(title: "Atenção", message: "Algo deu errado tente novamente mais tarde.", preferredStyle: .alert)
        errorMenssager.addAction(UIAlertAction(title: "fechar", style: .cancel))
        self.present(errorMenssager, animated: true)

    }
    
    func dataSucces(_ moveData: MovieResults?) {
        DispatchQueue.main.async {
            self.movies = moveData!.results
            self.tableView.reloadData()
        }

    }

}



