//
//  TabBarViewController.swift
//  codepath_04_tumblr
//
//  Created by Magnolia Caswell-Mackey on 10/9/15.
//  Copyright © 2015 Magnolia. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedTab: Int = 0
    
    @IBOutlet var buttons: [UIButton]! //created, dragged connection from each btn
    
    @IBOutlet weak var exploreBubble: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    @IBAction func tabBtnAction(sender: UIButton) {
        print("tabBtnAction, tag \(sender.tag)")
        let previousTab = selectedTab
        selectedTab = sender.tag
        buttons[previousTab].selected = false

        
        //hide explore if search tab is selected
        if selectedTab == 1 {
            exploreBubble.hidden = true
        }
        else {
            print(" re animate bubble")
            exploreBubble.hidden = false
            self.exploreBubble.transform = CGAffineTransformMakeTranslation(0.0,0.0) //avoid issues with restarting anim
            UIView.animateWithDuration(0.6, delay: 0.0, options: [UIViewAnimationOptions.Autoreverse,UIViewAnimationOptions.Repeat,UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
                self.exploreBubble.transform = CGAffineTransformMakeTranslation(0.0,5)
                }, completion: nil)
        }
        
        
        let previousVC = viewControllers[previousTab]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true //(same as buttons[selectedTab].selected = true)
        let vc = viewControllers[selectedTab]
        
        addChildViewController(vc) //this calls viewWillAppear in vc
        
        vc.view.frame = contentView.frame //test .bounds too
        contentView.addSubview(vc.view)
        didMoveToParentViewController(self) //this calls viewDidAppear in vc
            //look @ 2x in compose
        

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
       viewControllers = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]

        selectedTab = 0
        buttons[selectedTab].selected = true
        tabBtnAction(buttons[selectedTab])
        
        UIView.animateWithDuration(0.6, delay: 0.0, options: [UIViewAnimationOptions.Autoreverse,UIViewAnimationOptions.Repeat,UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            self.exploreBubble.transform = CGAffineTransformMakeTranslation(0.0,5)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



//
//old tabAction:
//        if selectedTab == 0 {
//
//        homeViewController.view.frame = contentView.frame //shoehorn it!
//        contentView.addSubview(homeViewController.view)
//        }
//        else if selectedTab == 1 {
//            searchViewController.view.frame = contentView.frame
//            contentView.addSubview(searchViewController.view)
//        }
//        else if selectedTab == 2 {
//            composeViewController.view.frame = contentView.frame
//            contentView.addSubview(composeViewController.view)
//        }
//        else if selectedTab == 3 {
//            accountViewController.view.frame = contentView.frame
//            contentView.addSubview(accountViewController.view)
//        }
//        else if selectedTab == 4 {
//            trendingViewController.view.frame = contentView.frame
//            contentView.addSubview(trendingViewController.view)
//        }
//& didMoveToParentViewController