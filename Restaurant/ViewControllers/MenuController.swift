//
//  MenuController.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/06/15.
//

import Foundation

class MenuController {
    
    let baseURL = URL(string: "http://localhost:8090/")
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryURL = baseURL?.appendingPathComponent("categories")
    }
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        
    }
    
    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void) {
        let orderURL = baseURL?.appendingPathComponent("order")
    }
}
