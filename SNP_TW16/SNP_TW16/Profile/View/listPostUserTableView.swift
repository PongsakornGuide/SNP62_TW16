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
import SDWebImage
import PopupDialog
class listPostUserTableView: UITableViewController {
    
    let URL_GET_POST = "\(AppDelegate.link)alder_iosapp/v1/savePostUser.php"
//    let URL_GET_DATA = "\(AppDelegate.link)alder_iosapp/v1/show.php"
    let URL_CLICK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/like_Activity.php"
    let URL_CLICK_UNLIKE = "\(AppDelegate.link)alder_iosapp/v1/deleteLike.php"
    let URL_CHECK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/checkLike.php"
    let URL_COUNT_LIKE = "\(AppDelegate.link)alder_iosapp/v1/countLike.php"
    let URL_COUNT_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/countComment.php"
    let URL_DELETE_POST = "\(AppDelegate.link)alder_iosapp/v1/deletePostUser.php"
    
//    var ActivityList: [ListActivityUser]?
//    var ActivityList: [allList]?
    var activityList: [allList]?
    
    lazy var defaultValues = UserDefaults.standard
    lazy var adpostId = Int()
    lazy var adpostId2 = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var user_id = String()
//    var postId:[Int] = []
//   var postId = String()
     var postId = Int()
    var postId1 = Int()
//    var postId = [Int]()
    var postIdtitle = Int()
    
    
    
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
                return activityList?.count ?? 0
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
                
                cell.iconOther.isHidden = false
                let listActivity = activityList?[indexPath.row]
                cell.userFullname.text = listActivity?.username
                
                cell.iconOther.tag = listActivity?.id ?? 0
//                postId = cell.iconOther.tag
                
                let mouthStart = DateFormatter()
                mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = mouthStart.date(from: listActivity?.createdAt ?? "x")
                mouthStart.dateFormat = "MMM d, h:mm a"
                let mouthStringStart = mouthStart.string(from: date ?? Date())
                cell.timeTextLabel.text = mouthStringStart
                cell.messageTextLabel.text = listActivity?.caption
                cell.numCount.text = "\(listActivity?.likeActivity ?? 0)  ถูกใจ"
                cell.numCom.text = "\(listActivity?.commentsActivity ?? 0)  คอมเม้นต์"
                
                cell.iconOther.titleLabel?.tag = indexPath.row
//                postId = listActivity?.id ?? 0
                
                
                adpostId = listActivity?.id ?? 0
                let postImagePath = ("\(AppDelegate.link)alder_iosapp/" + (listActivity?.img ?? "0")!)
                            if let postImageURL = URL(string: postImagePath) {
                                cell.postImage.sd_setImage(with: postImageURL, completed: nil)
                }
                            
                let profileImagePath = ("\(AppDelegate.link)alder_iosapp/" + (listActivity?.photo ?? "0")!)
                            if let postImageURL = URL(string: profileImagePath) {
                                cell.profileImage.sd_setImage(with: postImageURL, completed: nil)
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
                if cell.iconImageLike.tag == 0{
                               
                           }else{
                               cell.iconImageLike.tintColor = .black
                               cell.iconImageLike.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
                }
                
                cell.iconImageLike.titleLabel?.tag = listActivity?.id ?? 0
                self.tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }
               
        }
    
    @objc func moreOther(_sender:UIButton){
        postIdtitle = _sender.tag
        postId = _sender.titleLabel?.tag ?? 0

//           Prepare the popup assets
                    let title = "THIS IS THE DIALOG TITLE"
//                label.font = UIFont.BaiJamjureeRegular(size: 14)

                    let message = "This is the message section of the popup dialog default view"
                    let image = UIImage(named: "pexels-photo-103290")

                    // Create the dialog
                    let popup = PopupDialog(title: title, message: message, image: image)

                    // Create buttons
                    let buttonOne = CancelButton(title: "ยกเลิก") {
                        print("You canceled the car dialog.")
                    }

                    // This button will not the dismiss the dialog
                    let buttonTwo = DefaultButton(title: "แก้ไขข้อมูล") {
                        print("What a beauty!")
                        let view = editPostUserViewController()
                        view.post_id = self.postIdtitle
                        self.navigationController?.pushViewController(view, animated: true)
                    }

                    let buttonThree = DefaultButton(title: "ลบข้อมูล", height: 60) {
                        _ = self.activityList?[self.postId]
                      let parameters: Parameters = ["id":self.postIdtitle,"user_app_id":self.user_id]
                            let url = self.URL_DELETE_POST
                            Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                            self.activityList?.remove(at: self.postId)
                            self.tableView.reloadData()
                      }
                    }

                    popup.addButtons([buttonTwo, buttonThree, buttonOne])


                    self.present(popup, animated: true, completion: nil)
////
    }
    
    func getData(){
             let parameters: Parameters = ["userId":user_id]
             let url = URL_GET_POST + "?id=\(user_id)"
             Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                self?.activityList = Mapper<allList>().mapArray(JSONObject: dataRes.result.value)
                self?.tableView.reloadData()
             }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  indexPath.section == 0{
                    
        }else {
            let vc = InputCommentViewController()
            vc.check = activityList?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            
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
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = UIContextualAction(style: .normal, title: "Delete") {
//            (action, view , completionHandler) in
//            print("Delete..")
//
//             Prepare the popup assets
//            let title = "THIS IS THE DIALOG TITLE"
//            let message = "This is the message section of the popup dialog default view"
//            let image = UIImage(named: "pexels-photo-103290")
//
//            // Create the dialog
//            let popup = PopupDialog(title: title, message: message, image: image)
//
//            // Create buttons
//            let buttonOne = CancelButton(title: "CANCEL") {
//                print("You canceled the car dialog.")
//            }
//
//            // This button will not the dismiss the dialog
//            let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {
//                print("What a beauty!")
//            }
//
//            let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
//                print("Ah, maybe next time :)")
//            }
//
//            popup.addButtons([buttonOne, buttonTwo, buttonThree])
//
//            self.present(popup, animated: true, completion: nil)
//
//
//            let alert = UIAlertController(title: "ท่านต้องการจะลบกระทู้ของท่านไหม", message: "ยืนยันการลบ",preferredStyle: UIAlertController.Style.alert)
//
//            alert.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertAction.Style.destructive, handler: { _ in
//                print("Cancel")
//            }))
//
//            alert.addAction(UIAlertAction(title: "ลบกระทู้",style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
//                let PostUser = self.ActivityList?[indexPath.row]
//                self.postId = PostUser?.id ?? 0
//                print(self.postId)
//                let parameters: Parameters = ["id":self.postId,"user_app_id":self.user_id]
//                let url = self.URL_DELETE_POST
//                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
//                    self.ActivityList?.remove(at: indexPath.row)
//                    self.tableView.reloadData()
//                }
//                completionHandler(true)
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//
//            let edit = UIContextualAction(style: .normal, title: "Edit") {
//                  (action, view , completionHandler) in
//                print("Email..")
//
//            let alert = UIAlertController(title: "ท่านต้องการจะแก้ไขกระทู้ของท่านไหม", message: "ยืนยันการแก้ไข",preferredStyle: UIAlertController.Style.alert)
//
//            alert.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertAction.Style.destructive, handler: { _ in
//                          print("Cancel")
//            }))
//
//            alert.addAction(UIAlertAction(title: "แก้ไขกระทู้",style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
//
//                          let PostUser = self.ActivityList?[indexPath.row]
//                          self.postId = PostUser?.id ?? 0
//                           print(self.postId)
//                           let view = editPostUserViewController()
//                           view.post_id = self.postId
//
//                           self.navigationController?.pushViewController(view, animated: true)
//                           completionHandler(true)
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//
//        let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
//
//        delete.backgroundColor = UIColor.rgb(red: 255, green: 51, blue: 101)
//        delete.image = UIImage(named: "bin")
//
//        edit.backgroundColor = UIColor.emerald
//        edit.image = UIImage(named: "edit")
//        return configuration
//    }
//
    
        
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
                   
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            tableView.register(titleListPostViewCell.self, forCellReuseIdentifier: cellId)
            tableView.register(AcivityListTableViewCell.self, forCellReuseIdentifier: cellId1)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 50
            
            if let userId = defaultValues.string(forKey: "userId") {
               user_id = userId
            }else{
               //send back to login view controller
            }
        }
}

