//
//  MyCollectionViewCell.swift
//  CollectionView Compositions
//
//  Created by Vivek on 10/08/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImages: UIImageView!
    
    func setUp( image : UIImage) {
        
        cellImages.image = image
    }
    
}
