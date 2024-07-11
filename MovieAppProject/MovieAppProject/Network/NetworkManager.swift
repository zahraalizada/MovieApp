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
    static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjI1MzQxNmZhYzBjZDI0NzYyOTFlYjMzYzkyYmViNyIsInN1YiI6IjYyNDNmMjAyYzUwYWQyMDA1Y2RlOTVmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0dUMhxX4qBZrY_NXSEf9cWjAnzB-Xl1Qu5rj9CzET7k"]
    
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
