//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/06/16.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet var timeRemainingLabel: UILabel!
    var minutes: Int!
    
}

extension OrderConfirmationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }

}
