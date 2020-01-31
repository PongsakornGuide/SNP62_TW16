//
//  listPostUserTableView.swift
//  SNP_TW16
//
//  Created by Guide on 31/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class listPostUserTableView: UITableViewController {
    let defaultValues = UserDefaults.standard
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var user_id = String()
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            getRelative()
            self.tableView.reloadData()
        }
           
        override func numberOfSections(in tableView: UITableView) -> Int {
              return 2
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0{
                return 1
            }else{
                return 1
            }
        }
           
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! titleListPostViewCell
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! AcivityListTableViewCell
   
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }
               
        }
        
        override func viewDidLoad(){
              super.viewDidLoad()
              tableView.register(titleListPostViewCell.self, forCellReuseIdentifier: cellId)
              tableView.register(AcivityListTableViewCell.self, forCellReuseIdentifier: cellId1)
              tableView.rowHeight = UITableView.automaticDimension
              tableView.estimatedRowHeight = 50
            
            if let userId = defaultValues.string(forKey: "userId") {
                                user_id = userId
                      print("user id :: \(user_id)")
                   }else{
                                //send back to login view controller
            }
        }
}
