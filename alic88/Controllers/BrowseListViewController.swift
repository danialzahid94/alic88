//
//  BrowseListViewController.swift
//  alic88
//
//  Created by Danial Zahid on 02/07/2015.
//  Copyright (c) 2015 Danial Zahid. All rights reserved.
//

import UIKit

class BrowseListViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    //MARK: - IBOutlet declarations
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variable declarations
    var UtilityManager = UtilityHelper()
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Browse"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - CollectionView DataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("browseListCollectionViewCell", forIndexPath: indexPath) as! BrowseListCollectionViewCell
        
        UtilityManager.bottomBorder(cell, padding: 20.0)
        
        
        return cell
    }
    
    //MARK: - CollectionView Delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(self.collectionView.frame.width, 90)
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
