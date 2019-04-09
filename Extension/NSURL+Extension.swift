//
//  NSURL+Extension.swift
//  LinkedDesigner
//
//  Created by jxw on 17/3/29.
//  Copyright © 2017年 shining. All rights reserved.
//

import UIKit

class NSURL_Extension: NSURL {

}

extension URL {
    var filetTypeIdentifier: String? {
        guard isFileURL else { return nil }
//        var uniformTypeIdentifier: AnyObject?
        do {
//            try getResourceValue(&uniformTypeIdentifier, forKey:  URLResourceKey.typeIdentifierKey)
//            return uniformTypeIdentifier as? String
            return try resourceValues(forKeys: [.typeIdentifierKey]).typeIdentifier
        } catch let error as NSError {
            print(error.debugDescription)
            return nil
        }
    }
}
