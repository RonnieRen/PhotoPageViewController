//
//  NMImageCollectionViewCell.swift
//  PhotoPageViewController
//
//  Created by RonnieRen on 12/1/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var imageURL: NSURL? {
        didSet(oldImageURL) {
            if let _ = self.imageURL {
                self.imageView.image = UIImage(contentsOfFile: self.imageURL!.path!)
            }
            else {
                self.imageView.image = nil
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    
}
