//
//  InputCommentViewController.swift
//  SNP_TW16
//
//  Created by Guide on 8/2/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class InputCommentViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

         let URL_GET_DATA = "\(AppDelegate.link)alder_iosapp/v1/show.php"
         let URL_GET_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/showcomment.php"
         let URL_POST_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/comment.php"
         let URL_COUNT_LIKE = "\(AppDelegate.link)alder_iosapp/v1/countLike.php"
         let URL_CHECK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/checkLike.php"
         let URL_COUNT_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/countComment.php"
         let URL_CLICK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/like_Activity.php"
         let URL_CLICK_UNLIKE = "\(AppDelegate.link)alder_iosapp/v1/deleteLike.php"
         let URL_DELETE_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/deleteComment.php"
         let URL_LIKE_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/likeActivityComment.php"
         let URL_DELETE_LIKE_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/deleteLikeComment.php"
         let URL_CHECK_LIKE_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/checkLikeComment.php"
         let URL_COUNT_LIKE_COMMENT = "\(AppDelegate.link)alder_iosapp/v1/coutLikeComment.php"
    
         lazy var defaultValues = UserDefaults.standard
         lazy var adpostId = Int()
         lazy var adpostId2 = String()
         lazy var adpostId3 = String()
         lazy var postComID = Int()
         private var cellId = "Cell"
         private var cellId1 = "Cell1"
         private var cellId2 = "Cell2"

         var check : allList?
    
         var comment: [CommentList]?
         lazy var userid = String()


        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = true
            self.tableview.reloadData()
        }


        func numberOfSections(in tableView: UITableView) -> Int {
             return 2
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

             if section == 0 {
                return 1
             }else {
                return comment?.count ?? 0
             }
         }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             if indexPath.section == 0 {
                
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DetailActivityViewController
                cell.username.text = check?.username
                cell.date.text = check?.createdAt
                cell.comment.text = check?.caption
                adpostId = check?.id ?? 0
                cell.iconImageLike.titleLabel?.tag = check?.id ?? 0
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
                                                      cell.comCount.text = "\(commentId)"
                                                  }
                                       }
                }


                 Alamofire.request("\(AppDelegate.link)alder_iosapp/" + (check?.photo ?? "0")!).responseImage { response in
                          if let image = response.result.value {
                             cell.profile.image = image
                         }
                 }

                 Alamofire.request("\(AppDelegate.link)alder_iosapp/" + (check?.img ?? "0")!).responseImage { response in
                          if let image = response.result.value {
                             cell.imagePost.image = image
                         }
                 }

                    let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":adpostId]
                    Alamofire.request(URL_CHECK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                            guard let json = response.value as? [String:Bool], let status = json["error"] else {
                            return }
                                if !status {
                                    cell.iconImageLike.backgroundColor = .red
                            }else{
                        }
                    }

                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                   return cell
             }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as!
                 CommentTableView

                 let commentActivity = comment?[indexPath.row]
                
                 cell.date.text = commentActivity?.created
                 cell.comment.text = commentActivity?.post
                 cell.username.text = commentActivity?.userName
                 
//               URL_COUNT_LIKE_COMMENT
                
                let parametersId: Parameters = ["ad_post_timeline_id":adpostId,"commentId":commentActivity?.id ?? 0]
                let urlComment = URL_COUNT_LIKE_COMMENT + "?id=\(adpostId)&commentId=\(commentActivity?.id ?? 0)"
                print(urlComment)
                                   Alamofire.request(urlComment, method: .post,parameters: parametersId).responseJSON { [weak self](resData) in
                                              if let user = resData.result.value as! [String: Any]? {
                                                  if let commentId = user["likeActivity"] as? Int {
                                                        cell.numCount.text = "\(commentId)"
                                                    print()
                                                  }
                                       }
                }
                
                 Alamofire.request("\(AppDelegate.link)alder_iosapp/" + (commentActivity?.imageView ?? "0")!).responseImage { response in
                         if let image = response.result.value{
                                 cell.profile.image = image
                     }
                 }
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                cell.iconImageLike.titleLabel?.tag = commentActivity?.id ?? 0
                postComID = commentActivity?.id ?? 0
                
                
                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":adpostId,"comment_id":commentActivity?.id ?? 0]
                print(parameters)
                          Alamofire.request(URL_CHECK_LIKE_COMMENT, method: .post,parameters: parameters).responseJSON { response in
                                  guard let json = response.value as? [String:Bool], let status = json["error"] else {
                                  return }
                                      if !status {
                                          cell.iconImageLike.backgroundColor = .red
                                  }else{
                              }
                }
                
                return cell
             }
        }
    
    @objc func sendData(_ sender:UIButton){
                       let isCheckValid = commentTextField.text?.count ?? 0 > 0
                       if isCheckValid{
                              let parameters: Parameters = ["ad_post_timeline_id":check?.id ?? 0,"user_id":userid,"post":commentTextField.text!]
                                 let url = URL_POST_COMMENT
                                 Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                                    self.tableview.reloadData()
                                 }
                        

                       }else{
                    
                       }
        
    }
    
    @objc func likePost(_sender:UIButton){
        adpostId2 = "\(_sender.titleLabel?.tag ?? 0)"
        switch _sender.tag{
                case 0:
                    requestData()
                    let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":adpostId2]
                        Alamofire.request(URL_CLICK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                    }
                    _sender.tag = 1
                    _sender.backgroundColor = .red
                    _sender.tintColor = .black
                case 1:
                    requestData()
                    let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":adpostId2]
                        Alamofire.request(URL_CLICK_UNLIKE, method: .post,parameters: parameters).responseJSON { response in
                    }
                    _sender.tag = 0
                    _sender.backgroundColor = .white
                    _sender.tintColor = .black
                default: break
                }
        self.tableview.reloadData()
    }
    
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0{
            let configuration = UISwipeActionsConfiguration()
            return configuration
        }else{
            let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view , completionHandler) in
                let commentActivity = self.comment?[indexPath.row]
                self.postComID = commentActivity?.id ?? 0
                let parameters: Parameters = ["id":self.postComID,"ad_post_timeline_id":self.adpostId,"user_id":self.userid]
                let url = self.URL_DELETE_COMMENT
                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                    self.comment?.remove(at: indexPath.row)
                    self.tableview.reloadData()
                }
                completionHandler(true)
                
            }
            
            let edit = UIContextualAction(style: .normal, title: "Edit") {(action, view , completionHandler) in
                completionHandler(true)
            }
            
            let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
                delete.backgroundColor = UIColor.rgb(red: 255, green: 51, blue: 101)
                delete.image = UIImage(named: "bin")
                edit.backgroundColor = UIColor.emerald
                edit.image = UIImage(named: "edit")
                return configuration
        }
        
    }
    
        @objc func likeComment(_sender:UIButton){
            adpostId3 = "\(_sender.titleLabel?.tag ?? 0)"
            print("Like Comment Sucessue")
            switch _sender.tag{
            case 0:
                requestData()
                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":adpostId,"comment_id":adpostId3]
                    Alamofire.request(URL_LIKE_COMMENT, method: .post,parameters: parameters).responseJSON { response in
                }
                _sender.tag = 1
                _sender.backgroundColor = .red
                _sender.tintColor = .black
            case 1:
                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":adpostId,"comment_id":adpostId3]
                    Alamofire.request(URL_DELETE_LIKE_COMMENT, method: .post,parameters: parameters).responseJSON { response in
                }
                _sender.tag = 0
                _sender.backgroundColor = .white
                _sender.tintColor = .black
            default: break
            }
            self.tableview.reloadData()
        }

        lazy var bgActivitity:UIView = {
                let background = UIView()
                background.backgroundColor = UIColor.rgb(red: 222, green: 222, blue: 222)
                return background
        }()

        lazy var commentTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "แสดงความคิดเห็น", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                   textField.font = UIFont.PoppinsRegular(size:18)
                   textField.textColor = UIColor.blackAlpha(alpha: 0.7)
                   textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
                   textField.layer.borderWidth = 1
                   textField.layer.cornerRadius = 15
                   textField.backgroundColor = .white
                   textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                   textField.leftViewMode = UITextField.ViewMode.always
                   return textField
        }()

        var submitBtn : UIButton = {
                  let submit = UIButton(type: .system)
                  submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
                  submit.layer.borderWidth = 2
                  submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
                  submit.layer.cornerRadius = 15
                  submit.setTitle("ส่ง", for: .normal)
                  submit.setTitleColor(UIColor.white,for: .normal)
                  submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
                  submit.addTarget(self, action: #selector(sendData), for: .touchUpInside)
                  return submit
        }()

        lazy var tableview : UITableView = {
                let tableview = UITableView()
                tableview.delegate = self
                tableview.dataSource = self
                tableview.tableFooterView = UIView()
                tableview.showsVerticalScrollIndicator = false
                tableview.backgroundColor = .none//UIColor(white: 0.95, alpha: 1 )
                return tableview
            }()

        @objc func keyboardWillHide(notification: NSNotification) {
                  if self.view.frame.origin.y != 0 {
                      self.view.frame.origin.y = 0
                  }
              }

        @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                 self.view.frame.origin.y -= keyboardSize.height
                     //keyboardSize.height
                }
            }
        }
    
    lazy var refresher: UIRefreshControl = {
              let refreshControl = UIRefreshControl()
              refreshControl.tintColor = .black
              refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
              return refreshControl
      }()
         
         // action refresh
      @objc func requestData(){
//             print("requestData for tableView")
             let RefreshLine = DispatchTime.now() + .milliseconds(500)
             DispatchQueue.main.asyncAfter(deadline: RefreshLine) {
                 self.refresher.endRefreshing()
             }
      }
    
        override func viewDidLoad(){
            super.viewDidLoad()
            
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

            if #available(iOS 12.1 , *) {
                                        tableview.refreshControl = refresher
                                    }else{
                                        tableview.addSubview(refresher)
            }
                
            let url = URL_GET_COMMENT + "?id=\(check?.id ?? 0)"
                Alamofire.request(url).responseJSON { [weak self](resData) in
                    self?.comment = Mapper<CommentList>().mapArray(JSONObject: resData.result.value)
                    self?.tableview.reloadData()
            }

            let defaultValues = UserDefaults.standard
                        if let name = defaultValues.string(forKey: "userId") {
                            //setting the name to label
                            userid = name
                        }else{
                        //send back to login view controller
            }

            tableview.delegate = self
            view.addSubview(tableview)
            view.addSubview(bgActivitity)
            view.addSubview(commentTextField)
            view.addSubview(submitBtn)

            tableview.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,  right: view.safeAreaLayoutGuide.rightAnchor, bottom: bgActivitity.topAnchor,topConstant: 0,  bottomConstant: 0,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

            tableview.register(DetailActivityViewController.self, forCellReuseIdentifier: cellId)
            tableview.register(CommentTableView.self, forCellReuseIdentifier: cellId1)
            tableview.tableFooterView = UIView()
            tableview.rowHeight = UITableView.automaticDimension
            tableview.estimatedRowHeight = 150

            bgActivitity.anchor(submitBtn.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, topConstant: -10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 70)

            commentTextField.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: submitBtn.leftAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 20, rightConstant: 10, widthConstant: 0, heightConstant: 60)

            submitBtn.anchor(nil, left: nil, right: bgActivitity.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 270, rightConstant: 20, widthConstant: 60, heightConstant: 60)
        }
}
