//
//  NoticeboardViewController.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/8.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

class NoticeboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table: UITableView!
    let cellId = "cell"
    var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        let rect = CGRect(x: 0, y: 0, width: ScreenWith, height: ScreenHeight-64-49-40)
        table = UITableView(frame: rect, style: UITableViewStyle.grouped)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(table)
        
        table.register(NoticeboardTableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NoticeboardTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NoticeboardTableViewCell
        if indexPath.row == 0 {
            cell.line.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView = UIView()
        headerView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 10, y: 10, width: 60, height: 20)
        titleLabel.text = "新鲜事"
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        headerView.addSubview(titleLabel)
        
        let readNumLabel = UILabel()
        readNumLabel.textColor = UIColor.lightGray
        let width = readNumLabel.zc_autoWidth(text: "今日10000阅读", font: 13, height: 20)
        readNumLabel.frame = CGRect(x: 80, y: 10, width: width, height: 20)
        headerView.addSubview(readNumLabel)
        
        let moreButton = UIButton()
        moreButton.frame = CGRect(x: ScreenWith-70, y: 10, width: 60, height: 20)
        moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        moreButton.setTitleColor(UIColor.lightGray, for: .normal)
        moreButton.setTitle("更多 >", for: .normal)
        moreButton.addTarget(self, action: #selector(more(button:)), for: .touchUpInside)
        headerView.addSubview(moreButton)
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 15, y: 40, width: ScreenWith - 30, height: 120)
        imageView.image = UIImage(named: "")
        imageView.backgroundColor = UIColor.lightGray
        headerView.addSubview(imageView)
        
        return headerView
    }
    
    func more(button: UIButton) -> Void {
        print("更多")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return section == 1 ? 0.01 : 12
    }
    
}
