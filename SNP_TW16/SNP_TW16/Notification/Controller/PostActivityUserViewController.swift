//
//  PostActivityUserViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 9/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SDWebImage
import PopupDialog
class PostActivityUserViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

         let URL_GET_DATA = "\(AppDelegate.link)alder_iosapp/v1/showNotificationPostUser.php"
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
         let URL_INSERT_NOTIFICATION_POST = "\(AppDelegate.link)alder_iosapp/v1/insertPostUser.php"
//
         lazy var idPost = Int()
         lazy var idPostUser = Int()
         var activityList: [allList]?
//         var check : allList?
//         lazy var defaultValues = UserDefaults.standard
//         lazy var adpostId = Int()
//         lazy var adpostId2 = String()
         lazy var adpostId3 = String()
         lazy var idCommentlist = Int()
//         lazy var postComID = Int()
//
         lazy var idComment = Int()
         lazy var indexPathComment = Int()
         private var cellId = "Cell"
         private var cellId1 = "Cell1"
         private var cellId2 = "Cell2"
//         var postIdtitle = Int()
//         var check : allList?
//
//
        var comment: [CommentList]?
        lazy var userid = String()
//        lazy var TestComment = Int()

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = true
            self.getcomment()
            self.getpost()
            self.tableview.reloadData()
        }


        func numberOfSections(in tableView: UITableView) -> Int {
             return 2
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             if section == 0 {
                return activityList?.count ?? 0
             }else {
                return comment?.count ?? 0
             }
         }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             if indexPath.section == 0 {

               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DetailActivityViewController
                
                let headerActivity = activityList?[indexPath.row]
                
                
                cell.username.text = headerActivity?.username
                cell.comment.text = headerActivity?.caption
                let mouthStart = DateFormatter()
                mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = mouthStart.date(from: headerActivity?.createdAt ?? "x")
                mouthStart.dateFormat = "MMM d, h:mm a"
                let mouthStringStart = mouthStart.string(from: date ?? Date())
                cell.date.text = mouthStringStart
                

//                cell.iconImageLike.titleLabel?.tag = check?.id ?? 0
                let postImagePath = "\(AppDelegate.link)alder_iosapp/" + (headerActivity?.img ?? "0")
                let profileImagePath = "\(AppDelegate.link)alder_iosapp/" + (headerActivity?.photo ?? "0")
//
                if let postImageURL = URL(string: postImagePath) {
                    cell.imagePost.sd_setImage(with: postImageURL, completed: nil)
                }

                if let profileImageURL = URL(string: profileImagePath){
                    cell.profile.sd_setImage(with: profileImageURL, completed: nil)
                }
                
                cell.numCount.text = "\(headerActivity?.likeActivity ?? 0)"
                cell.comCount.text = "\(headerActivity?.commentsActivity ?? 0)"

                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":idPost]
//                                print(parameters)
                            Alamofire.request(URL_CHECK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                                guard let json = response.value as? [String:Bool], let status = json["error"] else {
                                return }
                                    if !status {
                                       cell.iconImageLike.tag = 1
                                        cell.iconImageLike.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                                       cell.iconImageLike.tintColor = UIColor.red

                                }else{

                            }
                 }


                   let parametersId: Parameters = ["ad_post_timeline_id":idPost]
                                        let urlComment = URL_COUNT_LIKE + "?id=\(idPost)"
                              Alamofire.request(urlComment, method: .post,parameters: parametersId).responseJSON { [weak self](resData) in
                                      if let user = resData.result.value as! [String: Any]? {
                                              if let commentId = user["likeActivity"] as? Int {
                                                  cell.numCount.text = "\(commentId)"
                                      }

                              }

                    }
                
                   let parametersCom: Parameters = ["ad_post_timeline_id":idPost]
                       let urlCommentCh = URL_COUNT_COMMENT + "?id=\(idPost)"
                                Alamofire.request(urlCommentCh, method: .post,parameters: parametersCom).responseJSON { [weak self](resData) in
                                        if let user = resData.result.value as! [String: Any]? {
                                            if let commentId = user["commentActivity"] as? Int {
                                              cell.comCount.text = "\(commentId)"
                                }
                        }
                    }
                
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                   return cell
             }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as!
                 CommentTableView
                
                let commentActivity = comment?[indexPath.row]

                let mouthStart = DateFormatter()
                mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = mouthStart.date(from: commentActivity?.created ?? "x")
                mouthStart.dateFormat = "MMM d, h:mm a"
                let mouthStringStart = mouthStart.string(from: date ?? Date())
                cell.date.text = "\(mouthStringStart)"

                cell.comment.text = commentActivity?.post
                cell.username.text = commentActivity?.userName

                cell.iconOther.tag = commentActivity?.id ?? 0

                cell.iconOther.titleLabel?.tag = indexPath.row

                idCommentlist = commentActivity?.userId ?? 0

                
                
                if userid == "\(idCommentlist)"{
                        cell.iconOther.isHidden = false
                }else{
                        cell.iconOther.isHidden = true
                }
                
                let postImagePath = "\(AppDelegate.link)alder_iosapp/" + (commentActivity?.imageView ?? "0")
                        if let postImageURL = URL(string: postImagePath) {
                            cell.profile.sd_setImage(with: postImageURL, completed: nil)
                }

                let parametersId: Parameters = ["ad_post_timeline_id":idPost,"commentId":commentActivity?.id ?? 0]
                                  let urlComment = URL_COUNT_LIKE_COMMENT + "?id=\(idPost)&commentId=\(commentActivity?.id ?? 0)"
                        Alamofire.request(urlComment, method: .post,parameters: parametersId).responseJSON { [weak self](resData) in
                                if let user = resData.result.value as! [String: Any]? {
                                        if let commentId = user["likeActivity"] as? Int {
                                            cell.numCount.text = "\(commentId)"
                                        }

                        }

                }

                if userid == "\(idCommentlist)"{
                    cell.iconOther.isHidden = false
                    }else{
                    cell.iconOther.isHidden = true
                }


                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":idPost,"comment_id":commentActivity?.id ?? 0]
                print(parameters)
                          Alamofire.request(URL_CHECK_LIKE_COMMENT, method: .post,parameters: parameters).responseJSON { response in
                                  guard let json = response.value as? [String:Bool], let status = json["error"] else {
                                  return }
                                      if !status {
                                            cell.iconImageLike.tag = 1
                                            cell.iconImageLike.tintColor = UIColor.red
                                            cell.iconImageLike.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                                  }else{

                    }
                }

                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                cell.iconImageLike.titleLabel?.tag = commentActivity?.id ?? 0
//                postComID = commentActivity?.id ?? 0

                return cell
             }
        }
    
    @objc func likePost(_sender:UIButton){
         switch _sender.tag{
                 case 0:
                     requestData()
                     let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":idPost]
                     print(parameters)
                                     Alamofire.request(URL_CLICK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                     }
                     _sender.tag = 1
                     _sender.tintColor = UIColor.red
                     _sender.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                     self.tableview.reloadData()
                 case 1:
                     requestData()
                     let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":idPost]
                     print(parameters)
                                     Alamofire.request(URL_CLICK_UNLIKE, method: .post,parameters: parameters).responseJSON { response in
                     }
                     _sender.tag = 0
                     _sender.tintColor = .black
                     _sender.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
                     self.tableview.reloadData()
                 default: break
                 }
          
     }
    

        @objc func actionOther(_sender:UIButton){
                 idComment = _sender.tag
                 indexPathComment = _sender.titleLabel?.tag ?? 0

                 //Prepare the popup assets
                 let title = "THIS IS THE DIALOG TITLE"
                 //label.font = UIFont.BaiJamjureeRegular(size: 14)

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

                 }

                 let buttonThree = DestructiveButton(title: "ลบข้อมูล") {

                    let parameters: Parameters = ["id":self.idComment,"ad_post_timeline_id":self.idPost,"user_id":self.userid]
                    let url = self.URL_DELETE_COMMENT
                            Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                                self.comment?.remove(at: self.indexPathComment)
                                        self.tableview.reloadData()
                    }

                 }
                 popup.addButtons([buttonThree,buttonTwo,buttonOne])

                 self.present(popup, animated: true, completion: nil)
        }

        @objc func sendData(_ sender:UIButton){
                       let isCheckValid = commentTextField.text?.count ?? 0 > 0
                       if isCheckValid{
                              let parameters: Parameters = ["ad_post_timeline_id":idPost,"user_id":userid,"post":commentTextField.text!]
                        print(parameters)
                                 let url = URL_POST_COMMENT
                                 Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                                    self.getcomment()
                                    print(response)
                                 }
                            commentTextField.text = ""

                        let urlPost = URL_INSERT_NOTIFICATION_POST + "?id=\(userid)"

                        let insertNotificaiton: Parameters = ["ad_post_timeline_id":idPost,"user_id":idPostUser,"other_id":userid]

                            print(insertNotificaiton)
                            Alamofire.request(urlPost, method: .post,parameters: insertNotificaiton).responseJSON { response in
                                         print(response)
                        }

                       }else{

        }

    }

 
        @objc func likeComment(_sender:UIButton){
            adpostId3 = "\(_sender.titleLabel?.tag ?? 0)"
            print("Like Comment Sucessue")
            switch _sender.tag{
            case 0:
                requestData()
                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":idPost,"comment_id":adpostId3]
                    Alamofire.request(URL_LIKE_COMMENT, method: .post,parameters: parameters).responseJSON { response in
                }
                _sender.tag = 1
                _sender.tintColor = UIColor.red
                _sender.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)

            case 1:
                let parameters: Parameters = ["user_id":userid,"ad_post_timeline_id":idPost,"comment_id":adpostId3]
                    Alamofire.request(URL_DELETE_LIKE_COMMENT, method: .post,parameters: parameters).responseJSON { response in
                }
                _sender.tag = 0
                _sender.tintColor = .black
                _sender.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)

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
                   textField.font = UIFont.BaiJamjureeRegular(size:18)
                   textField.textColor = UIColor.blackAlpha(alpha: 0.7)
                   textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
                   textField.layer.borderWidth = 1
                   textField.layer.cornerRadius = 15
                   textField.backgroundColor = .white
                   textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                   textField.leftViewMode = UITextField.ViewMode.always
                    textField.placeholder = "แสดงความคิดเห็น"
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
                  submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
            submit.addTarget(self, action: #selector(PostActivityUserViewController.sendData), for: .touchUpInside)
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
    
        // refresh
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
                 }
          }
    

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


        func getpost(){
                let url = URL_GET_DATA + "?id=\(idPost)"
                print(url)
                    Alamofire.request(url).responseJSON { [weak self](resData) in
                        self?.activityList = Mapper<allList>().mapArray(JSONObject: resData.result.value)
                        self?.tableview.reloadData()
                        print(resData)
                }
        }
    
        func getcomment(){
                let url = URL_GET_COMMENT + "?id=\(idPost)"
                print(url)
                    Alamofire.request(url).responseJSON { [weak self](resData) in
                        self?.comment = Mapper<CommentList>().mapArray(JSONObject: resData.result.value)
                        self?.tableview.reloadData()
                }
        }
    
    
    

        override func viewDidLoad(){
            super.viewDidLoad()
            print(idPost)
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)

            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

            if #available(iOS 12.1 , *) {
                  tableview.refreshControl = refresher
            }else{
                  tableview.addSubview(refresher)
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

            navigationItem.title = "โพสต์"

            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
            navigationController?.navigationBar.titleTextAttributes = textAttributes

            
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
