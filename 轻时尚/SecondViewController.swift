//
//  SecondViewController.swift
//  轻时尚
//
//  Created by 实验室 on 15/10/28.
//  Copyright © 2015年 实验室. All rights reserved.
//

import UIKit

class secondeViewController: UIViewController {
    
    
    @IBOutlet weak var beautyPicker: UIPickerView!

    
    let beauties = ["周杰伦","Angelababy","范冰冰","高圆圆","朴信惠"]
    //let beauties = ["zhoujielun","angelababy","fanbingbing","gaoyuanyuan","piaoxinhui"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beautyPicker.dataSource = self
        beautyPicker.delegate = self
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //重载
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GOToGallery" {
            let index = beautyPicker.selectedRowInComponent(0)
            var imageName:String?
            switch index{
            case 0:
                imageName = "zhoujielun"
            case 1:
                imageName = "angelababy"
            case 2:
                imageName = "fanbingbing"
            case 3:
                imageName = "gaoyuanyuan"
            case 4:
                imageName = "piaoxinhui"

            default:
                imageName = nil
            }
            var vc = segue.destinationViewController as! GalleryViewController
            vc.imageName = imageName
            
        }
        
    }
    
}

