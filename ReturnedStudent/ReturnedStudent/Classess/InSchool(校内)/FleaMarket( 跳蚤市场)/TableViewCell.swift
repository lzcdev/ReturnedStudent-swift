//
//  TableViewCell.swift
//  ZCAutoLayout
//
//  Created by LuzhiChao on 16/12/20.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    var headImage: UIImageView!
    var nameLab: UILabel!
    var genderImage: UIImageView!
    var timeLab: UILabel!
    var fromLab: UILabel!
    var contentLab: UILabel!
    var photoView: PhotoCantainerView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        headImage = UIImageView()
        headImage.frame = CGRect(x: 10, y: 5, width: 40, height: 40)
        headImage.image = UIImage(named: "about")
        
        nameLab = UILabel()
        
        genderImage = UIImageView()
        genderImage.image = UIImage(named: "about")
        
        timeLab = UILabel()
        
        fromLab = UILabel()
        
        contentLab = UILabel()
        
        photoView = PhotoCantainerView()
 
        self.contentView.sd_addSubviews([headImage, nameLab, genderImage, timeLab, fromLab, contentLab,photoView])
        
    }
    
    var model:FriendCircleModel? {
        didSet {
            let width = nameLab.zc_autoWidth(text: (model?.name)!, font: 16, height: 20)
            nameLab.frame = CGRect(x: 60, y: 5, width: width, height: 20)
            
            genderImage.frame = CGRect(x: nameLab.frame.maxX+5, y: 5, width: 10, height: 10)
            
            let width1 = timeLab.zc_autoWidth(text: (model?.time)!, font: 14, height: 20)
            timeLab.frame = CGRect(x: 60, y: 25, width: width1, height: 20)
            
            let width2 = fromLab.zc_autoWidth(text: "来自[\((model?.university)!)]", font: 14, height: 20)
            fromLab.frame = CGRect(x: timeLab.frame.maxX+5, y: 25, width: width2, height: 20)
            
            let height = contentLab.zc_autoHeight(text: (model?.content)!, font: 14, width: UIScreen.main.bounds.size.width - 20)
            contentLab.frame = CGRect(x: 10, y: 50, width: UIScreen.main.bounds.size.width - 20, height: height)
            
            photoView.picPathStringsArray = (model?.imageArray)!
            
            
            photoView.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.top.equalTo(contentLab.snp.bottom).offset(10)
                make.width.equalTo(ScreenWith-20)
                make.height.equalTo(photoView.frame.size.height)
            }
            
            
            
            self.setupAutoHeight(withBottomView: photoView, bottomMargin: 10)
        }
    }
    
        func heightForCell(model:FriendCircleModel)->(CGFloat){
            self.layoutIfNeeded()
            //返回最最下方控件的最大Y值，就是高度啦
            return  contentLab.frame.maxY+10
        }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
