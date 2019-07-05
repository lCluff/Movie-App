//
//  LECMovieTableViewCell.swift
//  MovieApp27
//
//  Created by Leah Cluff on 7/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class LECMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    var movie: LECMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard  let _ = movie else { return}
        LECMovieController.shared().fetchMovie(with: "baby driver") {  (movies) in DispatchQueue.main.async {
            self.ratingLabel.text = "\(self.movie!.rating)"
            self.overviewLabel.text = self.movie?.summary
            self.titleLabel.text = self.movie?.title
            }
        }
    }
}
            
        

