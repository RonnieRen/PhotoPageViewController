# PhotoPageViewController
  This is a app to show how to make a photo page view controller with two ways: UIPageViewController and UICollectionView. with this view controller, you can view photos page by page.
  The reason I made this app to investigate which way is the best one to do such kind of photo page view controler. after done this, I ended with using UICollectionView based on reasons below:
    1. UIPageViewController does not support the feature like reusing view controller, like cell resuable in UICollectionView, so every time you need to create a total new view controller by loading a page view controller from storyboard or xib file.
    2. UIPageViewController is a view controller, which is not convenient to embed it into a collection view cell or table view cell, but UICollectionView is a view, that could be put a cell.
    3. About memory or cpu usgae, they are almost the same.
    4. Obviously UICollectionView has more flexibility than UIPageViewController  
  
  
