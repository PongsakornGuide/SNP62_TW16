////
////  Testlayout.swift
////  SNP_TW16
////
////  Created by Guide on 12/1/2563 BE.
////  Copyright © 2563 guide. All rights reserved.
////
//
//import UIKit
//import Alamofire
//class Testlayout: UIViewController {
//
//    let screenSizeX: CGFloat = UIScreen.main.bounds.width
//    let screenSizeY: CGFloat = UIScreen.main.bounds.height
//
//       var getname: String = ""
//       var gettime: String = ""
//       var gettitle: String = ""
//       var getimage: String = ""
//       var getProfile: String = ""
//       var getLike: String = ""
//
//     let pageView: UIView = {
//        let view = UIView()
//        return view
//    }()
//
//
//    let profile: UIImageView = {
//        let image = UIImageView()
//         image.image = UIImage(named: "tiko")
//         image.contentMode = .scaleAspectFill
//        return image
//     }()
//
//     let username : UILabel = {
//        let name = UILabel()
//        name.text = "Pongsakorn"
//         name.font = UIFont.PoppinsBold(size: 18)
//        return name
//     }()
//
//     let date : UILabel = {
//           let timer = UILabel()
//           timer.text = "12 ตุลาคม 2562 เวลา 15: 20"
//           timer.font = UIFont.PoppinsMedium(size: 14)
//           timer.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
//           return timer
//     }()
//
//
//    let comment:UILabel = {
//        let comment = UILabel()
//        comment.text = "สวัสดีวันจันทร์แสนสดใส "
//        comment.font = UIFont.PoppinsMedium(size: 18)
//            comment.textColor = UIColor.black
//               return comment
//    }()
//
//
//    let imagePost: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "tenor")
//        image.contentMode = .scaleAspectFill
//        return image
//    }()
//
//    let iconImageLike: UIButton = {
//              let imagelike = UIImage(named: "like") as UIImage?
//              let image = UIButton()
//              image.setImage(imagelike, for: .normal)
//              image.contentMode = .scaleAspectFill
//              image.layer.masksToBounds = true
//              return image
//      }()
//
//      let numCount: UILabel = {
//              let label = UILabel()
//              label.text = "0"
//              label.textColor = UIColor.blackAlpha(alpha: 0.5)
//              label.font = UIFont.PoppinsRegular(size: 18)
//              label.numberOfLines = 0
//              return label
//      }()
//
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        Alamofire.request(getProfile).responseImage { response in
//                    if let image = response.result.value{
//                    self.profile.image = image
//                }
//        }
//
//        Alamofire.request(getimage).responseImage { response in
//                if let image = response.result.value{
//                    self.imagePost.image = image
//                }
//        }
//
//
//
//                      username.text! = getname
//                      comment.text! = gettitle
//                      date.text! = gettime
//                      numCount.text! = getLike
//
//
//        view.addSubview(pageView)
//        view.addSubview(profile)
//        view.addSubview(username)
//        view.addSubview(date)
//        view.addSubview(imagePost)
//        view.addSubview(comment)
//        view.addSubview(iconImageLike)
//        view.addSubview(numCount)
//        view.backgroundColor = .white
//
//                pageView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: screenSizeY - 380)
//
//
//              profile.anchor(pageView.topAnchor, left: pageView.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 40, rightConstant: 80, widthConstant: 60, heightConstant: 80)
//
//              username.anchor(pageView.topAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 0, widthConstant: 0, heightConstant: 20)
//
//              date.anchor(username.bottomAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 0, widthConstant: 0, heightConstant: 20)
//
//
//              comment.anchor(date.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 40)
//
//              imagePost.anchor(comment.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 10, rightConstant: 10, widthConstant: 200, heightConstant: 200)
//
//
//              iconImageLike.anchor(imagePost.bottomAnchor, left: pageView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 30, heightConstant: 30)
//
//              numCount.anchor(imagePost.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 35, bottomConstant: 10, leftConstant: 40, rightConstant: 10, widthConstant: 20, heightConstant: 20)
//
//
//    }
//
//}
