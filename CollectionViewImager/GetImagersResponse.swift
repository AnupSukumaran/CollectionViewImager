//
//  GetImagersResponse.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation

// this is where all the data gets passed with the key words through the model struct file "Imageurl"
struct GetImageResponse {
    // has declared an array of type Imagurl t
    let imgurs: [Imagurl]
    
    // this is initilaized to get the json data from the url
    init(json: JSON) throws {
       
        // this calls the json data using dictionary of key "data" which throws an error os do try
        guard let data = json["data"] as? [JSON] else { throw MyErrors.someError}
        // the recevided data is give in a loop called map function which goes through the model struct filr Imageurl with orptional init fucntion, in that init func data is splited with keys becoz the elements are of type nsDictionary. and flatmap is replaced with compactMap with removes all the nill factor.
        let imgurs = data.map{Imagurl(json: $0)}.compactMap{ $0 }
        // the above data is given in the imgurs varible declared in the above variable.
        self.imgurs = imgurs
    }
}
