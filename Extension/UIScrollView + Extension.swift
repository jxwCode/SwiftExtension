//
//  UIScrollView + Extension.swift
//  LinkedDesignerBuyer
//
//  Created by jxw on 2017/10/31.
//  Copyright © 2017年 shining. All rights reserved.
//

import UIKit

extension UIScrollView {

    func adjustContentInsetsClosed(){
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}
