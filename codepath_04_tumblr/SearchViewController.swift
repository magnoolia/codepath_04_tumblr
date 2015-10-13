//
//  SearchViewController.swift
//  codepath_04_tumblr
//
//  Created by Magnolia Caswell-Mackey on 10/10/15.
//  Copyright © 2015 Magnolia. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var loadingImageView: UIImageView!
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
    
    var animatedImage: UIImage!
    
    @IBOutlet weak var searchFeed: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFeed.alpha = 0
        loadingImageView.alpha = 1
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3, loading_3] //pause on 3rd

       
        animatedImage = UIImage.animatedImageWithImages(images, duration: 0.9)
       
        loadingImageView.image = animatedImage
        
        UIView.animateWithDuration(1.5, delay: 1.5, options: UIViewAnimationOptions.CurveEaseOut, animations:
            { () -> Void in
                self.searchFeed.alpha = 1 //won't work 2nd time through
                self.loadingImageView.alpha = 0.15
                
            }, completion: { (Bool) -> Void in
                    print("search - end loading")
                self.loadingImageView.alpha = 0
            }
        )
    }

    override func viewDidDisappear(animated: Bool)
    {
        print("search viewDidDisappear")
        searchFeed.alpha = 0
        loadingImageView.alpha = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
