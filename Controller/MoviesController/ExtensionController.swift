//
//  ExtensionController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 02/12/22.
//

import UIKit

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.configCell((movies[indexPath.row]))
        return cell
    }
    
    
}

extension UIImageView {
    func setImage(urlAdress: String) {
        guard let url = URL(string: urlAdress) else {return}
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                if let imageData = imageData {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                        
                    }
                }
                
            }
            
        }
    }
}
