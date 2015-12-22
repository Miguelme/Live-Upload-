//
//  StatusDetailViewController.swift
//  Live Upload Parse
//
//  Created by Miguel Fagundez on 12/21/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit

class StatusDetailVC: UIViewController {

    @IBOutlet weak var statusLbl: UILabel!
    var statusString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLbl.text = statusString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
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
