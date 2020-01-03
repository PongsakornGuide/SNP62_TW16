////
////  SearchController.swift
////  SNP_TW16
////
////  Created by Guide on 21/12/2562 BE.
////  Copyright © 2562 guide. All rights reserved.
////
//
//import UIKit
//class SearchViewController: UITableViewController {
//    
//        private var cellId = "Cell" 
//    
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }
//           
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 5
//        }
//    
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
//            cell.selectionStyle = .none
//
//            self.tableView.separatorStyle = .none
//            return cell
//        }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 50
//    }
//}
