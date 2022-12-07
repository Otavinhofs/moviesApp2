//
//  PersonViewController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit

class PersonViewController: UIViewController, PersonDelegate {
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var personTableView: UITableView!
    var personBrain = PersonBrain()
    var person: [PersonData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        personBrain.delegate = self
        personTableView.dataSource = self
        personTableView.delegate = self
        personBrain.getPerson()
    }

    func dataError(_ error: Error?) {
        let errorMenssager = UIAlertController(title: "Atenção", message: "Algo deu errado tente novamente mais tarde.", preferredStyle: .alert)
        errorMenssager.addAction(UIAlertAction(title: "fechar", style: .cancel))
        self.present(errorMenssager, animated: true)
    }
    
    func dataSucces(_ personData: PersonResults?) {
        DispatchQueue.main.async {
            self.hideLoader()
            self.person = personData!.results
            self.personTableView.reloadData()
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
