//
//  String_extension.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/8.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

extension String {
    
    // 根据文字大小计算文字高度
    func autoHeight(fontsize: CGFloat, size: CGSize) -> CGSize {
        let string = self as String
        return string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontsize)], context: nil).size
    }
}
