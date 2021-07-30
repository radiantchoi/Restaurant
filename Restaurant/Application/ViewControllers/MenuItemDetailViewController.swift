//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/06/15.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var detailTextLabel: UILabel!
    @IBOutlet private var addToOrderButton: UIButton!
    
    var menuItem: MenuItem!
    
}

extension MenuItemDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
    }
    
}

extension MenuItemDetailViewController {
    
    private func updateUI() {
        guard let menuItem = menuItem else { return }
        
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
        imageView.fetchImage(url: menuItem.imageURL)
    }
    
}

extension MenuItemDetailViewController {
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let menuItem = menuItem else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
}

extension MenuItemDetailViewController {
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let menuItem = menuItem else { return }
        
        coder.encode(menuItem.id, forKey: "menuItemId")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        let menuItemID = Int(coder.decodeInt32(forKey: "menuItemId"))
        menuItem = MenuController.shared.item(withID: menuItemID)!
        updateUI()
    }
    
}
