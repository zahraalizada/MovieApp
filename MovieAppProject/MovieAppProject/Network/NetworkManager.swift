//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Samxal Quliyev  on 06.12.23.
//

import Foundation
import Alamofire

class NetworkManager {    
    static let baseURL = "https://api.themoviedb.org/3/"
    static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTZlZjAzNWI4ZjIxY2UwYThmNjY5MTViYWI4ZTVmMyIsIm5iZiI6MTcyMDYyNzEyMS43NDIxNTUsInN1YiI6IjY2OGVhMTcyZWVhZjdlYWZkMjY5OWM2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HmDbfU0tkW01u7IyvpF4TUI1h8p39zGw5U1sb496Q3U"]
    
    static func request<T: Codable>(model: T.Type,
                                    endpoint: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping((T?, String?) -> Void)) {
        AF.request("\(baseURL)\(endpoint)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
