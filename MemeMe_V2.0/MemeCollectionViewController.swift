//
//  MemeCollectionViewController.swift
//  MemeMe_V2.0
//
//  Created by Chad Renner on 8/9/16.
//  Copyright © 2016 Chad Renner. All rights reserved.
//

import UIKit

class MemeCollectionViewController : UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Implement flowLayout here.
        let space: CGFloat = 2.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(width, height)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    /* Return number of items in memes array */
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
   
    /* Configure collection view cells for each Meme */
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.item]
        // Set the name and image
        cell.collectionLabel!.text = "\(meme.topTextField) \(meme.bottomTextField)"
        cell.collectionImage!.image = meme.memedImage
        //let imageView = UIImageView(image: meme.memedImage)
        //cell.backgroundView = imageView
        
        return cell
    }

    
    /* Define behavior when a cell is selected */
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let detailVC: MemeDetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        /* Pass the data from the selected row to the detail view and present it */
        detailVC.meme = self.memes[indexPath.row]
        navigationController!.pushViewController(detailVC, animated: true)
    }
}
