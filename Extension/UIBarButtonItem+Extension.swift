//
//  UIBarButtonItem+Extension.swift

import UIKit

enum ItemButtonType: Int {
    case left = 0
    case right = 1
}

extension UIBarButtonItem {

    class func barButton(_ title: String, titleColor: UIColor, image: UIImage, hightLightImage: UIImage?, target: AnyObject?, action: Selector?, type: ItemButtonType) -> UIBarButtonItem {
        var btn:UIButton = UIButton()
        if type == ItemButtonType.left {
            btn = UIButton(type: .custom)
        } else {
            btn = UIButton(type: .custom)
        }
        btn.setTitle(title, for: UIControlState())
        btn.setImage(image, for: UIControlState())
        btn.setTitleColor(titleColor, for: UIControlState())
        btn.setImage(hightLightImage, for: .highlighted)
        if action != nil{
        btn.addTarget(target, action: action!, for: .touchUpInside)
        }
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
        return UIBarButtonItem(customView: btn)
    }
    
    class func barButton(_ image: UIImage, target: AnyObject?, action: Selector?) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(image, for: UIControlState())
        btn.imageView?.contentMode = UIViewContentMode.left
        if action != nil{
        btn.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
        }
        btn.frame = CGRect(x: 0, y: -5, width: 25, height: 44)
        return UIBarButtonItem(customView: btn)
    }
    
    class func barButton(_ title: String, titleColor: UIColor, target: AnyObject?, action: Selector?) -> UIBarButtonItem {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 62, height: 44))
        btn.setTitle(title, for: UIControlState())
        btn.setTitleColor(titleColor, for: UIControlState())
        if action != nil{
        btn.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
        }
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        if title.characters.count == 2 {
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -25)
        }
        return UIBarButtonItem(customView: btn)
    }
    
    class func shopInforBarButton(_ title: String, titleColor: UIColor, target: AnyObject?, action: Selector?) -> UIBarButtonItem {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btn.setTitle(title, for: UIControlState())
        btn.setTitleColor(titleColor, for: UIControlState())
        if action != nil{
        btn.addTarget(target, action: action!, for: UIControlEvents.touchUpInside)
        }
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        if title.characters.count == 2 {
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -25)
        }
        return UIBarButtonItem(customView: btn)
    }

}
