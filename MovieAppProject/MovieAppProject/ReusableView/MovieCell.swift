//
//  MovieCell.swift
//  MovieAppProject
//
//  Created by Zahra Alizada on 11.07.24.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: MovieResult) {
        movieNameLabel.text = data.title
        movieImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(data.backdropPath ?? "")"))
    }
}
