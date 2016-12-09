//
//  NoticeboardTableViewCell.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/9.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

class NoticeboardTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!// 标题
    var timeLab: UILabel!// 时间
    var rightImageView: UIImageView!// 照片
    var line: UIView!// 分割线
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        titleLabel = UILabel()
        titleLabel.text = "大学生网购答案，结果只对一题"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.frame = CGRect(x: 15, y: 10, width: self.frame.size.width - 80, height: 30)
        //        let height = titleLabel.zc_autoHeight(text: "大学生网购答案，结果只对一题", font: 15, width: self.frame.size.width / 3 * 2)
        //        titleLabel.frame = CGRect(x: 10, y: 10, width: self.frame.size.width / 3 * 2, height: height)
        self.addSubview(titleLabel)
        
        timeLab = UILabel()
        timeLab.text = "昨日 11：30"
        timeLab.textAlignment = .left
        timeLab.font = UIFont.systemFont(ofSize: 15)
        timeLab.textColor = UIColor.gray
        self.addSubview(timeLab)
        
        rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "header_place_holder")
        self.addSubview(rightImageView)
        
        
        timeLab.snp.makeConstraints({ (make) in
            make.left.equalTo(15)
            make.bottom.equalTo(-10)
            // make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.width.equalTo(self.frame.size.width - 80)
            make.height.equalTo(20)
        })
        
        rightImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.top.equalTo(10)
            make.width.height.equalTo(80)
        }
        
        
        line = UIView()
        line.frame = CGRect(x: 15, y: 99, width: ScreenWith-15, height: 0.5)
        line.backgroundColor = UIColor.lightGray
        line.isHidden = true
        self.addSubview(line)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
