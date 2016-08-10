//
//  MemeTableViewController.swift
//  MemeMe_V2.0
//
//  Created by Chad Renner on 8/9/16.
//  Copyright © 2016 Chad Renner. All rights reserved.
//

import UIKit

class MemeTableViewController : UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView!.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell", forIndexPath: indexPath)
        let meme = memes[indexPath.item]
        cell.textLabel!.text = "\(meme.topTextField) \(meme.bottomTextField)"
        cell.imageView!.image = meme.memedImage
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC: MemeDetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        /* Pass the data from the selected row to the detail view and present it */
        detailVC.meme = self.memes[indexPath.row]
        navigationController!.pushViewController(detailVC, animated: true)
    }
}