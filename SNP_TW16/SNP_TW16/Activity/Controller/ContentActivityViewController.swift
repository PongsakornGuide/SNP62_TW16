//
//  ContentActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class ContentActivityViewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate{
    let defaultValues = UserDefaults.standard
    var activityData: ActivityDetail?
    var typecheck = String()
    var ActivityPostID = Int()
    
    
    
    let URL_USER_ID = "http://localhost/alder_iosapp/v1/join.php"
    let URL_CHECK_JOIN = "http://localhost/alder_iosapp/v1/checkjoin.php"
////    
//    let URL_USER_ID = "http://172.20.10.5/alder_iosapp/v1/join.php"
//    let URL_CHECK_JOIN = "http://172.20.10.5/alder_iosapp/v1/checkjoin.php"
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
             
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    var viewScroll: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let stepView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
      let BGView: UIView = {
          let view = UIView()
          view.backgroundColor = .white
          view.layer.cornerRadius = 20
          return view
      }()

      let header : UIView = {
          let view = UIView()
          view.backgroundColor  = UIColor.rgb(red: 237, green: 188, blue: 29)
          view.layer.cornerRadius = 20
          return view
      }()
    
      let textHeader : UILabel = {
           let title = UILabel()
           title.text = "สันทนาการ"
           title.font = UIFont.PoppinsBold(size: 17)
           title.textColor = UIColor.white
           return title
      }()


      let titleLabel : UILabel = {
           let title = UILabel()
           title.text = "แซนวิสเพื่อสุขภาพ"
           title.font = UIFont.PoppinsBold(size: 28)
           return title
      }()
     
     let nameLabel : UILabel = {
           let title = UILabel()
           title.text = "โดย ไกด์ ฐิติวัฒน์"
           title.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
           title.font = UIFont.PoppinsMedium(size: 16)
           return title
     }()


     let timeLabel : UILabel = {
      let title = UILabel()
      title.text = "วันเริ่มกิจกรรม: 14 สิงหาคม 2562"
      title.textColor = UIColor.black
      title.font = UIFont.PoppinsMedium(size: 18)
      return title
     }()
     
     let contentLabel : UILabel = {
           let title = UILabel()
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 5
           title.text = "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร"
           title.textColor = UIColor.black
           title.font = UIFont.PoppinsMedium(size: 24)
           return title
     }()

    let contentImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "conImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    let timeImage: UIImageView = {
           let view = UIImageView()
           view.image = UIImage(named: "dateTime")
           view.contentMode = .scaleAspectFit
           return view
       }()

      
     let nextButton: UIButton = {
             let button = UIButton(type: .system)
             button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
             button.layer.cornerRadius = 20
             button.setTitle("เข้าร่วมกิจกรรม", for: .normal)
             button.setTitleColor(.white, for: .normal)
             button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
             button.addTarget(self, action: #selector(activity_active), for: .touchUpInside)
             return button
     }()
    
    let enableButton: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.black
               button.layer.cornerRadius = 20
               button.setTitle("คุณเข้าร่วมกิจกรรมแล้ว", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
               button.isHidden = true
               button.isEnabled = true
               return button
       }()

        @objc func activity_active(){
            
        let passData = DecideViewController()
        let parameters: Parameters = ["user_id":typecheck,"post_timeline_id":activityData?.dataId ?? 0]
            passData.delegate = self
            Alamofire.request(URL_USER_ID, method: .post,parameters: parameters).responseJSON { response in
                print(response)
                passData.actPost = self.ActivityPostID ?? 0
            self.navigationController?.pushViewController(passData, animated: true)
//            self.present(passData, animated: true, completion: nil)
        }
            
//            let passData = AssessVIewController()
//            let parameters: Parameters = ["user_id":typecheck,"post_timeline_id":activityData?.dataId ?? 0]
//            passData.delegate = self
//                 Alamofire.request(URL_USER_ID, method: .post,parameters: parameters).responseJSON { response in
//                    print(response)
//
//                    passData.titleLabel.text = self.titleLabel.text ?? "NULL"
//                    passData.nameLabel.text = self.nameLabel.text ?? "NULL"
//                    passData.actPost = self.ActivityPostID ?? 0
//                    self.navigationController?.pushViewController(passData, animated: true)
////                    self.present(passData, animated: true, completion: nil)
//
//            }
        }
    
        
        func reloadData(){
                    ActivityPostID = activityData?.dataId ?? 0
                     titleLabel.text = activityData?.actId
                     nameLabel.text = activityData?.caption
                     timeLabel.text = activityData?.created
                     contentLabel.text = activityData?.content
                     textHeader.text = activityData?.type
                     Alamofire.request((activityData?.imagePost ?? "0")!).responseImage { response in
                                 if let image = response.result.value {
                                 self.stepView.image = image
                         }
                     }
                 
                     
                     Alamofire.request((activityData?.imgact ?? "0")!).responseImage { response in
                                 if let image = response.result.value {
                                     self.contentImage.image = image
                                 }
                     }
                     Alamofire.request((activityData?.imgtime ?? "0")!).responseImage { response in
                             if let image = response.result.value {
                             self.timeImage.image = image
                         }
                     }
        }
             override func viewDidLoad() {
                super.viewDidLoad()
                reloadData()
                
                 if let name2 = defaultValues.string(forKey: "userId") {
                        typecheck = name2
                    }else{
                 }
                
                
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
                 viewScroll.addSubview(contentImage)
                 viewScroll.addSubview(timeImage)
                 viewScroll.addSubview(nextButton)
                 viewScroll.addSubview(enableButton)
              viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
              
              stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 250)
                 
              BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
              
              header.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 170, widthConstant: screenSizeX, heightConstant: 40)
                
                
              textHeader.anchor(header.topAnchor, left: header.leftAnchor, right: header.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 35, rightConstant: 35, widthConstant: 0, heightConstant: 0)
                               
                
              titleLabel.anchor(header.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
                
              nameLabel.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
              
              timeLabel.anchor(nameLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                              
                
               contentLabel.anchor(timeLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: screenSizeY)
                
                contentImage.anchor(contentLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 300)

                timeImage.anchor(contentImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 200)

                nextButton.anchor(timeImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 100, rightConstant: 100, widthConstant: screenSizeX, heightConstant: 70)
                
                enableButton.anchor(timeImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 50, rightConstant: 50, widthConstant: screenSizeX, heightConstant: 70)

            }

}
