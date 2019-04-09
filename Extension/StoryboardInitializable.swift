//
//  StoryboardInitializable.swift
//  RepoSearcher
//
//  Created by Arthur Myronenko on 7/13/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
//扩展通过storyboardv创建的试图控制器
protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInitializable where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static func initFromStoryboard(name: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
