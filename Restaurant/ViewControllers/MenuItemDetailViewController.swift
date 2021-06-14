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
        
        updateUI()
    }
    
}

extension MenuItemDetailViewController {
    
    private func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
    }
    
}
