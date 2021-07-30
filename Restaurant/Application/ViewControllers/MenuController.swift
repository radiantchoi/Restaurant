//
//  MenuController.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/06/15.
//

import Foundation
import UIKit


class MenuController {
    
    let baseURL = URL(string: "http://localhost:8090/")!

    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: MenuController.orderUpdatedNotification, object: nil)
        }
    }
    
    static let shared = MenuController()
    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")
    static let menuDataUpdateNotification = Notification.Name("MenuController.menuDataUpdated")
    
    private var itemsByID = [Int: MenuItem]()
    private var itemsByCategory = [String: [MenuItem]]()
    
    var categories: [String] {
        get {
            return itemsByCategory.keys.sorted()
        }
    }
    
}


extension MenuController {
    
    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void) {
        
        NetworkManager.shared.request(networkRequestData: NetworkRequestData(
                                    urlPath: "order",
                                    httpMethod: .post,
                                    data: ["menuIds": menuIds]),
                                   for: PreparationTime.self
        ) {
            switch $0 {
            case .success(let preparationTime):
                completion(preparationTime.prepTime)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    private func process(_ items: [MenuItem]) {
        itemsByID.removeAll()
        itemsByCategory.removeAll()
        
        for item in items {
            itemsByID[item.id] = item
            itemsByCategory[item.category, default: []].append(item)
        }
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: MenuController.menuDataUpdateNotification, object: nil)
        }
    }
    
    func loadRemoteData() {
        
        NetworkManager.shared.request(networkRequestData: NetworkRequestData(
                                    urlPath: "menu",
                                    httpMethod: .get,
                                    data: nil),
                                  for: MenuItems.self
        ) {
            switch $0 {
            case .success(let menuItems):
                self.process(menuItems.items)
            case .failure(_):
                return
            }
        }
    }
    
}


extension MenuController {
    
    func item(withID itemID: Int) -> MenuItem? {
        return itemsByID[itemID]
    }
    
    func items(forCategory category: String) -> [MenuItem]? {
        return itemsByCategory[category]
    }
    
}
