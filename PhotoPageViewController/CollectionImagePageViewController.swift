//
//  NMImagePageViewController.swift
//  PhotoPageViewController
//
//  Created by RonnieRen on 12/1/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import UIKit

class CollectionImagePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageURLs: [NSURL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first {

            for imageItem in ["1","2","3","4"] {
                if let imageURL = NSURL(string: docPath + "/" + imageItem + ".png") {
                    self.imageURLs.append(imageURL)
                }
            }
        }
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.pageControl.numberOfPages = self.imageURLs.count
        
        
        if let flowLayout =  self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0;
            flowLayout.minimumInteritemSpacing = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageURLs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImagePageItemCellIdentifier", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        cell.imageURL = self.imageURLs[indexPath.row]
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return self.collectionView.bounds.size
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth: CGFloat = self.collectionView.frame.size.width;
        self.pageControl.currentPage = (NSInteger)(self.collectionView.contentOffset.x / pageWidth)
    }
    
    
    
    
    
    
}
