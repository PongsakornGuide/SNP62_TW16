////
////  InsideViewController.swift
////  SNP_TW16
////
////  Created by Guide on 11/1/2563 BE.
////  Copyright © 2563 guide. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import ObjectMapper
//class InsideViewController: UITableViewController{
//
//    let URL_GET_DATA = "http://localhost/alder_iosapp/v1/show.php"
//    let URL_GET_COMMENT = "http://localhost/alder_iosapp/v1/showcomment.php"
//    let URL_POST_COMMENT = "http://localhost/alder_iosapp/v1/comment.php"
//
////     let URL_GET_DATA = "http://172.20.10.5/alder_iosapp/v1/show.php"
////     let URL_GET_COMMENT = "http://172.20.10.5/alder_iosapp/v1/showcomment.php"
////     let URL_POST_COMMENT = "http://172.20.10.5/alder_iosapp/v1/comment.php"
//
//     let defaultValues = UserDefaults.standard
//     private var cellId = "Cell"
//     private var cellId1 = "Cell1"
//     private var cellId2 = "Cell2"
//     var check : allList?
//     var comment: [CommentList]?
//     var userid = String()
//
//     override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarController?.tabBar.isHidden = true
//        tableView.reloadData()
//
////        self.navigationController?.navigationBar.isHidden = false
//    }
//
////    let bgActivitity:UIView = {
////        let background = UIView()
////        background.backgroundColor = UIColor.rgb(red: 222, green: 222, blue: 222)
////        return background
////    }()
////
////    let commentTextField: UITextField = {
////           let textField = UITextField()
////           textField.attributedPlaceholder = NSAttributedString(string: "แสดงความคิดเห็น", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
////           textField.font = UIFont.PoppinsRegular(size:18)
////           textField.textColor = UIColor.blackAlpha(alpha: 0.7)
////           textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
////           textField.layer.borderWidth = 1
////           textField.layer.cornerRadius = 15
////           textField.backgroundColor = .white
////           textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
////           textField.leftViewMode = UITextField.ViewMode.always
////           return textField
////    }()
////
////    let submitBtn : UIButton = {
////          let submit = UIButton(type: .system)
////          submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
////          submit.layer.borderWidth = 2
////          submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
////          submit.layer.cornerRadius = 15
////          submit.setTitle("ส่ง", for: .normal)
////          submit.setTitleColor(UIColor.white,for: .normal)
////          submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
////          submit.addTarget(self, action: #selector(sendData), for: .touchUpInside)
////          return submit
////    }()
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//         return 2
//     }
//
//     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//         if section == 0 {
//            return 1
//         }else {
//            return comment?.count ?? 0
//         }
//     }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//          let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DetailActivityViewController
//              cell.username.text = check?.username
//              cell.date.text = check?.createdAt
//              cell.comment.text = check?.caption
//              cell.numCount.text = "\(check?.like ?? 0)"
//            Alamofire.request("http://localhost/alder_iosapp/" + (check?.photo ?? "0")!).responseImage { response in
//                     if let image = response.result.value {
//                        cell.profile.image = image
//                    }
//            }
//
//            Alamofire.request("http://localhost/alder_iosapp/" + (check?.img ?? "0")!).responseImage { response in
//                     if let image = response.result.value {
//                        cell.imagePost.image = image
//                    }
//            }
//               self.tableView.separatorStyle = .none
//               cell.selectionStyle = .none
//               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
//              return cell
//          }else{
//           let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as!
//            CommentTableView
//
//            let commentActivity = comment?[indexPath.row]
//            cell.date.text = commentActivity?.created
//            cell.comment.text = commentActivity?.post
//            cell.username.text = commentActivity?.userName
//            cell.numCount.text = "\(commentActivity?.like ?? 0)"
//            Alamofire.request("http://localhost/alder_iosapp/" + (commentActivity?.imageView ?? "0")!).responseImage { response in
//                    if let image = response.result.value{
//                            cell.profile.image = image
//                }
//            }
//                        self.tableView.separatorStyle = .none
//                    cell.selectionStyle = .none
//                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
//                return cell
//        }
//    }
//
////    @objc func sendData (){
////
////        let isCheckValid = commentTextField.text?.count ?? 0 > 0
////
////        if isCheckValid{
////               let parameters: Parameters = ["ad_post_timeline_id":check?.id ?? 0,"user_id":userid,"post":commentTextField.text!]
////                  print(commentTextField.text!)
////                  let url = URL_POST_COMMENT
////                  Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
////                          print(response)
////                       if let nav = self.navigationController {
////                          nav.popToRootViewController(animated: true)
////                              } else {
////                          self.dismiss(animated: true, completion: nil)
////                      }
////                  }
////        }else{
//////              print("5555")
////        }
////    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        navigationController?.navigationBar.isHidden = true
//
//
////        view.addSubview(bgActivitity)
////        view.addSubview(commentTextField)
////        view.addSubview(submitBtn)
//
////        bgActivitity.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 80)
//
//
////        commentTextField.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: submitBtn.leftAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 20, rightConstant: 10, widthConstant: 0, heightConstant: 60)
////
////        submitBtn.anchor(bgActivitity.topAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 270, rightConstant: 20, widthConstant: 60, heightConstant: 60)
//
//        tableView.delegate = self
////        navigationItem.title = "Alder"
//
//        print(check?.id ?? 0)
//        let url = URL_GET_COMMENT + "?id=\(check?.id ?? 0)"
//        Alamofire.request(url).responseJSON { [weak self](resData) in
//            print(resData)
//            self?.comment = Mapper<CommentList>().mapArray(JSONObject: resData.result.value)
//            self?.tableView.reloadData()
//        }
//
//        let defaultValues = UserDefaults.standard
//                if let name = defaultValues.string(forKey: "userId") {
//                    //setting the name to label
//                    userid = name
//                    print(userid)
//                }else{
//                //send back to login view controller
//        }
//
//        tableView.register(DetailActivityViewController.self, forCellReuseIdentifier: cellId)
//        tableView.register(CommentTableView.self, forCellReuseIdentifier: cellId1)
////        tableView.register(SendCommentView.self, forCellReuseIdentifier: cellId2)
//        tableView.tableFooterView = UIView()
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 150
//    }
//
//
//}
