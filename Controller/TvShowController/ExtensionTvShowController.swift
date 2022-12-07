//
//  ExtensionTvShowController.swift
//  moviesApp2
//
//  Created by Otávio da Silva on 05/12/22.
//

import UIKit

extension TvShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvCell = tableView.dequeueReusableCell(withIdentifier: "tvCell", for: indexPath) as! TvShowTableViewCell
        tvCell.configTvShowcell((tvShows[indexPath.row]))
        return tvCell
    }
    
    
}
