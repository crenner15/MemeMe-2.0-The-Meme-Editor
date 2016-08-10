//
//  MemeDetailViewController.swift
//  MemeMe_V2.0
//
//  Created by Chad Renner on 8/9/16.
//  Copyright © 2016 Chad Renner. All rights reserved.
//

import UIKit

class MemeDetailViewController : UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    
    var meme: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.memeLabel!.text = "\(meme.topTextField) \(meme.bottomTextField)"
        self.tabBarController?.tabBar.hidden = true
        self.imageView!.image = self.meme.memedImage
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }

}