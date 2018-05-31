//
//  ImageCollectionViewCell.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with imgur: Imagurl ) {
     
        self.titleLabel.text = imgur.title
        imgur.image { (image) in
            self.imageView.image = image
        }
    }
    
    // this just clears the flickering between the downloaded images and only the exact images will be there
    override func prepareForReuse() {
        titleLabel.text = nil
        imageView.image = nil
    }
    
    
}
