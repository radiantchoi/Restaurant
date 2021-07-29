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

//extension NetworkManager {
//    @discardableResult
//    func post<T: Codable>(NetworkRequestData: NetworkRequestData, for model: T.Type, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
//
//        // url의 설정 - 미리 설정해둔 baseURL에 붙인다
//        let URL = NetworkRequestData.baseURL.appendingPathComponent(NetworkRequestData.urlPath)
//        var request = URLRequest(url: URL)
//
//        // 일단 HTTPMethod 자리를 내 준다.
//        request.httpMethod = NetworkRequestData.httpMethod.rawValue
//
//        // 그리고 그 내 준 자리를 채워 준다 - header
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let jsonData = try? JSONSerialization.data(withJSONObject: NetworkRequestData.data!)
//
//        // 이게 post인 경우는 httpBody에 관련된 정보가 들어가지만, get일 경우는 query에 정보가 들어가겠지? switch를 통해 나중에 함수를 하나로 통합할 수 있다.
//        request.httpBody = jsonData
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data,
//                  let model = try? JSONDecoder().decode(model, from: data) else {
//                // 이 밑은 데이터를 가져오는 데 실패했을 경우
//                if let error = error {
//                    completion(.failure(error))
//                } else {
//                    completion(.failure(UnknownNetworkError()))
//                }
//                return
//            }
//
//            // 데이터를 가져오는 데 성공했을 경우
//            completion(.success(model))
//        }
//
//        task.resume()
//        return task
//    }
//
//    func get<T: Codable>(NetworkRequestData: NetworkRequestData, for model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
//
//        let URL = NetworkRequestData.baseURL.appendingPathComponent(NetworkRequestData.urlPath)
//        var request = URLRequest(url: URL)
//
//        request.httpMethod = NetworkRequestData.httpMethod.rawValue
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data,
//                  let model = try? JSONDecoder().decode(model, from: data) else {
//                if let error = error {
//                    completion(.failure(error))
//                } else {
//                    completion(.failure(UnknownNetworkError()))
//                }
//                return
//            }
//
//            completion(.success(model))
//        }
//
//        task.resume()
//
//    }
//
//}

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
                    // Error
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
