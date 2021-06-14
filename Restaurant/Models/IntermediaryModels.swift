//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/06/15.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
