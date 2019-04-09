//
//  UIButton + Extension.swift
//  LinkedDesigner
//
//  Created by jxw on 16/6/6.
//  Copyright © 2016年 shining. All rights reserved.
//

import UIKit

extension UIButton{
    
    func setCustom(_ nomalTitle:String?,nomalTitleColor:UIColor?,nomalImage:UIImage?,target:AnyObject?,action:Selector?){
        self.setTitle(nomalTitle, for: UIControlState())
        self.setTitleColor(nomalTitleColor, for: UIControlState())
        self.setImage(nomalImage, for: UIControlState())
        if action != nil{
        self.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
        }
    }
    func setCustomUi(_ borderColor:UIColor?,borderWidth:CGFloat?,cornerRadius:CGFloat?){
        self.layer.borderColor = borderColor!.cgColor
        self.layer.borderWidth = borderWidth!
        self.layer.cornerRadius = 3
    }
    func setButtonTitle(_ title:String?,titleColor:UIColor?){
        self.setTitle(title, for: UIControlState())
        self.setTitleColor(titleColor, for: UIControlState())
    }
    
    func setCustomButton(_ nomalTitle:String?,nomalTitleColor:UIColor?,borderColor:UIColor?,borderWidth:CGFloat?,cornerRadius:CGFloat?){
        self.setTitle(nomalTitle, for: UIControlState())
        self.setTitleColor(nomalTitleColor, for: UIControlState())
        self.layer.borderColor = borderColor!.cgColor
        self.layer.borderWidth = borderWidth!
        self.layer.cornerRadius = 3
    }
    func setCommonButton(_ nomalTitle:String?,nomalTitleColor:UIColor?,nomalImage:UIImage?,borderColor:UIColor?,borderWidth:CGFloat?,cornerRadius:CGFloat?,target:AnyObject?,action:Selector?){
        self.setTitle(nomalTitle, for: UIControlState())
        self.setImage(nomalImage, for: UIControlState())
        self.setTitleColor(nomalTitleColor, for: UIControlState())
        self.layer.borderColor = borderColor!.cgColor
        self.layer.borderWidth = borderWidth!
        self.layer.cornerRadius = 3
        if action != nil{
        self.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
        }
    }

}
