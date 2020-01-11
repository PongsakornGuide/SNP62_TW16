//
//  InsideViewController.swift
//  SNP_TW16
//
//  Created by Guide on 11/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class InsideViewController: UITableViewController{
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return 2
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         if section == 0 {
             return 1
         }else{
             return 5
         }
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if indexPath.section == 0 {
              let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DetailActivityViewController
              return cell
          
          }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! CommentTableView
                return cell
          }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Alder"
                    
        tableView.register(DetailActivityViewController.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
              
              
        tableView.register(CommentTableView.self, forCellReuseIdentifier: cellId1)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    
}
