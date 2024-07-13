//
//  MovieCell.swift
//  MovieAppProject
//
//  Created by Zahra Alizada on 11.07.24.
//

import UIKit

protocol TopImageBottomLabelProtocol {
    var  imageName: String { get }
    var  labelText: String { get }
}

class TopImageBottomLabelCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: TopImageBottomLabelProtocol) {
        movieNameLabel.text = data.labelText
        movieImage.loadImage(path: data.imageName)
    }
}
