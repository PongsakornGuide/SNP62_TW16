//
//  ActivityTypeTableViewController.swift
//  SNP_TW16
//
//  Created by Guide on 24/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class ActivityTypeTableViewController: UITableViewController {

    private var cellType = "Cell"
    private var cellType1 = "Cell1"
    var activityTypeList : [ActivityImpress]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return activityTypeList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: cellType1,for: indexPath) as! TypeActivityView
                let activity = activityTypeList?[indexPath.row]
                   cell.textHeader.text = activity?.activityTypeName
        
                            Alamofire.request((activity?.activityIcon ?? "0")!).responseImage { response in
                                 if let image = response.result.value {
                                     cell.bgImage.image = image
                                     }
                                 }
                   cell.selectionStyle = .none
                   cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
              return cell
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let dvc = SubActivityTypeTableViewController()
                let activityType = activityTypeList?[indexPath.row]
                dvc.activityList = activityType?.listDetail
                self.navigationController?.pushViewController(dvc, animated: true)
    }

   override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: cellType)
        tableView.register(TypeActivityView.self, forCellReuseIdentifier: cellType1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }

}
