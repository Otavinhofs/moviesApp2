//
//  TvShowViewController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 05/12/22.
//

import UIKit

class TvShowViewController: UIViewController, TvShowDelegate {
        
    @IBOutlet weak var loaderView: UIView!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tvShowTableView: UITableView!
    var tvShowBrain = TvShowBrain()
    var tvShows: [TvShowData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        tvShowBrain.delegate = self
        tvShowTableView.dataSource = self
        tvShowBrain.getTvshow()
        
    }
    

    func dataError(_ error: Error?) {
        let errorMenssager = UIAlertController(title: "Atenção", message: "Algo deu errado tente novamente mais tarde.", preferredStyle: .alert)
        errorMenssager.addAction(UIAlertAction(title: "fechar", style: .cancel))
        self.present(errorMenssager, animated: true)
    }
    
    func dataSucces(_ tvShowData: TvShowResults?) {
        DispatchQueue.main.async {
            self.tvShows = tvShowData!.results 
            self.tvShowTableView.reloadData()
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
