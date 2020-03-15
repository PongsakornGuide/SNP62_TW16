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
    let URL_GET_POST = "\(AppDelegate.link)alder_iosapp/v1/savePostUser.php"
    let URL_GET_DATA = "\(AppDelegate.link)alder_iosapp/v1/show.php"
    let URL_CLICK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/like_Activity.php"
    let URL_CLICK_UNLIKE = "\(AppDelegate.link)alder_iosapp/v1/deleteLike.php"
    let URL_CHECK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/checkLike.php"
    let URL_COUNT_LIKE = "\(AppDelegate.link)alder_iosapp/v1/countLike.php"
    let URL_COUNT_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/countComment.php"
    let URL_DELETE_POST = "\(AppDelegate.link)alder_iosapp/v1/deletePostUser.php"
    
//    var ActivityList: [ListActivityUser]?
    var ActivityList: [allList]?
    
    lazy var defaultValues = UserDefaults.standard
    lazy var adpostId = Int()
    lazy var adpostId2 = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var user_id = String()
    lazy var postId = Int()
    
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
//                cell.numCount.text = "\(listActivity?.like ?? 0)"
//                cell.numCom.text = "\(listActivity?.comment ?? 0)"
                cell.messageTextLabel.text = listActivity?.caption
                adpostId = listActivity?.id ?? 0
                print(adpostId)
                
                let parametersId: Parameters = ["ad_post_timeline_id":adpostId]
                                let url = URL_COUNT_LIKE + "?id=\(adpostId)"
                                    Alamofire.request(url, method: .post,parameters: parametersId).responseJSON { [weak self](resData) in
                                        if let user = resData.result.value as! [String: Any]? {
                                            if let yield = user["likeActivity"] as? Int {
                                                cell.numCount.text = "\(yield)"
                                            }
                                        }
                }
                
                let urlComment = URL_COUNT_COMMENT + "?id=\(adpostId)"
                                        Alamofire.request(urlComment, method: .post,parameters: parametersId).responseJSON { [weak self](resData) in
                                                   if let user = resData.result.value as! [String: Any]? {
                                                       if let commentId = user["commentActivity"] as? Int {
                                                           cell.numCom.text = "\(commentId)"
                                                       }
                                    }
                }
                
                
                   Alamofire.request("\(AppDelegate.link)alder_iosapp/" + (listActivity?.img ?? "0")!).responseImage { response in
                                         if let image = response.result.value{
                                         cell.postImage.image = image
                             }
                         }
                         
                         Alamofire.request("\(AppDelegate.link)alder_iosapp/" + (listActivity?.photo ?? "0")!).responseImage { response in
                                         if let image2 = response.result.value {
                                         cell.profileImage.image = image2
                             }
                         }
                

                    
                    let parameters: Parameters = ["user_id":user_id,"ad_post_timeline_id":adpostId]
                    Alamofire.request(URL_CHECK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                            guard let json = response.value as? [String:Bool], let status = json["error"] else {
                            return }
                                if !status {
                                    cell.iconImageLike.tag = 1
                                    cell.iconImageLike.tintColor = UIColor.red
                                    cell.iconImageLike.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                                    
                            }else{
                        }
                    }
                cell.iconImageLike.titleLabel?.tag = listActivity?.id ?? 0
                self.tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
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
    
//    let settingLauncher = settingsLauncher()
    
//
//       let blackView = UIView()
//    @objc func morePost(){
//
//        if let window = UIApplication.shared.keyWindow {
//
//            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
//            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handDismiss)))
//                   window.addSubview(blackView)
//                   blackView.frame = view.frame
//            blackView.alpha = 0
//
//            UIView.animate(withDuration: 0.5, animations: {
//                self.blackView.alpha = 1
//            })
//        }
//
//
//    }
//
//    @objc func handDismiss() {
//        UIView.animate(withDuration: 0.5) {
//            self.blackView.alpha = 0
//        }
//    }
    
            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                if  indexPath.section == 0{
                    
                }else {
//                   let vc = InputCommentViewController()
////                   vc.check = ActivityList?[indexPath.row]
//                   self.navigationController?.pushViewController(vc, animated: true)
               }
           }
 
    
    
    
    @objc func likePost(_sender:UIButton){
        adpostId2 = "\(_sender.titleLabel?.tag ?? 0)"
        print(adpostId2)
        switch _sender.tag{
                case 0:
                    requestData()
                    let parameters: Parameters = ["user_id":user_id,"ad_post_timeline_id":adpostId2]
                                    Alamofire.request(URL_CLICK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                    }
                    _sender.tag = 1
                        _sender.tintColor = UIColor.red
                        _sender.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                case 1:
                    requestData()
                    let parameters: Parameters = ["user_id":user_id,"ad_post_timeline_id":adpostId2]
                                                       Alamofire.request(URL_CLICK_UNLIKE, method: .post,parameters: parameters).responseJSON { response in
                    }
                    _sender.tag = 0
                    _sender.tintColor = .black
                    _sender.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
                default: break
                }
         self.tableView.reloadData()
    }
    
    lazy var refresher: UIRefreshControl = {
                 let refreshControl = UIRefreshControl()
                 refreshControl.tintColor = .black
                 refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
                 return refreshControl
         }()
            
            // action refresh
         @objc func requestData(){
                print("requestData for tableView")
                let RefreshLine = DispatchTime.now() + .milliseconds(500)
                DispatchQueue.main.asyncAfter(deadline: RefreshLine) {
                    self.refresher.endRefreshing()
                    self.getData()
                }
         }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") {
            (action, view , completionHandler) in
            print("Delete..")
            

            
            let alert = UIAlertController(title: "ท่านต้องการจะลบกระทู้ของท่านไหม", message: "ยืนยันการลบ",preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertAction.Style.destructive, handler: { _ in
                print("Cancel")
            }))
                      
            alert.addAction(UIAlertAction(title: "ลบกระทู้",style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                let PostUser = self.ActivityList?[indexPath.row]
                self.postId = PostUser?.id ?? 0
                print(self.postId)
                let parameters: Parameters = ["id":self.postId,"user_app_id":self.user_id]
                let url = self.URL_DELETE_POST
                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                    self.ActivityList?.remove(at: indexPath.row)
                    self.tableView.reloadData()
                }
                completionHandler(true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {
                  (action, view , completionHandler) in
                print("Email..")
            
            let alert = UIAlertController(title: "ท่านต้องการจะแก้ไขกระทู้ของท่านไหม", message: "ยืนยันการแก้ไข",preferredStyle: UIAlertController.Style.alert)
                      
            alert.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertAction.Style.destructive, handler: { _ in
                          print("Cancel")
            }))
            alert.addAction(UIAlertAction(title: "แก้ไขกระทู้",style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                
                          let PostUser = self.ActivityList?[indexPath.row]
                          self.postId = PostUser?.id ?? 0
                           print(self.postId)
                           let view = editPostUserViewController()
                           view.post_id = self.postId
                       
                           self.navigationController?.pushViewController(view, animated: true)
                           completionHandler(true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
        
        delete.backgroundColor = UIColor.rgb(red: 255, green: 51, blue: 101)
        delete.image = UIImage(named: "bin")
        
        edit.backgroundColor = UIColor.emerald
        edit.image = UIImage(named: "edit")
        return configuration
    }
        
        @objc func handleBack(){
           print("%%%")
       }
    
        override func viewDidLoad(){
            super.viewDidLoad()
            
            if #available(iOS 12.1 , *) {
                                           tableView.refreshControl = refresher
                                       }else{
                                           tableView.addSubview(refresher)
            }
                   
            
//            let backItem = UIBarButtonItem()
//            backItem.title = " "
//            navigationItem.backBarButtonItem = backItem
//            
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
