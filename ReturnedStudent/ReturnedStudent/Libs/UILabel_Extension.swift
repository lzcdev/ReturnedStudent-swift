//
//  UILabel_Extension.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/8.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

extension UILabel {
    
    // 根据label文字大小和宽度计算高度
    func zc_autoHeight(text: String, font: CGFloat, width: CGFloat) -> CGFloat {
        let label = self as UILabel
        label.text = text
        label.font = UIFont.systemFont(ofSize: font)
        label.numberOfLines = 0
        return text.autoHeight(fontsize: font, size: CGSize(width: width, height: 0)).height
    }
    
    // 根据label文字大小和高度计算宽度
    func zc_autoWidth(text: String, font: CGFloat, height: CGFloat) -> CGFloat {
        let label = self as UILabel
        label.text = text
        label.font = UIFont.systemFont(ofSize: font)
        label.numberOfLines = 0
        return text.autoHeight(fontsize: font, size: CGSize(width: 0, height: height)).width
    }

    
}
