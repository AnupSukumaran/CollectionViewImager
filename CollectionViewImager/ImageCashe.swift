//
//  ImageCashe.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

// this is globally called
let imageCache = ImageCache()

// this class is to store the downloaded images as NScCache type which is of format or type of dictionary like this -> [AnyObject: AnyObject]
class ImageCache: NSCache<AnyObject, AnyObject> {
    
    // this func recevies images and key strings to set objects which is images with key
    func add(_ image: UIImage, forKey key: String) {
        setObject(image, forKey: key as AnyObject)
    }
    
    //this func returns images for keys
    func image(forKey key: String) -> UIImage? {
        
        guard let image = object(forKey: key as AnyObject) as? UIImage else {
            return nil
        }
        
        return image
    }
}
