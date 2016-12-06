//
//  Global.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/6.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

public let ScreenWith = UIScreen.main.bounds.size.width
public let ScreenHeight = UIScreen.main.bounds.size.height
public let MainBounds = UIScreen.main.bounds
public let NavHeight = 64.0
public let TabHeight = 49.0

extension UIColor {
    class func colorwith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
}
