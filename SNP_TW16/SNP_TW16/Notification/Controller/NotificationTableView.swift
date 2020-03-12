//
//  NotificationTableView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 11/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class NotificationTableView: UITableViewController,UNUserNotificationCenterDelegate {
    
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
               return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 5
//                       return header?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if indexPath.section == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! NotificationTitle
               cell.selectionStyle = .none
               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell
                      
       }else{
             let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! NotificationColumn
             cell.selectionStyle = .none
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
             return cell
              }
       }
       
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableView.register(NotificationTitle.self, forCellReuseIdentifier: cellId)
        tableView.register(NotificationColumn.self, forCellReuseIdentifier: cellId1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
}
