//
//  ViewController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 02/12/22.
//

import UIKit

class MoviesViewController: UIViewController, MoviesDelegate{
    
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var moviesBrain = MoviesBrain()
    var movies: [Movies] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        moviesBrain.delegate = self
        tableView.dataSource = self
        moviesBrain.getMovies()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.tintColor = .blue
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
            self.hideLoader()
        }

    }
    func showLoader() {
        self.loaderView.isHidden = false
        self.loader.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    func hideLoader() {
        self.loaderView.isHidden = true
        self.loader.startAnimating()
        self.view.isUserInteractionEnabled = true
    }

}



