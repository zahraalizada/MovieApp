//
//  Extension.swift
//  MovieAppProject
//
//  Created by Zahra Alizada on 13.07.24.
//

import UIKit
import Foundation
import Kingfisher

extension UIImageView {
    func loadImage(path: String) {
        let url = "\(NetworkConstants.baseImageUrl)\(path)"
//        let url = NetworkConstants.getImageUrl(with: path)
        self.kf.setImage(with: URL(string: url))
    }
}

extension UIViewController {
    
}
