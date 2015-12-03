//
//  ImageViewController.swift
//  PhotoPageViewController
//
//  Created by RonnieRen on 11/30/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import Foundation
import UIKit


class ImagePageItemViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

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
    

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    

    private func setupImageViewConstraints() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["imageView": self.imageView])
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["imageView": self.imageView])
        self.view.addConstraints(horizontalConstraints)
        self.view.addConstraints(verticalConstraints)
    }
    
    
    
}