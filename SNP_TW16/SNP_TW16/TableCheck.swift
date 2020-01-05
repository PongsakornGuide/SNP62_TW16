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
    override func numberOfSections(in tableView: UITableView) -> Int {
                return 1
            }
        

               
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return 10
            }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
           
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//          let DvC = HomeViewController()
//          self.navigationController?.pushViewController(DvC, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
