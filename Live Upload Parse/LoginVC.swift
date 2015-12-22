//
//  ViewController.swift
//  Live Upload Parse
//
//  Created by Miguel Fagundez on 12/20/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit
import Parse


class LoginVC:  UIViewController {

    @IBOutlet weak var usernameFld: UITextField!
    @IBOutlet weak var passwordFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true
      

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        if let _ = currentUser  {
            
            self.performSegueWithIdentifier("loginUser", sender: self)
            print("Logged In!")
        }else{
            print("Please Log In")
        }
    }
    
    @IBAction func logIn(sender: UIButton) {
        let username = usernameFld.text!
        let password = passwordFld.text!
        
        if username.isEmpty || password.isEmpty{
        
        }else{
            PFUser.logInWithUsernameInBackground(username, password: password, block: {
                (user:PFUser?, error:NSError?) -> Void in
                if let _ = user {
                    self.performSegueWithIdentifier("loginUser", sender: self)
                }else{
                    let errorAlert = UIAlertController(title: "Error", message: "Error Logging in", preferredStyle: UIAlertControllerStyle.Alert)
                    let errorAction = UIAlertAction(title: "Ok", style: .Default, handler: { (action:UIAlertAction) -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                        
                    })
                    errorAlert.addAction(errorAction)
                    self.presentViewController(errorAlert, animated: true, completion: nil)
                }
            })
        }
    }
}

