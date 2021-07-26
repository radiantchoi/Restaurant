//
//  NetworkRequestData.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/07/17.
//

import Foundation

struct NetworkRequestData {
    var baseURL: URL = URL(string: "http://localhost:8090/")!
    var urlPath: String
    var httpMethod: HTTPMethod
    var data: [String: Any]?
}


enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}
