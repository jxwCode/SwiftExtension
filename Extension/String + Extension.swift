
//
//  String + Extension.swift
//  LinkedDesigner
//
//  Created by jxw on 16/2/29.
//  Copyright © 2016年 shining. All rights reserved.
//

import Foundation
import UIKit
let MAXFLOAT:CGFloat = 3000
extension String{
    /**
     获取字符串宽高
     
     - parameter textWidth:              文本宽度限制
     - parameter mfont:                  字体
     - parameter nsStringDrawingOptions: 排布类型
     
     - returns: 字符串在所限空间内宽高
     */
    func getTextWidthAndHeight(_ textWidth:CGFloat,mfont:UIFont,nsStringDrawingOptions:NSStringDrawingOptions)->[CGFloat]{
        let font=mfont;
        let atts=[NSFontAttributeName:font];
        let rectSize = CGSize(width: textWidth,height: MAXFLOAT);
        let size = self.boundingRect(with: rectSize, options:nsStringDrawingOptions, attributes: atts, context: nil);
        return [size.width,size.height];
    }
    /**
     验证是否为手机号
     
     - returns: bool值
     */
    func valiteMobile() -> Bool{
        if self.characters.count == 0{
            return false
        }else{
            if self.characters.count != 11{
                return false
            }else{
                let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
                /**
                 * 移动号段正则表达式
                 */
                let CM_NUM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
                /**
                 * 联通号段正则表达式
                 */
                let CU_NUM = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
                /**
                 * 电信号段正则表达式
                 */
                let CT_NUM = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
                let pred = NSPredicate(format: "SELF MATCHES %@",mobile)
                let isMatch = pred.evaluate(with: self)
                let pred1 = NSPredicate(format: "SELF MATCHES %@",CM_NUM)
                let isMatch1 = pred1.evaluate(with: self)
                let pred2 = NSPredicate(format: "SELF MATCHES %@",CU_NUM)
                let isMatch2 = pred2.evaluate(with: self)
                let pred3 = NSPredicate(format: "SELF MATCHES %@",CT_NUM)
                let isMatch3 = pred3.evaluate(with: self)
                
                if (isMatch == true||isMatch1 == true || isMatch2 == true || isMatch3 == true) {
                    return true
                }else{
                    return false
                }
            }
        }
    }
    //转义汉字和非法字符+
    func addingUrlPercentEncoding() -> String{
        var tempStr = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        tempStr = tempStr?.replacingOccurrences(of: "+", with:"%2B")
        return tempStr!
    }
}
