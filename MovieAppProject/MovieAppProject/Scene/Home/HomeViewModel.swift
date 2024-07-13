//
//  HomeViewModel.swift
//  MovieAppProject
//
//  Created by Samxal Quliyev  on 10.07.24.
//

import Foundation

struct HomeModel {
    let title: String
    let movies: [MovieResult]
}

class HomeViewModel {
    
    var items = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getMovies() {
        getMovieDatas(title: "Popular", endpoint: .popularMovie)
        getMovieDatas(title: "Now Playing", endpoint: .nowPlayingMovie)
        getMovieDatas(title: "Top Rated", endpoint: .topRatedMovie)
    }
    
    func getMovieDatas(title: String, endpoint: Endpoint) {
        NetworkManager.request(model: Movie.self,
                               endpoint: endpoint.rawValue) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: title, movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
    
}
