//
//  LECMovieListTableViewController.swift
//  MovieApp27
//
//  Created by Leah Cluff on 7/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class LECMovieListTableViewController: UITableViewController {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return LECMovieController.shared().movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? LECMovieTableViewCell
        let movie = LECMovieController.shared().movies[indexPath.row]
        cell?.movie = movie
        cell?.updateViews()
        
        return cell ?? UITableViewCell()
    }
}

extension LECMovieListTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       LECMovieController.shared().fetchMovie(with: searchText) { (movies) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


