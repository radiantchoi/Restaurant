//
//  Order.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/06/15.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
