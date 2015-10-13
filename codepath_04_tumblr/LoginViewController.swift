//
//  LoginViewController.swift
//  codepath_04_tumblr
//
//  Created by Magnolia Caswell-Mackey on 10/10/15.
//  Copyright © 2015 Magnolia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func cancelLoginAction(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil)
        print("dismiss login")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
