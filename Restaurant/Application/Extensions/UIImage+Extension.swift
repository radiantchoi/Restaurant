//
//  UIImage+Extension.swift
//  Restaurant
//
//  Created by Gordon Choi on 2021/07/20.
//

import UIKit

extension UIImageView {
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self.image = nil
                }
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}

// kingfisher 라이브러리를 알아보자.
