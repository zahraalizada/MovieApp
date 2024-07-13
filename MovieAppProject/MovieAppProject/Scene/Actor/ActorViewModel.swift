//
//  ActorViewModel.swift
//  MovieAppProject
//
//  Created by Zahra Alizada on 13.07.24.
//

import Foundation

class ActorViewModel {
    
    var items = [ActorData]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getActorList() {
        NetworkManager.request(model: Actor.self,
                               endpoint: Endpoint.popularActors.rawValue) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
}
