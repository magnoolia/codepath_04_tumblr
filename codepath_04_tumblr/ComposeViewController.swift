//
//  ComposeViewController.swift
//  codepath_04_tumblr
//
//  Created by Magnolia Caswell-Mackey on 10/10/15.
//  Copyright © 2015 Magnolia. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var videoIcon: UIImageView!
    
    var textIconOrigCenter: CGPoint!
    var photoIconOrigCenter: CGPoint!
    var quoteIconOrigCenter: CGPoint!
    var linkIconOrigCenter: CGPoint!
    var chatIconOrigCenter: CGPoint!
    var videoIconOrigCenter: CGPoint!
    
    var composeAnimStarted: CBool! //not using
    
    @IBAction func nevermindBtn(sender: AnyObject) {
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.textIcon.center = CGPoint(x: self.textIconOrigCenter.x, y:-100)
            
            }, completion: (nil)
        )
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.photoIcon.center = CGPoint(x: self.photoIconOrigCenter.x, y:-100)
            
            }, completion: (nil)
        )
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.quoteIcon.center = CGPoint(x: self.quoteIconOrigCenter.x, y:-100)
            
            }, completion: (nil)
        )
        UIView.animateWithDuration(0.4, delay: 0.05, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.linkIcon.center = CGPoint(x: self.linkIconOrigCenter.x, y:-100)
            
            }, completion: (nil)
        )
        UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.chatIcon.center = CGPoint(x: self.chatIconOrigCenter.x, y:-100)
            
            
            }, completion: (nil)
        )
        UIView.animateWithDuration(0.4, delay: 0.15, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.videoIcon.center = CGPoint(x: self.videoIconOrigCenter.x, y:-100)
            
            }, completion: {(Bool)  in
                self.dismissViewControllerAnimated(true, completion: nil)
                
                print("dismiss compose ")
                //want to call tabBtnAction in tab bar vc - how?
                //super.tabBtnAction()
            }
        )
        composeAnimStarted = false //not using
    }
    
    
    override func viewDidAppear(animated: Bool) {
        print("compose viewDidAppear - animated: \(animated)")
        if (animated) { //composeAnimStarted == false (getting 2x)
            print("starting animation")
            composeAnimStarted = true //not using
            //move icons up
            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.textIcon.center = self.textIconOrigCenter
            }, completion: nil)
            
            UIView.animateWithDuration(0.4, delay: 0.05, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.photoIcon.center = self.photoIconOrigCenter
                }, completion: nil)
            
            UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.quoteIcon.center = self.quoteIconOrigCenter
                }, completion: nil)
            
            UIView.animateWithDuration(0.35, delay: 0.075, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.linkIcon.center = self.linkIconOrigCenter
                }, completion: nil)
            
            UIView.animateWithDuration(0.35, delay: 0.125, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.chatIcon.center = self.chatIconOrigCenter
                }, completion: nil)
            
            UIView.animateWithDuration(0.35, delay: 0.175, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.videoIcon.center = self.videoIconOrigCenter
                
                }, completion: nil)
        }
        super.viewDidAppear(animated)
        
        //showIntroModal()
    }
    
    
  //check out example for anims - not using this route this time
//    func showIntroModal() {
//        if (!introModalDidDisplay) {
//            println(introModalDidDisplay)
//            introModalDidDisplay = true
//            let intro = self.storyboard?.instantiateViewControllerWithIdentifier("introModal") as IntroModalViewController
//            intro.modalPresentationStyle = UIModalPresentationStyle.FormSheet
//            self.presentViewController(intro, animated: true, completion: nil)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textIconOrigCenter = textIcon.center
        photoIconOrigCenter = photoIcon.center
        quoteIconOrigCenter = quoteIcon.center
        linkIconOrigCenter = linkIcon.center
        chatIconOrigCenter = chatIcon.center
        videoIconOrigCenter = videoIcon.center
        textIcon.center = CGPoint(x: textIconOrigCenter.x, y:700)
        photoIcon.center = CGPoint(x: photoIconOrigCenter.x, y:700)
        quoteIcon.center = CGPoint(x: quoteIconOrigCenter.x, y:700)
        linkIcon.center = CGPoint(x: linkIconOrigCenter.x, y:700)
        chatIcon.center = CGPoint(x: chatIconOrigCenter.x, y:700)
        videoIcon.center = CGPoint(x: videoIconOrigCenter.x, y:700)
        
        composeAnimStarted = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
