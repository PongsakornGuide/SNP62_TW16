//
//  DetailReligionViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DetailReligionViewController: UIViewController {
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    
       lazy var viewScroll: UIScrollView = {
            let view = UIScrollView()
            return view
        }()
        
        lazy var stepView: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "religion")
            view.contentMode = .scaleAspectFill
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var BGView: UIView = {
              let view = UIView()
              view.backgroundColor = .white
              view.layer.cornerRadius = 20
              return view
        }()

        
        lazy var titleLabel : UILabel = {
               let title = UILabel()
               title.text = "บทสวดธรรมมะ"
               title.font = UIFont.BaiJamjureeBold(size: 28)
               title.numberOfLines = 0
               return title
        }()
    
        lazy var contentLabel : UILabel = {
            let title = UILabel()
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 0
            title.text = "เรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไรเรียนรู้ขั้นตอนการจัดวางแซนวิชของตนเอง ผ่านการเลือกสรรส่วนประกอบว่ามีอะไรบ้าง มีขั้นตอนและการจัดวางอย่างไร"
            title.textColor = UIColor.black
            title.font = UIFont.BaiJamjureeMedium(size: 24)
            return title
      }()

     lazy var Activityline: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
         return view
     }()
        



    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "บทสวดมนต์"
        
        let backButton = UIBarButtonItem()
              backButton.title = "back"
              self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
              
        
        view.addSubview(viewScroll)
        viewScroll.addSubview(stepView)
        viewScroll.addSubview(BGView)
        viewScroll.addSubview(Activityline)
        viewScroll.addSubview(titleLabel)
        viewScroll.addSubview(contentLabel)
                        
        viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                      
        stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 160)
                         
        BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
    
        titleLabel.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        
        Activityline.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 30 , widthConstant: screenSizeX, heightConstant: 1.5)

        
        contentLabel.anchor(Activityline.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 0)

        contentLabel.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
        
    }
}
