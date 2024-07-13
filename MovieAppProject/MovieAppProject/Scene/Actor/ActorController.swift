//
//  ActorController.swift
//  MovieAppProject
//
//  Created by Zahra Alizada on 13.07.24.
//

import UIKit

class ActorController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = ActorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = "Actor List"
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configureViewModel() {
        viewModel.getActorList()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
}


extension ActorController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 220)
    }
}
