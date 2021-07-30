//
//  NetworkManager.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/07/11.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
}

extension NetworkManager {
    @discardableResult
    func request<T: Codable>(networkRequestData: NetworkRequestData, for model: T.Type, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
        let url =  networkRequestData.baseURL.appendingPathComponent(networkRequestData.urlPath)
        var request = URLRequest(url: url)
        
        request.httpMethod = networkRequestData.httpMethod.rawValue
        
        if networkRequestData.httpMethod == .post {
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonData = try? JSONSerialization.data(withJSONObject: networkRequestData.data!)
            request.httpBody = jsonData
            
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  let model = try? JSONDecoder().decode(model, from: data) else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(UnknownNetworkError()))
                }
                return
            }
            
            completion(.success(model))
        }
        
        task.resume()
        return task
    }
    
}

struct UnknownNetworkError: Error {
    
}
