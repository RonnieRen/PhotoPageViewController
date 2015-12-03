//
//  ImagePageViewController.swift
//  PhotoPageViewController
//
//  Created by RonnieRen on 11/30/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import Foundation
import UIKit


class ImagePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var imageURLs: [NSURL]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urls: [NSURL] = []
        for var i = 1; i < 7; i++ {
            urls.append(NSURL(string: "https://github.com/RonnieRen/PhotoPageViewController/Images/\(i).jpg")!)
        }
        
        self.imageURLs = urls
        
        
        self.view.backgroundColor = UIColor.blackColor()
        self.dataSource = self
        self.view.frame = self.view.bounds
        self.setViewControllers([self.getNextPageViewController(nil, offset: -1)!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil);
    }
   
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.imageURLs?.count ?? 0
    }

    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0;
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
         return self.getNextPageViewController(viewController, offset:  -1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return self.getNextPageViewController(viewController, offset:  +1)
    }
    
    
    private func getNextPageViewController(currentPageViewController: UIViewController?, offset: Int) -> UIViewController? {
        if let  _ = currentPageViewController {
            if let allImages = self.imageURLs, imageVC = currentPageViewController as? ImagePageItemViewController, imageURL = imageVC.imageURL, pageIndex = allImages.indexOf(imageURL) where pageIndex.advancedBy(offset) >= 0 &&  allImages.count > pageIndex.advancedBy(offset)   {
                let nextImageURL = allImages[pageIndex.advancedBy(offset)]
                
                let vc = ImagePageItemViewController()
                vc.loadView()
                vc.imageURL = nextImageURL
                return vc
            }
        }
        else if let allImages = self.imageURLs where offset == -1  {
            let vc = ImagePageItemViewController()
            vc.loadView()
            vc.imageURL = allImages[0]
            return vc
        }
        return nil
    }

    
    
}