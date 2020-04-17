//
//  DetailStoryViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DetailStoryViewController: UIViewController {
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
            title.text = "นิทานธรรมมะ"
            title.font = UIFont.BaiJamjureeBold(size: 28)
            title.numberOfLines = 0
            return title
       }()

      
      lazy var contentLabel : UILabel = {
            let title = UILabel()
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 0
            title.text = "มีคนเลี้ยงไก่ 2 คนคนที่ 1 ทุกเช้าจะเอาตะกร้า เข้าไปใน โรงเรือนเลี้ยงไก่แล้วก็ เก็บ “ขี้ไก่” ใส่ตะกร้ากลับบ้าน!! แล้วทิ้งไข่ไก่ ให้เน่าไว้ในโรงเรือนเมื่อเขาเอาขี้ไก่กลับถึงบ้าน ทั้งบ้านก็เหม็นหึ่ง ไปด้วยกลิ่นขึ้ไก่ !!!            คนทั้งบ้านต้องทนกับกลิ่นเหม็น!!!คนเลี้ยงไก่คนที่ 2 เอาตะกร้าเข้าไปในโรงเรือนเลี้ยงไก่เก็บไข่ไก่ใส่ตะกร้าเอากลับบ้าน เขาเอาไข่ไก่ลงเจียว กลิ่นหอมอบอวลไปทั่วบ้านคนทั้งบ้านได้กินไข่เจียวแสนอร่อย ไข่ไก่ที่เหลือ เขาก็เอาไปขาย แล้วได้เงินมาใช้จ่ายในบ้าน ทุกคนในบ้านมีความสุขมาก…..ในชีวิตของเรา พวกเรา เป็นคนเก็บ “ไข่ไก่ ” หรือ เก็บ”ขี้ไก่”เราเป็นคนเก็บ “ขี้ไก่” โดยเฝ้าแต่เก็บ เรื่องร้ายๆ แย่ๆที่เกิดขึ้นในชีวิตเราไว้ในหัวของเราและมีความทุกข์ตลอดเวลาที่คิดถึงมัน!!!หรือเราเป็นคนที่เก็บ”ไข่ไก่” เราจดจำสิ่งที่ดีๆที่เกิดในชีวิตของเราและมีความสุขทุกครั้งที่คิดถึงมัน!!คน เราส่วนใหญ่ชอบเป็นคนเก็บ “ขี้ไก่”เราถึงต้องเป็นทุกข์ตลอดเวลา เรื่องความเสียใจ ความผิดพลาด ความเจ็บใจฯลฯมักจะติดอยู่ในใจของเรานานเท่านานถ้าเราอยากมีความสุขในชีวิต เลือกเก็บ”ไข่ไก่” กับชีวิตทิ้ง “ขี้ไก่” ไปเถอะชีวิตของเราจะได้มีความสุขซักที…"
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
        navigationItem.title = "นิทาน"
        view.addSubview(viewScroll)
        viewScroll.addSubview(stepView)
        viewScroll.addSubview(BGView)
        viewScroll.addSubview(Activityline)
        viewScroll.addSubview(titleLabel)
        viewScroll.addSubview(contentLabel)


                        
        viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                      
        stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 160)
                         
        BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
    
        titleLabel.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        Activityline.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 30 , widthConstant: screenSizeX, heightConstant: 1.5)

        
        contentLabel.anchor(Activityline.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 0)

        contentLabel.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
        
    }
}
