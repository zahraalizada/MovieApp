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
        getPopularMovies()
        getNowPlayingMovies()
        getTopRatedMovies()
    }
    
    func getPopularMovies() {
        NetworkManager.request(model: Movie.self,
                               endpoint: "movie/popular") { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Popular", movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getNowPlayingMovies() {
        NetworkManager.request(model: Movie.self,
                               endpoint: "movie/now_playing") { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Now Playing", movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getTopRatedMovies() {
        NetworkManager.request(model: Movie.self,
                               endpoint: "movie/top_rated") { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Top Rated", movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
  
    
    
}
