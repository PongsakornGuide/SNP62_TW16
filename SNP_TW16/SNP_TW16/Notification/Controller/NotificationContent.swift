//
//  NotificationContent.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 13/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class NotificationContent: UIViewController {
    lazy var ActivityPostID = Int()
    lazy var defaultValues = UserDefaults.standard
    let URL_CANCEL_ACTIVITY = "\(AppDelegate.link)alder_iosapp/v1/deleteJoinActivity.php"
    let URL_USER_ID = "\(AppDelegate.link)alder_iosapp/v1/join.php"
    let URL_CHECK_JOIN = "\(AppDelegate.link)alder_iosapp/v1/checkjoin.php"
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    lazy var userId = String()
    lazy var postId = Int()
    
    override func viewWillAppear(_ animated: Bool) {
        reloadCheckJoin()
    }

    lazy var viewScroll: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    lazy var startDateAct : UILabel = {
               let title = UILabel()
               title.text = "14 สิงหาคม 256asdas2"
               title.textColor = UIColor.black
               title.font = UIFont.BaiJamjureeMedium(size: 20)
               return title
      }()
    
    lazy var startDateAct1 : UILabel = {
                  let title = UILabel()
                  title.text = "14 สิงหาคม 256asdas2"
                  title.textColor = UIColor.black
                  title.font = UIFont.BaiJamjureeMedium(size: 20)
                  return title
         }()
    
    lazy var startDateAct2 : UILabel = {
                let title = UILabel()
                title.text = "2551"
    //            title.isHidden = true
                title.textColor = UIColor.black
                title.font = UIFont.BaiJamjureeMedium(size: 20)
                return title
    }()
    
    lazy var stepView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "val-vesa-P0F_zH39qhs-unsplash")
        return view
    }()
    
      lazy var BGView: UIView = {
          let view = UIView()
          view.backgroundColor = .white
          view.layer.cornerRadius = 20
          return view
      }()

      lazy var header : UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
            view.layer.cornerRadius = 10
            return view
      }()
    
      lazy var textHeader : UILabel = {
           let title = UILabel()
           title.text = "สันทนาการ"
           title.font = UIFont.BaiJamjureeBold(size: 17)
           title.textColor = UIColor.white
           return title
      }()

      lazy var titleLabel : UILabel = {
           let title = UILabel()
           title.text = "แซนวิสเพื่อสุขภาพ"
           title.font = UIFont.BaiJamjureeBold(size: 28)
           title.numberOfLines = 0
           return title
      }()
     
     lazy var nameLabel : UILabel = {
           let title = UILabel()
           title.text = "โดย ไกด์ ฐิติวัฒน์"
           title.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
           title.font = UIFont.BaiJamjureeMedium(size: 16)
           return title
     }()


     lazy var timeLabel : UILabel = {
      let title = UILabel()
      title.text = "วันเริ่มกิจกรรม: 14 สิงหาคม 2562"
      title.textColor = UIColor.black
      title.font = UIFont.BaiJamjureeMedium(size: 18)
      return title
     }()
     
    lazy var timeLabel1 : UILabel = {
           let title = UILabel()
           title.text = "มกราคม"
           title.textColor = UIColor.black
           title.font = UIFont.BaiJamjureeMedium(size: 18)
           return title
    }()
    
     lazy var timeLabel2 : UILabel = {
               let title = UILabel()
               title.text = "2562"
    //           title.isHidden = true
               title.textColor = UIColor.black
               title.font = UIFont.BaiJamjureeMedium(size: 18)
               return title
    }()
    
    
     lazy var contentLabel : UILabel = {
           let title = UILabel()
           title.lineBreakMode = .byWordWrapping
           title.numberOfLines = 0
           title.text = "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร"
           title.textColor = UIColor.black
           title.font = UIFont.BaiJamjureeMedium(size: 24)
           return title
     }()

    lazy var Activityline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
        return view
    }()
       
    
    lazy var contentImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "calendar")
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var timeImage: UIImageView = {
           let view = UIImageView()
           view.image = UIImage(named: "Group 1443")
           view.contentMode = .scaleAspectFit
           return view
    }()
    
    lazy var userImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "Group 1444")
            view.contentMode = .scaleAspectFit
            return view
     }()

      
    var nextButton: UIButton = {
             let button = UIButton(type: .system)
             button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
             button.layer.cornerRadius = 20
             button.setTitle("เข้าร่วมกิจกรรม", for: .normal)
             button.setTitleColor(.white, for: .normal)
             button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
//        button.isHidden = true
             button.addTarget(self, action: #selector(join_Activity), for: .touchUpInside)
             return button
     }()
    
    @objc func actionJoin(){
        let passData = DecideViewController()
        let parameters: Parameters = ["user_id":userId,"post_timeline_id":postId]
        passData.delegate = self
        Alamofire.request(URL_USER_ID, method: .post,parameters: parameters).responseJSON { response in
        passData.actPost = self.postId ?? 0
        passData.actData = self.titleLabel.text ?? ""
        self.navigationController?.pushViewController(passData, animated: true)
        }
    }
    
    @objc func join_Activity(){
          let popOverVC = AlertJoinActivityFromNotification()
          self.addChild(popOverVC)
          popOverVC.titleHeader1.text = "กิจกรรม : \(titleLabel.text ?? "x")"
          popOverVC.titleHeader1.font  = UIFont.BaiJamjureeBold(size: 20)
          popOverVC.titleHeader1.textAlignment  = .center
          popOverVC.view.frame = self.view.frame
          self.view.addSubview(popOverVC.view)
          popOverVC.didMove(toParent: self)
      }
    

    
    
    
     var enableButton: UIButton = {
               let button = UIButton()
               button.backgroundColor = UIColor.red
               button.layer.cornerRadius = 20
               button.setTitle("ยกเลิกการเข้าร่วมกิจกรรม", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
               button.isHidden = true
               button.isEnabled = true
               button.addTarget(self, action: #selector(cancel_Activity), for: .touchUpInside)
               return button
      }()
    

    
     @objc func cancel_Activity (){
        let popOverVC = AlertCancelJoinActivityFromNotification()
            self.addChild(popOverVC)
            popOverVC.titleHeader1.text = "กิจกรรม : \(titleLabel.text ?? "x")"
            popOverVC.titleHeader1.font  = UIFont.BaiJamjureeBold(size: 20)
            popOverVC.titleHeader1.textAlignment  = .center
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
//
//                let alert = UIAlertController(title: "ต้องการยกเลิกกิจกรรมนี้?", message: "แน่ใจใช่ไหมที่ต้องการยกเลิกกิจกรรมนี้",preferredStyle: UIAlertController.Style.alert)
//
//                      alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: { _ in
//                          print("Cancel")
//                      }))
//                      alert.addAction(UIAlertAction(title: "ต้องการยกเลิก",style: UIAlertAction.Style.default,
//                      handler: {(_: UIAlertAction!) in
//
//                        let parameters: Parameters = ["user_id":self.userId,"post_timeline_id":self.postId]
//                        print(parameters)
//                        Alamofire.request(self.URL_CANCEL_ACTIVITY, method: .post,parameters: parameters).responseJSON { response in
//    //                                      passData.actPost = self.ActivityPostID ?? 0
//    //                                  self.navigationController?.pushViewController(passData, animated: true)
//                          //            self.present(passData, animated: true, completion: nil)
//                            print("55555")
//                                self.navigationController?.popViewController(animated: true)
//
//                        }
//
//                      }))
//                      self.present(alert, animated: true, completion: nil)
    }
    
    @objc func cancelJoin(){
        let parameters: Parameters = ["user_id":self.userId,"post_timeline_id":self.postId]
        print(parameters)
        Alamofire.request(self.URL_CANCEL_ACTIVITY, method: .post,parameters: parameters).responseJSON { response in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
//     lazy var startDate : UILabel = {
//              let title = UILabel()
//              title.text = "14 สิงหาคม 2562"
//              title.textColor = UIColor.black
//              title.font = UIFont.BaiJamjureeBold(size: 20)
//              return title
//     }()
    
     lazy var timerAct : UILabel = {
          let title = UILabel()
          title.text = "10:30 - 11:00"
          title.textColor = UIColor.black
          title.font = UIFont.BaiJamjureeMedium(size: 20)
          return title
     }()
    
    lazy var endtimerAct : UILabel = {
         let title = UILabel()
         title.text = "10:30 - 11:00"
         title.textColor = UIColor.black
         title.font = UIFont.BaiJamjureeMedium(size: 20)
         return title
    }()
    
     lazy var joinAct : UILabel = {
          let title = UILabel()
          title.text = "ผู้เข้าร่วม 20 คน"
          title.textColor = UIColor.black
          title.font = UIFont.BaiJamjureeMedium(size: 20)
          return title
     }()
    
    func reloadCheckJoin(){
        let parameters: Parameters = ["user_id":userId,"post_timeline_id":postId]
        print(parameters)
                           Alamofire.request(URL_CHECK_JOIN, method: .post,parameters: parameters).responseJSON { response in
                                   print(response)
                               guard let json = response.value as? [String:Bool], let status = json["error"] else { return }
                               if !status {
                                   self.enableButton.isHidden = false
                                   self.nextButton.isHidden = true
                               }else{
                                   self.nextButton.backgroundColor = .blue
                               }
                       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "\(textHeader.text ?? "x")"
        
        if let name2 = defaultValues.string(forKey: "userId") {
                userId = name2
            }else{
        }
        view.addSubview(viewScroll)
        viewScroll.addSubview(stepView)
        viewScroll.addSubview(BGView)
        viewScroll.addSubview(header)
        viewScroll.addSubview(textHeader)
        viewScroll.addSubview(titleLabel)
        viewScroll.addSubview(nameLabel)
        viewScroll.addSubview(timeLabel)
        viewScroll.addSubview(timeLabel1)
        viewScroll.addSubview(timeLabel2)
        viewScroll.addSubview(contentLabel)
         viewScroll.addSubview(startDateAct)
        viewScroll.addSubview(startDateAct1)
        viewScroll.addSubview(startDateAct2)
        viewScroll.addSubview(Activityline)
        viewScroll.addSubview(contentImage)
        viewScroll.addSubview(timerAct)
        viewScroll.addSubview(endtimerAct)
        viewScroll.addSubview(joinAct)
        viewScroll.addSubview(userImage)
        viewScroll.addSubview(timeImage)
        viewScroll.addSubview(nextButton)
        viewScroll.addSubview(enableButton)
                    
         
                       viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                     
                     stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 250)
                        
                     BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: 0)
                     
                     header.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 40)


                     textHeader.anchor(header.topAnchor, left: header.leftAnchor, right: header.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)


                      titleLabel.anchor(header.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 0)
                       
                      titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 160).isActive = true

                      nameLabel.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)


                    timeLabel.anchor(nameLabel.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                      
                      timeLabel1.anchor(nameLabel.bottomAnchor, left: timeLabel.rightAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 5, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                      
                      timeLabel2.anchor(nameLabel.bottomAnchor, left: timeLabel1.rightAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 5, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
        
                       contentLabel.anchor(timeLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)
                       
                       contentLabel.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true

                       Activityline.anchor(contentLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 30 , widthConstant: screenSizeX, heightConstant: 1.5)


                       contentImage.anchor(Activityline.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 50, heightConstant: 50)


                       timeImage.anchor(contentImage.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 50, heightConstant: 50)

                        startDateAct.anchor(Activityline.bottomAnchor, left: contentImage.rightAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 50)
                       
                       startDateAct1.anchor(Activityline.bottomAnchor, left: startDateAct.rightAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 50)

                       startDateAct2.anchor(Activityline.bottomAnchor, left: startDateAct1.rightAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 50)


                       timerAct.anchor(contentImage.bottomAnchor, left: timeImage.rightAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 50)

                       endtimerAct.anchor(contentImage.bottomAnchor, left: timerAct.rightAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)

                       userImage.anchor(timeImage.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 50, heightConstant: 50)

                       joinAct.anchor(timeImage.bottomAnchor, left: userImage.rightAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 50)

                       nextButton.anchor(userImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 70)

                       enableButton.anchor(userImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 70)
    }
}
