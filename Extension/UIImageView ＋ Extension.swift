//
//  UIImageView ＋ Extension.swift
//  LinkedDesigner
//
//  Created by jxw on 16/2/22.
//  Copyright © 2016年 shining. All rights reserved.
//

import UIKit
import Kingfisher

enum ImageSizeType:String{
    case ces//超小 高度130px宽度130px
    case cs//小  高度200px宽度200px
    case cn//正常 高度240px宽度240px
}

extension UIImageView {
    
    class func  orvalImageView(_ imageView:UIImageView,cornerRad:CGFloat,borderW:CGFloat,borderColor:UIColor){
        imageView.layer.cornerRadius = cornerRad
        imageView.layer.borderWidth = borderW
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.masksToBounds = true;
    }
    
    func setFileImage(_ imageUrl:String,placeHoder:String?,sizeType:ImageSizeType?,widthRadio:Int?,heightRadio:Int?,orLarge:Bool){
        self.isHidden = false
        let image = placeHoder == nil ? nil:UIImage(named: placeHoder!);
        let utf8Str = transImageUrl(imageUrl: imageUrl, sizeType: sizeType, widthRadio: widthRadio, heightRadio: heightRadio, orLarge: orLarge)
        guard let tempUrl = URL(string: utf8Str!)else{
            return
        }
        self.kf.setImage(with: tempUrl, placeholder: image, options: nil, progressBlock: nil, completionHandler: nil)
    }
    //设置图片
    func setCallBackFileImage(_ imageUrl:String,placeHoder:String?,sizeType:ImageSizeType?,widthRadio:Int?,heightRadio:Int?,orLarge:Bool,callBack:@escaping ((_ image:UIImage?) -> Void)){
        self.isHidden = false
        let utf8Str = transImageUrl(imageUrl: imageUrl, sizeType: sizeType, widthRadio: widthRadio, heightRadio: heightRadio, orLarge: orLarge)
        guard let tempUrl = URL(string: utf8Str!)else{
            return
        }
        let downer = KingfisherManager.shared.downloader
        downer.downloadImage(with: tempUrl, options: nil, progressBlock: { (receivedSize, totalSize) in
        }) { (image, error, imageURL, originalData) -> () in
            self.image = image
            callBack(image)
        }
    }
    func transImageUrl(imageUrl:String,sizeType:ImageSizeType?,widthRadio:Int?,heightRadio:Int?,orLarge:Bool) ->String?{
        var url = ""
        if imageUrl.hasPrefix("http") == true{
            if orLarge {
                url = imageUrl + "@!large" //String(format: "@%dw_1l",Int(ScreenWidth))
            }else{
                url = imageUrl + String(format: "@!%@%d_%d_i2x",sizeType!.rawValue,widthRadio!,heightRadio!)
            }
        }else{
            if imageUrl.characters.count > 0{
                if orLarge {
                    url = HOST + imageUrl + "@!large" //String(format: "@%dw_1l",Int(ScreenWidth))
                }else{
                    url = HOST + imageUrl + String(format: "@!%@%d_%d_i2x",sizeType!.rawValue,widthRadio!,heightRadio!)
                }
            }
        }
        return UITool.transLawedUrlStr(url)
    }
    //    设置图片
    func setSecureImage(_ imageUrl:String,placeHoder:String?,callBack:@escaping ((_ image:UIImage?) -> Void)){
        self.isHidden = false
        var url = ""
        if imageUrl.hasPrefix("http") == true{
            url = imageUrl
        }else{
            if imageUrl.characters.count > 0{
                url = HOST + imageUrl
            }
        }
        let utf8Str = UITool.transLawedUrlStr(url)
        guard let tempUrl = URL(string: utf8Str!)else{
            return
        }
        let token = AccountTool.getToken()
        let downer = KingfisherManager.shared.downloader
//        downer.requestModifier = {
//            (request: NSMutableURLRequest) in
//            request.setValue(token, forHTTPHeaderField: "X-Auth-Token")
//        }
        let modify = AnyModifier { request in
            var r = request
            r.setValue(token, forHTTPHeaderField: "X-Auth-Token")
            return r
        }
        downer.downloadImage(with: tempUrl, options: [.requestModifier(modify)], progressBlock: { (receivedSize, totalSize) in
        }) { (image, error, imageURL, originalData) -> () in
            self.image = image
            callBack(image)
        }
    }
}

