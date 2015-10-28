//
//  ViewController.swift
//  轻时尚
//
//  Created by 实验室 on 15/10/28.
//  Copyright © 2015年 实验室. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var pageController = UIPageControl()
    var btn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.center = CGPointMake(self.view.frame.width / 2, self.view.frame.height - 50)
        pageController.currentPageIndicatorTintColor = UIColor.yellowColor()
        pageController.pageIndicatorTintColor = UIColor.whiteColor()
        pageController.numberOfPages = 4
        pageController.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.frame = self.view.bounds //勾勒轮廓,以系统坐标为参照点
        scrollView.contentSize = CGSizeMake(4*self.view.frame.width, 0) //表示一个矩形的宽度和高度
        scrollView.pagingEnabled = true //控制控件是否整页翻动,否则一翻页可能掀起好几张
        //scrollView.bounces = false //拉动反弹效果
        //scrollView.showsHorizontalScrollIndicator = false //水平方向的滚动条不需要
        scrollView.delegate = self
        self.view.addSubview(scrollView) //view增加子视图，scrollview
        //添加图片
        for(var i = 0;i < 4;i++)
        {
            let image = UIImage(named: "w\(i+1)") //将图片赋给image
            //CGRectMake表示一个矩形的位置和大小
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame //更新frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageController)
            
        }
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var index = scrollView.contentOffset.x / self.view.frame.size.width
        pageController.currentPage = Int(index)
        if(index == 3)
        {
            self.btn.frame = CGRectMake(3*self.view.frame.width,self.view.frame.height, self.view.frame.width, 50)
            self.btn.setTitle("轻.时尚", forState: UIControlState.Normal)
            self.btn.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.btn.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted)
            self.btn.backgroundColor = UIColor.orangeColor()
            self.btn.alpha = 0
            self.btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void  in
                self.btn.frame = CGRectMake(3*self.view.frame.width,self.view.frame.height - 100, self.view.frame.width, 50)
                self.btn.alpha = 1
                self.scrollView.addSubview(self.btn)
                }, completion: nil)
            
        }
    }
    func buttonClick(button: UIButton)
    {
        let sb = UIStoryboard(name:"Main",bundle: nil)
        let second = sb.instantiateViewControllerWithIdentifier("first") as! UINavigationController//
        //self.presentedViewController(second,animated:Bool,completion: (() -> Void)?)
        self.presentViewController(second, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
