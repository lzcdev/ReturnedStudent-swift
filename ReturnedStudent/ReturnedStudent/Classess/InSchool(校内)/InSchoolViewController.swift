//
//  InSchoolViewController.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/6.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit
import SnapKit

class InSchoolViewController: UIViewController, UIScrollViewDelegate {
    
    let topView = UIView()
    let line = UIView()
    let contentView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        navigationItem.title = "校内"
        
        setChildViewControllers()
        
        setTopView()
        
        setContentView()
        
    }
    
    private func setChildViewControllers() {
        
        // 公告栏
        let noticeBoard = NoticeboardViewController()
        noticeBoard.title = "公告栏"
        self.addChildViewController(noticeBoard)
        
        // 广播站
        let radioStation = RadioStationViewController()
        radioStation.title = "广播站"
        self.addChildViewController(radioStation)
        
        // 小卖部
        let canteen = CanteenViewController()
        canteen.title = "小卖部"
        self.addChildViewController(canteen)
    }
    
    private func setTopView() {
        
        self.view.addSubview(topView)
        
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(NavHeight)
            make.width.equalTo(ScreenWith)
            make.height.equalTo(40)
        }
        
        let count = self.childViewControllers.count
        let buttonW = ScreenWith / CGFloat(count)
        
        line.backgroundColor = UIColor.black
        line.frame.size.height = 2
        line.frame.origin.y = 38;
        line.frame.size.width = 64;
        
        let smallLine = UIView()
        smallLine.frame = CGRect(x: 0, y: 39, width: ScreenWith, height: 0.5)
        smallLine.backgroundColor = UIColor.lightGray
        topView.addSubview(smallLine)
        
        for index in 0 ..< count {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: CGFloat(index) * buttonW, y: 0, width: buttonW, height: 40)
            let vc = self.childViewControllers[index]
            button.setTitle(vc.title, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.tag = index + 1
            button.addTarget(self, action: #selector(changeVC(button:)), for: .touchUpInside)
            topView.addSubview(button)
            
            if index == 0 {
                changeVC(button: button)
                line.center.x = button.center.x
                
            }
            
        }
        topView.addSubview(line)
        
    }
    
    func changeVC(button: UIButton) -> Void {
        
        UIView.animate(withDuration: 0.25) {
            self.line.center.x = button.center.x
        }
        var point = contentView.contentOffset;
        point.x = CGFloat((button.tag-1)) * contentView.frame.size.width;
        contentView.setContentOffset(point, animated: true)
    }
    
    func setContentView() {
        
        contentView.frame = CGRect(x: 0, y: NavHeight+40, width: Int(ScreenWith), height: Int(ScreenHeight) - 64-49-40)
        contentView.isPagingEnabled = true
        contentView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(self.childViewControllers.count), height: 0)
        contentView.bounces = false
        contentView.delegate = self
        self.view.insertSubview(contentView, at: 0)
        self.scrollViewDidEndScrollingAnimation(contentView)
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / self.view.frame.size.width;
        let vc: UIViewController = self.childViewControllers[Int(index)];
        vc.view.frame.origin.x = scrollView.contentOffset.x
        vc.view.frame.origin.y = 0
        vc.view.frame.size.height = scrollView.frame.size.height
        scrollView.addSubview(vc.view)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        self.scrollViewDidEndScrollingAnimation(scrollView)
        let index = scrollView.contentOffset.x / self.view.frame.size.width;
        changeVC(button: topView.subviews[Int(index+1)] as! UIButton)
        
    }
    
}
