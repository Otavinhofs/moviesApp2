//
//  PersonMovieViewController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit

class PersonMovieViewController: UIViewController{
    
    @IBOutlet weak var personMovieTableView: UITableView!
    var personMovies: [KnowFor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personMovieTableView.dataSource = self
        
    }

}
