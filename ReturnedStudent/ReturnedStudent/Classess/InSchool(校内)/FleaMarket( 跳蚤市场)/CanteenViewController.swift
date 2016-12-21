//
//  CanteenViewController.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/8.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

class CanteenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var label: UILabel!
    var table: UITableView!
    var namesArray = [String]()
    var textArray = [String]()
    var timeArray = [String]()
    var universityArray = [String]()
    var imagesArray = [String]()
    
    
    var dataArray = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-64-49-40), style: .plain)
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 200
        table.allowsSelection = false
        self.view.addSubview(table)
        
        table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        namesArray = ["鲁志超","唐巧","臧成威","田丰宇","小青","sunnyxx","虾神","叶孤城","喵叔叔","喵神"]
        timeArray = ["1分钟前","2分钟前","5分钟前","20分钟前","1小时前","3小时前","1天前","2天前","5天前","1个月前"]
        universityArray = ["中央民族大学","清华大学","北京大学","浙江大学","复旦大学","北京师范大学","山东大学","中央美术学院","中国传媒学院","上海交通大学"]
        textArray = ["DynamicCocoa，是滴滴 App 架构组自研的 iOS 动态化方案，可以让现有的 Objective-C 代码转换生成中间代码（JS），下发后动态执行。滴滴客户端 App 架构团队表示正在积极准备相关事项，考虑于 2017 年初开源。","使用原生技术栈：使用者完全不用接触到 JS 或任何中间代码，保持原生的 Objective-C 开发、调试方式不变","无需重写已有代码：已有 native 模块能很方便的变成动态化插件","语法支持完备性高：支持绝大多数日常开发中用到的语法，不用担心这不支持那不支持","支持 HotPatch：改完 bug 后直接从源码打出 patch，一站式解决动态化和热修复需求","支持 C 函数的定义与 C 函数的调用、内联函数的调用","支持 C 与 OC 的可变参数方法的调用，如 NSLog","滴滴使用 ruby 开发了一套命令行工具（ 类比为 xcodebuild ），大幅简化了配置开发环境、OC 代码转换、资源处理、打包的复杂度","相比跨端方案，也带来了一个新思路：iOS 和 Android 都保留 native 开发模式，用各自的方式将 native 代码直接动态化，保持各平台的差异性。","DynamicCocoa 动态化技术给 App 开发带来了很大的想象空间"]
        
        imagesArray = ["about", "about", "about"]
        
        for index in 0 ..< textArray.count {
            let model = FriendCircleModel()
            model.content = textArray[index]
            model.name = namesArray[index]
            model.time = timeArray[index]
            model.university = universityArray[index]
     
//            var arr = [String]()
//            let random: Int = Int(arc4random_uniform(9))
            
            //for _ in 0 ..< random {
                //let random1: Int = Int(arc4random_uniform(9))
            //    arr.append(imagesArray[0])
            //}
            
            
            model.imageArray = imagesArray
            dataArray.append(model)
        }
        
        table.reloadData()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.model = dataArray[indexPath.row] as? FriendCircleModel
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = dataArray[indexPath.row] as! FriendCircleModel
        return table.cellHeight(for: indexPath, model: model, keyPath: "model", cellClass: TableViewCell.self, contentViewWidth: 0)
    }
    
    
}

