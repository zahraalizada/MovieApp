//
//  HomeCell.swift
//  MovieAppProject
//
//  Created by Zahra Alizada on 10.07.24.
//

import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var movies = [MovieResult]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
    }
    
    func configure(title: String, movies: [MovieResult]) {
        categoryLabel.text = title
        self.movies = movies
    }

}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(data: movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: collectionView.frame.height)
    }
    
    
}
