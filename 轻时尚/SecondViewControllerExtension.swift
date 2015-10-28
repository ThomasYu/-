//
//  SecondViewControllerExtension.swift
//  轻时尚
//
//  Created by 实验室 on 15/10/28.
//  Copyright © 2015年 实验室. All rights reserved.
//

import UIKit
extension secondeViewController: UIPickerViewDataSource{
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return beauties.count
        
    }
}
extension secondeViewController:UIPickerViewDelegate{
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return beauties[row]    }
    
}

