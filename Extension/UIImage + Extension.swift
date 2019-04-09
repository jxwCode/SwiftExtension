//
//  UIImage + Extension.swift

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


extension UIImage {
    
    class func imageWithColor(_ color: UIColor, size: CGSize, alpha: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(rect.size)
        let ref = UIGraphicsGetCurrentContext()
        ref!.setAlpha(alpha)
        ref!.setFillColor(color.cgColor)
        ref!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    class func createImageFromView(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size);
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    func imageClipOvalImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        ctx!.addEllipse(in: rect)
        
        ctx!.clip()
        self.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    ///对指定图片进行拉伸
    func resizableImage(_ name: String) -> UIImage {
        
        var normal = UIImage(named: name)!
        let imageWidth = normal.size.width * 0.5
        let imageHeight = normal.size.height * 0.5
        normal = self.resizableImage(withCapInsets: UIEdgeInsetsMake(imageHeight, imageWidth, imageHeight, imageWidth))
        
        return normal
    }
    
    /**
     *  压缩上传图片到指定字节
     *
     *  image     压缩的图片
     *  maxLength 压缩后最大字节大小
     *
     *  return 压缩后图片的二进制
     */
    func compressImage(_ image: UIImage, maxLength: Int) -> Data? {
        
//        //先调整分辨率
//        var newSize = CGSizeMake(image.size.width, image.size.height);
//        
//        let tempHeight = newSize.height / 1024;
//        let tempWidth = newSize.width / 1024;
//        
//        if (tempWidth > 1.0 && tempWidth > tempHeight) {
//            newSize = CGSizeMake(image.size.width / tempWidth, image.size.height / tempWidth);
//        }
//        else if (tempHeight > 1.0 && tempWidth < tempHeight){
//            newSize = CGSizeMake(image.size.width / tempHeight, image.size.height / tempHeight);
//        }
//        
//        UIGraphicsBeginImageContext(newSize)
//        image.drawInRect(CGRectMake(0,0,newSize.width,newSize.height))
//        let newImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        //调整大小
//        let imageData = UIImageJPEGRepresentation(newImage,1.0);
//        let sizeOrigin = imageData!.length;
//        let sizeOriginKB = sizeOrigin / 1024
//        if (CGFloat(sizeOriginKB) > imageLength) {
//            let finallImageData = UIImageJPEGRepresentation(newImage,0.50);
//            return finallImageData
//        }
//        
//        return imageData;
        var maxLen = 1 * 1024 * 1024
        if maxLength < maxLen{
           maxLen = maxLength
        }
        let newSize = self.scaleImage(image, imageLength: image.size.width)
        var newImage = image
    
        if let reSizeImage = self.resizeImage(image, newSize: newSize) {
            newImage = reSizeImage
        }
        var compress:CGFloat = 1.0
        var data = UIImageJPEGRepresentation(newImage, compress)
        
        while data?.count > maxLen && compress > 0.01 {
            compress -= 0.02
            data = UIImageJPEGRepresentation(newImage, compress)
        }
        
        return data
    }
    
    /**
     *  通过指定图片最长边，获得等比例的图片size
     *
     *  image       原始图片
     *  imageLength 图片允许的最长宽度（高度）
     *
     *  return 获得等比例的size
     */
    func  scaleImage(_ image: UIImage, imageLength: CGFloat) -> CGSize {
        
        var newWidth:CGFloat = 0.0
        var newHeight:CGFloat = 0.0
        let width = image.size.width
        let height = image.size.height
        
        if (width > imageLength || height > imageLength){
            
            if (width > height) {
                
                newWidth = imageLength;
                newHeight = newWidth * height / width;
                
            }else if(height > width){
                
                newHeight = imageLength;
                newWidth = newHeight * width / height;
                
            }else{
                
                newWidth = imageLength;
                newHeight = imageLength;
            }
            
        }
        return CGSize(width: newWidth, height: newHeight)
    }
    
    /**
     *  获得指定size的图片
     *
     *  image   原始图片
     *  newSize 指定的size
     *
     *  return 调整后的图片
     */
    func resizeImage(_ image: UIImage, newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

typealias WCAsset = UIImage.Asset
extension UIImage{
    enum Asset:String{
        case Add_friend_icon_addgroup = "add_friend_icon_addgroup"
        case Add_friend_icon_contacts = "add_friend_icon_contacts"
        case Add_friend_icon_invite = "add_friend_icon_invite"
        case Add_friend_icon_offical = "add_friend_icon_offical"
        case Add_friend_icon_reda = "add_friend_icon_reda"
        case Add_friend_icon_scanqr = "add_friend_icon_scanqr"
        
        var image:UIImage{
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset:WCAsset){
        self.init(named: asset.rawValue)//同级调用
    }
}
