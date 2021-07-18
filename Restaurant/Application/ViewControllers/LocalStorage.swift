//
//  LocalStorage.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/07/19.
//

import Foundation

struct LocalStorage {
    
    func loadOrder() -> Order? {
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let orderFileURL = documentsDirectoryURL.appendingPathComponent("order").appendingPathExtension("json")
        
        guard let data = try? Data(contentsOf: orderFileURL) else { return nil }
        return (try? JSONDecoder().decode(Order.self, from: data)) ?? Order(menuItems: [])
    }
    
    func saveOrder(_ order: Order) {
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let orderFileURL = documentsDirectoryURL.appendingPathComponent("order").appendingPathExtension("json")
        
        if let data = try? JSONEncoder().encode(order) {
            try? data.write(to: orderFileURL)
        }
    }
    
    func loadItems() -> [MenuItem]? {
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let menuItemsFileURL = documentsDirectoryURL.appendingPathComponent("menuItems").appendingPathExtension("json")
        
        guard let data = try? Data(contentsOf: menuItemsFileURL) else { return nil }
        return (try? JSONDecoder().decode([MenuItem].self, from: data)) ?? []
        
    }
    
    func saveItems(itemIDs: [Int]) {
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let menuItemsFileURL = documentsDirectoryURL.appendingPathComponent("menuItems").appendingPathExtension("json")
        
        let items = itemIDs
        if let data = try? JSONEncoder().encode(items) {
            try? data.write(to: menuItemsFileURL)
        }
    }
    
}
