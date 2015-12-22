//
//  HomeViewController.swift
//  Live Upload Parse
//
//  Created by Miguel Fagundez on 12/20/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit
import Parse

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var statusObjects = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        loadStatuses()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        loadStatuses()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! StatusCell
        cell.usernameLbl.text = statusObjects[indexPath.row]["user"] as? String
        cell.statusLbl.text = statusObjects[indexPath.row]["newStatus"] as? String
        cell.imageView?.image = nil
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusObjects.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController : StatusDetailVC = storyboard?.instantiateViewControllerWithIdentifier("statusDetail") as! StatusDetailVC
        let string = statusObjects[indexPath.row]["newStatus"] as? String
        viewController.statusString = string!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func logOut(sender: UIBarButtonItem) {
        PFUser.logOut()
        self.navigationController?.popViewControllerAnimated(true)
    }

    func loadStatuses(){
        let queryStatus = PFQuery(className: "Status")
        queryStatus.orderByDescending("createdAt")
        queryStatus.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            if let errorDict = error{
                print("error \(errorDict)")
            }else{
                self.statusObjects = objects!
                print("Objects \(objects)")
                self.tableView.reloadData()
            }
        }

    }
}
