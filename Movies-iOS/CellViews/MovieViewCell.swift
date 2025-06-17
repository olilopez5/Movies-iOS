//
//  MovieViewCell.swift
//  Movies-iOS
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class MovieViewCell: UITableViewCell {


    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    
    func render(movie : Movie) {
        
        movieTitle.text = movie.title
        movieYear.text = movie.year
        moviePoster.loadFrom(url: movie.poster)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviePoster.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
