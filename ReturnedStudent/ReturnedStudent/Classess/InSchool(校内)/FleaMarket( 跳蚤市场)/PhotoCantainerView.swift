//
//  PhotoCantainerView.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/21.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

class PhotoCantainerView: UIView {
    
    var label: UILabel!
    var imageViewsArray = [UIImageView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let temp = NSMutableArray()
        for index in 0 ..< 9 {
            
            print("\(index)")
            let imageView = UIImageView()
            self.addSubview(imageView)
            imageView.isUserInteractionEnabled = true
            imageView.tag = index
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapImageView(tap:)))
            imageView.addGestureRecognizer(tap)
            temp.add(imageView)
            
        }
        
        imageViewsArray = temp.copy() as! [UIImageView]
        
    }
    
    var picPathStringsArray = [String]() {
        didSet {
            print("\(picPathStringsArray)")
            
            for index in picPathStringsArray.count ..< imageViewsArray.count {
                let imageView = imageViewsArray[index]
                imageView.isHidden = true
            }
            
            if picPathStringsArray.count == 0 {
                self.height_sd = 0;
                self.fixedHeight = (0);
                return;
            }
            
            let itemW = itemWidthForPicPathArray(array: picPathStringsArray)
            var itemH:CGFloat = 0
            if picPathStringsArray.count == 1 {
                let image = UIImage(named: picPathStringsArray.first!)
                if ((image?.size.width) != nil) {
                    itemH = (CGFloat)((image?.size.height)!) / (CGFloat)((image?.size.width)!) * itemW
                }
            }else {
                itemH = itemW
            }
            
            
            // 2
            let perRowItemCount = perRowItemCountForPicPathArray(array: picPathStringsArray)
            
            for (idx,obj) in picPathStringsArray.enumerated() {
                print("\(index)====\(obj)")
                let columnIndex = idx % perRowItemCount
                let rowIndex = idx / perRowItemCount
                let imageView = imageViewsArray[idx]
                imageView.isHidden = false
                imageView.image = UIImage(named: obj)
                imageView.frame = CGRect(x: (CGFloat)(columnIndex * (Int)(itemW + 5)), y: (CGFloat)(rowIndex * (Int)(itemH + 5)), width: itemW, height: itemH)
            }
            
            
            let w = Int(perRowItemCount) * Int(itemW) + (perRowItemCount - 1) * 5;
            
            let columnCount = ceil(CGFloat(picPathStringsArray.count) / CGFloat(perRowItemCount));
            let h = CGFloat(columnCount) * itemH + CGFloat((columnCount - 1) * 5);
            self.width_sd = CGFloat(w);
            self.height_sd = h;
            
            self.fixedHeight = (h as NSNumber!);
            self.fixedWidth = (w as NSNumber!);
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapImageView(tap: UITapGestureRecognizer) -> Void {
         let imageView = tap.view;
        print("\(imageView?.tag)")
    }
    
    
    func itemWidthForPicPathArray(array:[String]) -> CGFloat {
        if array.count == 1 {
            return 120;
        } else {
            return (ScreenWith - 30) / 3
        }
    }
    
    func perRowItemCountForPicPathArray(array:[String]) -> NSInteger {
        if array.count <= 3 {
            return array.count
        } else if array.count <= 4 {
            return 2
        } else {
            return 3
        }
    }
    
    
}
