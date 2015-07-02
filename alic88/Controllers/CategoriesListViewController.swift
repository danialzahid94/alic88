//
//  CategoriesListViewController.swift
//  alic88
//
//  Created by Danial Zahid on 02/07/2015.
//  Copyright (c) 2015 Danial Zahid. All rights reserved.
//

import UIKit

class CategoriesListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    //MARK: - IBOutlet declarations
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variable declarations
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Categories"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryTableViewCell") as! CategoryTableViewCell
        
        return cell
        
    }
    
    //MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("pushToBrowseVC", sender: nil)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pushToBrowseVC"{
            var browseVC = segue.destinationViewController as! BrowseListViewController
            browseVC.hidesBottomBarWhenPushed = true
        
            
        }
    }
    

}
