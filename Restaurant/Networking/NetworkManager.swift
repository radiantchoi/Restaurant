//
//  NetworkManager.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/07/11.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager(baseURL: )
    
    let baseURL: URL
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
}
