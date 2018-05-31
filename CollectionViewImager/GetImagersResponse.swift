//
//  GetImagersResponse.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation

struct GetImageResponse {
    
    let imgurs: [Imagurl]
    
    init(json: JSON) throws {
       
        
        guard let data = json["data"] as? [JSON] else { throw MyErrors.someError}
        let imgurs = data.map{Imagurl(json: $0)}.compactMap{ $0 }
        self.imgurs = imgurs
    }
}
