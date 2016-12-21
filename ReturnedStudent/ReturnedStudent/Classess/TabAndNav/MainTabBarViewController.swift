//
//  MainTabBarViewController.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/6.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllChildController()
        
        
    }

    func setUpAllChildController() {
        
        tabBarAddChildController(vc: InSchoolViewController(), title: "校内", imageName: "activity_select", selectedImageName: "activity_deselect", badgeValue: "")
        tabBarAddChildController(vc: ComplaintsViewController(), title: "大嘈场", imageName: "activity_select", selectedImageName: "activity_deselect", badgeValue: "")
        tabBarAddChildController(vc: ScheduleViewController(), title: "课程表", imageName: "activity_select", selectedImageName: "activity_deselect", badgeValue: "")
        tabBarAddChildController(vc: WalkStreetViewController(), title: "步行街", imageName: "activity_select", selectedImageName: "activity_deselect", badgeValue: "2")
        tabBarAddChildController(vc: MyViewController(), title: "我的", imageName: "activity_select", selectedImageName: "activity_deselect", badgeValue: "")
        
    }
    
    func tabBarAddChildController(vc: UIViewController, title: String, imageName: String, selectedImageName: String, badgeValue: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        addChildViewController(MainNavigationViewController(rootViewController: vc))
        vc.tabBarController?.tabBar.tintColor = UIColor.red
        if !badgeValue.isEmpty {
            vc.tabBarItem.badgeValue = badgeValue
        }
    }

}
