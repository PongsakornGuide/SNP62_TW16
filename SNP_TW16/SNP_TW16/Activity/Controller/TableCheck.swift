//
//  TableCheck.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TableCheck: UITableViewController {
    
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
                        let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ActivityHeaderViewCell
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                                    return cell
                 }else{
                     let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
                     cell.selectionStyle = .none
                     cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                     return cell
                }

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
                   
        }else{
            let DvC = ContentActivityViewController()
            self.navigationController?.pushViewController(DvC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationItem.title = "Alder"
    tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
    tableView.register(ActivityHeaderViewCell.self, forCellReuseIdentifier: cellId1)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
