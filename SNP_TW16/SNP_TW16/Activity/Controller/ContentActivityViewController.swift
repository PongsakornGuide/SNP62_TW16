//
//  ContentActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ContentActivityViewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate{
//    let num : Int = 0631921545
             let screenSizeX: CGFloat = UIScreen.main.bounds.width
             let screenSizeY: CGFloat = UIScreen.main.bounds.height
             
             var viewScroll: UIScrollView = {
                 let view = UIScrollView()
                 return view
             }()
    
             let stepView: UIImageView = {
                 let view = UIImageView()
                 view.image = UIImage(named: "maeMuUnu")
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
               title.text = " สันทนาการ"
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
            return view
        }()
    
        let timeImage: UIImageView = {
               let view = UIImageView()
               view.image = UIImage(named: "dateTime")
               return view
           }()
    
            
         
          
          let uploadImage: UIButton = {
              let image = UIImage(named: "Group 1093") as UIImage?
              let button = UIButton()
              button.setImage(image, for: .normal)
              button.layer.masksToBounds = true
//              button.addTarget(self, action: #selector(upload), for: .touchUpInside)
              return button
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

        @objc func activity_active(){
//            if let url = NSURL(string: "tel://\(num)"), UIApplication.shared.canOpenURL(url as URL) {
//                UIApplication.shared.openURL(url as URL)
//            }
            print("5555")
            let passData = AssessVIewController()
            self.navigationController?.pushViewController(passData, animated: true)
                         
        }
    

    
             override func viewDidLoad() {
                 super.viewDidLoad()
             
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
              
              viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
              
              stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 200)
                 
              BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
              
              header.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 180, widthConstant: screenSizeX, heightConstant: 40)
                
                
              textHeader.anchor(header.topAnchor, left: header.leftAnchor, right: header.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 45, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 0)
                               
                
              titleLabel.anchor(header.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
                
              nameLabel.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
              
              timeLabel.anchor(nameLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                              
                
               contentLabel.anchor(timeLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: screenSizeY)
                
                contentImage.anchor(contentLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 300)

                timeImage.anchor(contentImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 200)

                nextButton.anchor(timeImage.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 100, rightConstant: 100, widthConstant: screenSizeX, heightConstant: 70)

            }

}
