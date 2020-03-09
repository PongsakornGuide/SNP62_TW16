//
//  ContentActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class ContentActivityViewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate{
    lazy var defaultValues = UserDefaults.standard
    var activityData: ActivityDetail?
    lazy var typecheck = String()
    lazy var ActivityPostID = Int()
    lazy var IdActivity = Int()
    var delegate:UIViewController?
    let URL_USER_ID = "\(AppDelegate.link)alder_iosapp/v1/join.php"
    let URL_CHECK_JOIN = "\(AppDelegate.link)alder_iosapp/v1/checkjoin.php"
    let URL_CANCEL_ACTIVITY = "\(AppDelegate.link)alder_iosapp/v1/deleteJoinActivity.php"
    
    let URL_CHECK_INVITE = "\(AppDelegate.link)alder_iosapp/v1/inviteActivity.php"
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
             
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
        reloadFun()
        self.tabBarController?.tabBar.isHidden = false
        
    }
    //sss
    //sss
    lazy var viewScroll: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    lazy var stepView: UIImageView = {
        let view = UIImageView()
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
          view.backgroundColor  = UIColor.rgb(red: 237, green: 188, blue: 29)
          view.layer.cornerRadius = 20
          return view
      }()
    
      lazy var textHeader : UILabel = {
           let title = UILabel()
           title.text = "สันทนาการ"
           title.font = UIFont.PoppinsBold(size: 17)
           title.textColor = UIColor.white
           return title
      }()

      lazy var titleLabel : UILabel = {
           let title = UILabel()
           title.text = "แซนวิสเพื่อสุขภาพ"
           title.font = UIFont.PoppinsBold(size: 28)
           title.numberOfLines = 0
           return title
      }()
     
     lazy var nameLabel : UILabel = {
           let title = UILabel()
           title.text = "โดย ไกด์ ฐิติวัฒน์"
           title.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
           title.font = UIFont.PoppinsMedium(size: 16)
           return title
     }()


     lazy var timeLabel : UILabel = {
      let title = UILabel()
      title.text = "วันเริ่มกิจกรรม: 14 สิงหาคม 2562"
      title.textColor = UIColor.black
      title.font = UIFont.PoppinsMedium(size: 18)
      return title
     }()
     
     lazy var contentLabel : UILabel = {
           let title = UILabel()
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 5
           title.text = "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร"
           title.textColor = UIColor.black
           title.font = UIFont.PoppinsMedium(size: 24)
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
             button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
             button.addTarget(self, action: #selector(join_Activity), for: .touchUpInside)
             return button
     }()
    
     var enableButton: UIButton = {
               let button = UIButton()
               button.backgroundColor = UIColor.red
               button.layer.cornerRadius = 20
               button.setTitle("ยกเลิกการเข้าร่วมกิจกรรม", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
               button.isHidden = true
               button.isEnabled = true
               button.addTarget(self, action: #selector(cancel_Activity), for: .touchUpInside)
               return button
      }()
    
     lazy var startDate : UILabel = {
              let title = UILabel()
              title.text = "14 สิงหาคม 2562"
              title.textColor = UIColor.black
              title.font = UIFont.PoppinsMedium(size: 20)
              return title
     }()
    
     lazy var timerAct : UILabel = {
          let title = UILabel()
          title.text = "10:30 - 11:00"
          title.textColor = UIColor.black
          title.font = UIFont.PoppinsMedium(size: 20)
          return title
     }()
    
    lazy var endtimerAct : UILabel = {
         let title = UILabel()
         title.text = "10:30 - 11:00"
         title.textColor = UIColor.black
         title.font = UIFont.PoppinsMedium(size: 20)
         return title
    }()
    
     lazy var joinAct : UILabel = {
          let title = UILabel()
          title.text = "ผู้เข้าร่วม 20 คน"
          title.textColor = UIColor.black
          title.font = UIFont.PoppinsMedium(size: 20)
          return title
     }()
    
    

       @objc func join_Activity(){
            
            let passData = DecideViewController()
            let parameters: Parameters = ["user_id":typecheck,"post_timeline_id":activityData?.dataId ?? 0]
                passData.delegate = self
                Alamofire.request(URL_USER_ID, method: .post,parameters: parameters).responseJSON { response in
                    print(response)
                    passData.actPost = self.ActivityPostID ?? 0
                self.navigationController?.pushViewController(passData, animated: true)
    //            self.present(passData, animated: true, completion: nil)
            }
        }
    
        @objc func cancel_Activity (){
            let alert = UIAlertController(title: "ต้องการยกเลิกกิจกรรมนี้?", message: "แน่ใจใช่ไหมที่ต้องการยกเลิกกิจกรรมนี้",preferredStyle: UIAlertController.Style.alert)

                  alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: { _ in
                      print("Cancel")
                  }))
                  alert.addAction(UIAlertAction(title: "ต้องการยกเลิก",style: UIAlertAction.Style.default,
                  handler: {(_: UIAlertAction!) in

                    let parameters: Parameters = ["user_id":self.typecheck,"post_timeline_id":self.ActivityPostID]
                    Alamofire.request(self.URL_CANCEL_ACTIVITY, method: .post,parameters: parameters).responseJSON { response in
//                                      passData.actPost = self.ActivityPostID ?? 0
//                                  self.navigationController?.pushViewController(passData, animated: true)
                      //            self.present(passData, animated: true, completion: nil)
                        print("55555")
                            self.navigationController?.popViewController(animated: true)
                        
                    }
                    
                  }))
                  self.present(alert, animated: true, completion: nil)
        }
        
        func reloadData(){
                     ActivityPostID = activityData?.dataId ?? 0
                     titleLabel.text = activityData?.actId
                     nameLabel.text = "โดย \(activityData?.caption ?? "ค่าว่าง")"
                     timeLabel.text = "วันเริ่มกิจกรรม: \(activityData?.created ?? "ค่าว่าง")"
                     contentLabel.text = activityData?.content
                     textHeader.text = activityData?.type
                     startDate.text = "\(activityData?.created ?? "ค่าว่าง")"
                     timerAct.text = "\(activityData?.startTime ?? "x") - "
                     endtimerAct.text = activityData?.endtime
                     IdActivity = activityData?.dataId ?? 0
                    
                     Alamofire.request((activityData?.imagePost ?? "0")!).responseImage { response in
                                 if let image = response.result.value {
                                 self.stepView.image = image
                         }
                     }
            
                                let parameters: Parameters = ["id": IdActivity]
                                let url = URL_CHECK_INVITE + "?id=\(IdActivity)"
                                 Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in

                                    if let user = resData.result.value as! [String: Any]? {
                                        if let yield = user["invaite"] as? Int {
                                            self?.joinAct.text = "ผู้เข้าร่วม \(yield ?? 0) / \(self?.activityData?.join ?? 0) คน"
                                        }

                                    }


                                }
            
        }
    
    func reloadFun(){
        let parameters: Parameters = ["user_id":typecheck,"post_timeline_id":activityData?.dataId ?? 0]
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
                reloadData()
                reloadFun()
                 if let name2 = defaultValues.string(forKey: "userId") {
                        typecheck = name2
                    }else{
                 }
                
                 view.backgroundColor = UIColor.white
                 navigationItem.title = "กิจกรรม"
                 view.addSubview(viewScroll)
                 viewScroll.addSubview(stepView)
                 viewScroll.addSubview(BGView)
                 viewScroll.addSubview(header)
                 viewScroll.addSubview(textHeader)
                 viewScroll.addSubview(titleLabel)
                 viewScroll.addSubview(nameLabel)
                 viewScroll.addSubview(timeLabel)
                 viewScroll.addSubview(contentLabel)
                 viewScroll.addSubview(Activityline)
                 viewScroll.addSubview(contentImage)
                
                 viewScroll.addSubview(startDate)
                 viewScroll.addSubview(timerAct)
                 viewScroll.addSubview(endtimerAct)
                 viewScroll.addSubview(joinAct)
                
                 viewScroll.addSubview(userImage)
                 viewScroll.addSubview(timeImage)
                 viewScroll.addSubview(nextButton)
                 viewScroll.addSubview(enableButton)
                
//                 viewScroll.addSubview(CheckPoint)
//
//                CheckPoint.isHidden = true
                
              viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
              
              stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 250)
                 
              BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
              
              header.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 40)
                
                
              textHeader.anchor(header.topAnchor, left: header.leftAnchor, right: header.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)
                               
                
               titleLabel.anchor(header.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
                
               nameLabel.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
              
               timeLabel.anchor(nameLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                
//                CheckPoint.anchor(timeLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                              
                
                contentLabel.anchor(timeLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 180)
                
                Activityline.anchor(contentLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 30 , widthConstant: screenSizeX, heightConstant: 1.5)
                
                
                contentImage.anchor(Activityline.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 50, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 50, heightConstant: 50)

                
                startDate.anchor(Activityline.bottomAnchor, left: contentImage.rightAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 50)

                
                timeImage.anchor(contentImage.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 50, heightConstant: 50)

               
                timerAct.anchor(contentImage.bottomAnchor, left: timeImage.rightAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 50)
                
                endtimerAct.anchor(contentImage.bottomAnchor, left: timerAct.rightAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
                
                userImage.anchor(timeImage.bottomAnchor, left: BGView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 50, heightConstant: 50)

                joinAct.anchor(timeImage.bottomAnchor, left: userImage.rightAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 50)

                
                nextButton.anchor(userImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 50, rightConstant: 50, widthConstant: screenSizeX, heightConstant: 70)
                
                enableButton.anchor(userImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 50, rightConstant: 50, widthConstant: screenSizeX, heightConstant: 70)
                
//                CheckPoint.anchor(timeImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 50, rightConstant: 50, widthConstant: screenSizeX, heightConstant: 70)
                

            }

}
