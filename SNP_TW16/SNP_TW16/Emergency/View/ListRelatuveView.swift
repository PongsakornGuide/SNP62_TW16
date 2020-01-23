//
//  ListRelatuveView.swift
//  SNP_TW16
//
//  Created by Guide on 23/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ListRelatuveView: UITableViewCell {
//    var activityData: allListTel?
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
        }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

       
       let bgActivitity:UIView = {
           let background = UIView()
           return background
       }()
       
       let bgEmergency : UIView = {
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
       
       let num : UILabel = {
          let title = UILabel()
           title.text = "161"
           
           title.font = UIFont.PoppinsBold(size: 32)
           return title
       }()
       
       let title : UILabel = {
          let title = UILabel()
           title.text = "ตำรวจ 191"
           title.font = UIFont.PoppinsBold(size: 18)
           return title
       }()

       let btnCell : UIView = {
             let bg = UIView()
             bg.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
             bg.layer.cornerRadius = 20
             bg.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
             bg.layer.shadowOpacity = 0.1
             bg.layer.shadowOffset = CGSize(width: 0, height: 0)
             bg.layer.shadowRadius = 10
             bg.layer.shouldRasterize = true
             return bg
       }()
       
       let iconImgae : UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "Iconcall")
           image.contentMode = .scaleAspectFill
           image.layer.masksToBounds = true
           return image
       }()

       func setLayout(){
           backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
           addSubview(bgActivitity)
           addSubview(bgEmergency)
           addSubview(btnCell)
           addSubview(title)
           addSubview(num)
           addSubview(iconImgae)
           
           bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 100)
           
           bgEmergency.anchor(bgActivitity.topAnchor, left: leftAnchor, right: btnCell.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 80, widthConstant: 0, heightConstant: 75)
           
           num.anchor(bgEmergency.topAnchor, left: leftAnchor, right: num.rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 20, leftConstant: 50, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                  
           title.anchor(bgEmergency.topAnchor, left: num.leftAnchor, right: rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 75, rightConstant: 0, widthConstant: 0, heightConstant: 0)
           
           btnCell.anchor(bgActivitity.topAnchor, left: nil, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 0, rightConstant: 20, widthConstant: 70, heightConstant: 75)
           
           iconImgae.anchor(btnCell.topAnchor, left: btnCell.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 10, rightConstant: 0, widthConstant: 45, heightConstant: 45)
       }
}
