//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Samxal Quliyev  on 06.12.23.
//

import Foundation
import Alamofire

class NetworkManager {    
 
    static func request<T: Codable>(model: T.Type,
                                    endpoint: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping((T?, String?) -> Void)) {
        AF.request(NetworkConstants.getUrl(with: endpoint),
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkConstants.header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
