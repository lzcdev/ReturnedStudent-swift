//
//  RadioStationViewController.swift
//  ReturnedStudent
//
//  Created by LuzhiChao on 16/12/8.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

import UIKit

class RadioStationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table: UITableView!
    let cellId = "cell"

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupTableView()
    }
    
    func setupTableView() {
        let rect = CGRect(x: 0, y: 0, width: ScreenWith, height: ScreenHeight-64-49)
        table = UITableView(frame: rect, style: UITableViewStyle.plain)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(table)
        
        table.register(UINib.init(nibName: "TreeHoleTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        table.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNew))
        table.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMore))
        table.mj_header.beginRefreshing()
        
    }
    
    // 下拉刷新
    @objc private func loadNew() {
        table.mj_header.endRefreshing()
    }
    
    @objc private func loadMore() {
        table.mj_footer.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TreeHoleTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TreeHoleTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}
