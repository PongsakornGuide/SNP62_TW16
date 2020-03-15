//
//  TestVideoController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TestVideoController: UIViewController {
    
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
                
        
     
    lazy var profileImage: UIView = {
              let background = UIView()
                 background.backgroundColor = UIColor.white
                 background.layer.cornerRadius = 20
                 background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                 background.layer.shadowOpacity = 0.1
                 background.layer.shadowOffset = CGSize(width: 0, height: 0)
                 background.layer.shadowRadius = 10
                 background.layer.shouldRasterize = true
                 return background
    }()

    lazy var bgActivitity:UIWebView = {
             let image = UIWebView()
             return image
    }()
    
    lazy var titleFullname: UILabel = {
           let label = UILabel()
                   label.text = "นิทานสั้น เรื่อง แม่-ลูก"
                   label.textColor = UIColor.black
                   label.font = UIFont.BaiJamjureeBold(size: 20)
                   label.numberOfLines = 0
           return label
    }()
    
    
    lazy var detaillname: UILabel = {
              let label = UILabel()
                      label.text = "โดย: หลวงปู่ชา"
                      label.textColor = UIColor.black
                      label.font = UIFont.BaiJamjureeMedium(size: 18)
                      label.numberOfLines = 0
              return label
    }()
    
// func getvideo(videoCode:String){
//     let url = URL(string:"https://www.youtube.com/embed/\(videoCode)")
//     bgActivitity.loadRequest(URLRequest(url: url!))
// }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getvideo(videoCode: "RmHqOSrkZnk")
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        view.addSubview(profileImage)
        view.addSubview(bgActivitity)

                

                profileImage.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                
        bgActivitity.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 150)

                detaillname.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 140).isActive = true
                
    }
}
