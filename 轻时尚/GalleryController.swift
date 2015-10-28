//
//  GalleryController.swift
//  轻时尚
//
//  Created by 实验室 on 15/10/28.
//  Copyright © 2015年 实验室. All rights reserved.
//

import UIKit
import Social

class GalleryViewController: UIViewController {
    
    
    @IBOutlet weak var beautyimage: UIImageView!
    
        var imageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = imageName
        {
            beautyimage.image = UIImage(named: imageName!)
            switch name {
            case "fanbingbing":
                navigationItem.title = "范冰冰"
            case "zhoujielun":
                navigationItem.title = "周杰伦"
            case "gaoyuanyuan":
                navigationItem.title = "高圆圆"
            case "piaoxinhui":
                navigationItem.title = "朴信惠"
            case "angelababy":
                navigationItem.title = "Angelababy"
            default:
                navigationItem.title = "Beauty"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareTapped(sender: AnyObject) {
        
        var controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        controller.setInitialText("这是我的style，想知道你的style吗？那就快来下载App<轻 时尚>,与朋友一起分享吧！http://blog.csdn.net/u014629553")
        controller.addImage(beautyimage.image)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    
    
    
    
    /*
    @IBAction func shareTapped(sender: AnyObject) {
        var controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        controller.setInitialText("这是我的style，想知道你的style吗？那就快来下载App<轻 时尚>,与朋友一起分享吧！https://www.git@github.com:ThomasYu/iOS-swift-.git")
        controller.addImage(beautyimage.image)
        self.presentViewController(controller, animated: true, completion: nil)

    }
    
    
    
    
    @IBAction func shareTapped(sender: AnyObject) {
        var controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        controller.setInitialText("这是我的style，想知道你的style吗？那就快来下载App<轻 时尚>,与朋友一起分享吧！https://www.git@github.com:ThomasYu/iOS-swift-.git")
        controller.addImage(beautyimage.image)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    */
}
