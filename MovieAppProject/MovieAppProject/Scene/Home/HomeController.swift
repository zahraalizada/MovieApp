//
//  HomeController.swift
//  MovieAppProject
//
//  Created by Samxal Quliyev  on 10.07.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = "Movies"
        collection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    
    func configureViewModel() {
        viewModel.getMovies()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let item = viewModel.items[indexPath.item]
        cell.configure(title: item.title, movies: item.movies)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 288)
    }
}
 
