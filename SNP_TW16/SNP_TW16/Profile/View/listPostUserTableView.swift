//
//  listPostUserTableView.swift
//  SNP_TW16
//
//  Created by Guide on 31/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class listPostUserTableView: UITableViewController {
    
//    let URL_GET_POST = "http://172.20.10.5/alder_iosapp/v1/savePostUser.php"
    let URL_GET_POST = "http://localhost/alder_iosapp/v1/savePostUser.php"
//    var ActivityList: [ListActivityUser]?
    var ActivityList: [allList]?
    
    let defaultValues = UserDefaults.standard
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var user_id = String()
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            getData()
            self.tableView.reloadData()
            self.tabBarController?.tabBar.isHidden = false
        }
           
        override func numberOfSections(in tableView: UITableView) -> Int {
              return 2
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0{
                return 1
            }else{
                return ActivityList?.count ?? 0
            }
        }
           
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! titleListPostViewCell
                self.tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! AcivityListTableViewCell
                
   
                let listActivity = ActivityList?[indexPath.row]
                cell.userFullname.text = listActivity?.username
                cell.timeTextLabel.text = listActivity?.createdAt
                cell.numCount.text = "\(listActivity?.like ?? 0)"
                cell.numCom.text = "\(listActivity?.comment ?? 0)"
                cell.messageTextLabel.text = listActivity?.caption
                
                   Alamofire.request("http://localhost/alder_iosapp/" + (listActivity?.img ?? "0")!).responseImage { response in
                                         if let image = response.result.value{
                                         cell.postImage.image = image
                             }
                         }
                         
                         Alamofire.request("http://localhost/alder_iosapp/" + (listActivity?.photo ?? "0")!).responseImage { response in
                                         if let image2 = response.result.value {
                                         cell.profileImage.image = image2
                             }
                         }
                
                self.tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }
               
        }
    
            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                if  indexPath.section == 0{
                    
                }else {
                   let vc = InputCommentViewController()
                   vc.check = ActivityList?[indexPath.row]
                   self.navigationController?.pushViewController(vc, animated: true)
               }
           }
 
    
        func getData(){
             let parameters: Parameters = ["userId":user_id]
             let url = URL_GET_POST + "?id=\(user_id)"
             Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                self?.ActivityList = Mapper<allList>().mapArray(JSONObject: dataRes.result.value)
                self?.tableView.reloadData()
             }
         }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") {
            (action, view , completionHandler) in
            print("Delete..")
            completionHandler(true)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {
                  (action, view , completionHandler) in
                  print("Email..")
                completionHandler(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
        
        delete.backgroundColor = UIColor.rgb(red: 255, green: 51, blue: 101)
        delete.image = UIImage(named: "bin")
        
//        image.contentMode = .scaleAspectFill
        
        
        edit.backgroundColor = UIColor.emerald
        edit.image = UIImage(named: "edit")
        return configuration
    }
        
        override func viewDidLoad(){
            super.viewDidLoad()
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
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
