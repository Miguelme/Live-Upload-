//
//  StatusUpdateViewController.swift
//  Live Upload Parse
//
//  Created by Miguel Fagundez on 12/20/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit
import Parse

class StatusUpdateVC: UIViewController {

    @IBOutlet weak var statusFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateStatus(sender: UIButton) {
        let status = statusFld.text!
        if status.isEmpty {
        
        }else{
            let newUpdate = PFObject(className: "Status")
            newUpdate["newStatus"] = status
            newUpdate["user"] = PFUser.currentUser()?.username
            newUpdate.saveInBackgroundWithBlock({
                (succeded:Bool, error:NSError?) -> Void in
                if succeded {
                    print("Succeded!")
                    
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
