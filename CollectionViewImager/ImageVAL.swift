//
//  ImageVAL.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

struct Imagurl {
    
    private let id: String
    private let link: String
    let title: String
    
    init?(json: JSON) {
        guard let id = json["id"] as? String,
            let title = json["title"] as? String,
            let link = json["link"] as? String
            else { return nil }
        
        self.id = id
        self.title = title
        self.link = link
    }
    
    func image(completion:@escaping (UIImage) -> Void) {
        
        if let image = imageCache.image(forKey: id) {
            completion(image)
        }else {
            NetworkingService.shared.downloadImage(fromLink: link) { (image) in
                imageCache.add(image, forKey: self.id)
                completion(image)
            }
        }
        
       
    }
}
