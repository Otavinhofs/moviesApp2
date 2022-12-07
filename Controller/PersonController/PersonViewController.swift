//
//  PersonViewController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 06/12/22.
//

import UIKit

class PersonViewController: UIViewController, PersonDelegate {
    @IBOutlet weak var personTableView: UITableView!
    var personBrain = PersonBrain()
    var person: [PersonData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            self.person = personData!.results
            self.personTableView.reloadData()
        }
    }
}
