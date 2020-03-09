////
////  listPostTableView.swift
////  SNP_TW16
////
////  Created by Guide on 31/1/2563 BE.
////  Copyright © 2563 guide. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import ObjectMapper
//class listFavoriteUserTableView: UITableViewController{
//
//    let URL_GET_POST = "http://localhost/alder_iosapp/v1/saveActivityUser.php"
////    let URL_GET_POST = "http://172.20.10.5/alder_iosapp/v1/saveActivityUser.php"
//    var ActivityList: [ListPostUser]?
//    
//
//
//    private var cellId = "Cell"
//    private var cellId1 = "Cell1"
//    var user_id = String()
//    let defaultValues = UserDefaults.standard
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        getRelative()
//        self.tableView.reloadData()
//    }
//
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//          return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0{
//            return 1
//        }else{
//            return ActivityList?.count ?? 0
//        }
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! titleListActivityViewCell
//            self.tableView.separatorStyle = .none
//            cell.selectionStyle = .none
//            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
//            return cell
//        }else{
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! SearchTableViewCell
//            let listActivity = ActivityList?[indexPath.row]
//            cell.titleFullname.text = listActivity?.titlePost
//            cell.supportName.text = listActivity?.captionPost
//            cell.supportTime.text = listActivity?.createdPost
//            Alamofire.request((listActivity?.imgPost ?? "0")!).responseImage { response in
//                if let image = response.result.value {
//                    cell.bgActivitity.image = image
//                }
//            }
//            self.tableView.separatorStyle = .none
//            cell.selectionStyle = .none
//            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
//            return cell
//        }
//
//    }
//
//    func getRelative(){
//         let parameters: Parameters = ["userId":user_id]
//         let url = URL_GET_POST + "?id=\(user_id)"
//         Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
//              self?.ActivityList = Mapper<ListPostUser>().mapArray(JSONObject: dataRes.result.value)
//              self?.tableView.reloadData()
////              print(dataRes)
//         }
//     }
//    override func viewDidLoad(){
//          super.viewDidLoad()
//        tableView.register(titleListActivityViewCell.self, forCellReuseIdentifier: cellId)
//        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId1)
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 50
//        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
//        if let name2 = defaultValues.string(forKey: "userId") {
//                            user_id = name2
//                  print("user id :: \(user_id)")
//               }else{
//                            //send back to login view controller
//        }
//    }
//
//
//}
