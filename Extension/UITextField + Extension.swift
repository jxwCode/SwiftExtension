//
//  UITextField + Extension.swift
//  LinkedDesigner
//
//  Created by jxw on 16/3/3.
//  Copyright © 2016年 shining. All rights reserved.
//

import UIKit

extension UITextField {

    func  setBorderStyle(_ borderWidth:CGFloat,borderColor:UIColor){
        self.borderStyle = UITextBorderStyle.none
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func addNumberAccessView(){
        let keyBoardAccessoryView = UIView(frame:CGRect(x: 0, y: 0, width: ScreenWidth, height: 40))
        keyBoardAccessoryView.backgroundColor = UIColor(hexString: "#e1e1e1")
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        backButton.setTitle("取消", for: UIControlState())
        backButton.setTitleColor(UIColor.gray, for: UIControlState())
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        backButton.addTarget(self, action: #selector(FilterPriceCell.accessoryButtonBack), for: .touchUpInside)
        let doneButton = UIButton(frame: CGRect(x: ScreenWidth - 50, y: 0, width: 50, height: 40))
        doneButton.setTitle("完成", for: UIControlState())
        doneButton.setTitleColor(UIColor(hexString: "#F35A5D"), for: UIControlState())
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        doneButton.addTarget(self, action: #selector(FilterPriceCell.accessoryButtonDone), for: .touchUpInside)
        keyBoardAccessoryView.addSubview(backButton)
        keyBoardAccessoryView.addSubview(doneButton)
        self.inputAccessoryView = keyBoardAccessoryView;
    }
    
    func accessoryButtonBack(){
        self.resignFirstResponder()
    }
    
    func accessoryButtonDone(){
        self.resignFirstResponder()
    }
}
