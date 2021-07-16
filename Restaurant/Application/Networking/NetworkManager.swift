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
    func post() {
        
    }
    
    func get() {
        
    }
}

struct UnknownNetworkError: Error {
    
}
