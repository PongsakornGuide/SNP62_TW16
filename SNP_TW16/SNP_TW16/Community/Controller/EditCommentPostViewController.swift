////
////  EditCommentPostViewController.swift
////  SNP_TW16
////
////  Created by Pongsakorn Piya-ampornkul on 22/3/2563 BE.
////  Copyright © 2563 guide. All rights reserved.
////
//
//import UIKit
//import Alamofire
//class EditCommentPostViewController: UIViewController {
//    lazy var comment_Id = Int()
//    lazy var user_Id = String()
////   ?id=21&user_id=1
//    let URL_SHOW_POST = "\(AppDelegate.link)alder_iosapp/v1/showCommentPostUser.php"
//    func reloadData(){
//            let parameters: Parameters = ["id":comment_Id,"user_id":user_Id]
//                     let url = URL_SHOW_POST + "?id=\(comment_Id)&user_id=\(user_Id)"
//            print(url)
////            http://localhost/alder_iosapp/v1/showCommentPostUser.php?id=21&user_id=1
//                     Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
//                               print(resData)
//                   }
//           }
//       
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//        print(comment_Id)
//        print(user_Id)
//        reloadData()
//    }
//}
