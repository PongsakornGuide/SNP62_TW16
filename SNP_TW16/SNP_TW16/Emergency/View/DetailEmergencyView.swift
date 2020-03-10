//
//  DetailEmergencyView.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class DetailEmergencyView: UITableViewCell {
    
     let screenSizeX: CGFloat = UIScreen.main.bounds.width
            let screenSizeY: CGFloat = UIScreen.main.bounds.height
        
           override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                super.init(style: style, reuseIdentifier: reuseIdentifier)
                setLayout()
            }

           required init?(coder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
           }

           lazy var bgActivitity:UIView = {
               let background = UIView()
               return background
           }()
           
           lazy var ImageView : UIImageView = {
                let image = UIImageView()
                image.image = UIImage(named: "doctor")
                image.contentMode = .scaleAspectFill
                return image
           }()
        
           lazy var bgEmergency : UIView = {
              let bg = UIView()
              bg.backgroundColor = UIColor.white
              bg.layer.cornerRadius = 32
              bg.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
              bg.layer.shadowOpacity = 0.1
              bg.layer.shadowOffset = CGSize(width: 0, height: 0)
              bg.layer.shadowRadius = 10
              bg.layer.shouldRasterize = true
              return bg
           }()
           
           lazy var title : UILabel = {
              let title = UILabel()
               title.text = "ตำรวจ 191"
               title.font = UIFont.PoppinsBold(size: 20)
                title.numberOfLines = 0
               return title
           }()

           lazy var ImageCall : UIImageView = {
                 let image = UIImageView()
                 image.image = UIImage(named: "call")
                 image.contentMode = .scaleAspectFill
                 return image
           }()

           func setLayout(){
               backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
               addSubview(bgActivitity)
               addSubview(bgEmergency)
               addSubview(title)
               addSubview(ImageCall)
               addSubview(ImageView)
     
            bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
             
            
            bgEmergency.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
    //
            ImageView.anchor(bgEmergency.topAnchor, left: bgEmergency.leftAnchor, right: nil, bottom: nil, topConstant: 13, bottomConstant: 20, leftConstant: 15, rightConstant: 0, widthConstant: 50, heightConstant: 50)

            title.anchor(bgEmergency.topAnchor, left: ImageView.rightAnchor, right: ImageCall.leftAnchor, bottom: bgEmergency.bottomAnchor, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant:25, widthConstant: 0, heightConstant: 0)
            title.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX).isActive = true
            
            ImageCall.anchor(bgEmergency.topAnchor, left: nil, right: bgEmergency.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant: 25, widthConstant: 30, heightConstant: 30)
            
           }
}

