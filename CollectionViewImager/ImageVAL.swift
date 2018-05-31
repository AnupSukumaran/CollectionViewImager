//
//  ImageVAL.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

// this called like this because we can split data using keywords
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
    
    // this function is used in the collectionviewCell class file inside configure func
    func image(completion:@escaping (UIImage) -> Void) {
        
        // imageCache is the calass which is called in global , that calls a function that returns an image for id , is not there the else condition will execute
        if let image = imageCache.image(forKey: id) {
            completion(image)
        }else {
            // this call the image url sends the image data to ImageCollectionViewCell file
            NetworkingService.shared.downloadImage(fromLink: link) { (image) in
                // this just adds to the cache meemory
                imageCache.add(image, forKey: self.id)
                // this sends the image data to the cell file
                completion(image)
            }
        }
        
       
    }
}
