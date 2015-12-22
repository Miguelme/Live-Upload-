//
//  SignUpViewController.swift
//  Live Upload Parse
//
//  Created by Miguel Fagundez on 12/20/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit
import Parse
class SignUpVC: UIViewController {

    @IBOutlet weak var usernameFld: UITextField!
    @IBOutlet weak var emailFld: UITextField!
    @IBOutlet weak var passwordFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(sender: UIButton) {
        let username = usernameFld.text!
        let email = emailFld.text!
        let password = passwordFld.text!
        
        if username.isEmpty || email.isEmpty || password.isEmpty{
        
        }else{
            let user = PFUser()
            user.username = username
            user.email = email
            user.password = password
            user.signUpInBackgroundWithBlock({ (succeded: Bool,error: NSError?) -> Void in
                
                if succeded{
                    print("succeded!")
                    dispatch_async(dispatch_get_main_queue()){
                        self.performSegueWithIdentifier("takeUserHome", sender: self)
                    }
                    
                }else{
                    let errorString = error?.userInfo["error"] as! NSString
                    
                    print("error sstring = \(errorString)")
                }
            })
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
