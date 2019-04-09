//
//  Cell.swift
//  Bridging
//
//  Created by jxw on 2018/9/6.
//  Copyright © 2018年 shining. All rights reserved.
//

import UIKit
//cell的
extension UITableViewCell{
    class var identifier:String{
        return String(describing: self.classForCoder())
    }
    
    class var nib:UINib{
        let nib = UINib(nibName: String(describing: self.classForCoder()), bundle: nil)
        return nib
    }
}
