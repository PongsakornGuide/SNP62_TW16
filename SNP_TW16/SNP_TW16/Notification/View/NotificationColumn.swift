//
//  NotificationColumn.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 11/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class NotificationColumn: UITableViewCell {

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
            background.backgroundColor = UIColor.white
            background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            background.layer.shadowOpacity = 0.1
            background.layer.shadowOffset = CGSize(width: 0, height: 0)
            background.layer.shadowRadius = 10
            background.layer.shouldRasterize = true
            return background
        }()
    

       lazy var textLabelTitle : UILabel = {
                   let label = UILabel()
                   let title = "มาลี มีสกุล ได้แสดงความคิดเห็นบนโพสต์ของคุณ"
                   let attributedTexts = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                   label.attributedText = attributedTexts
                   label.numberOfLines = 0
                   return label
        }()
       
  

      
      lazy var profileImage: UIImageView = {
         let image = UIImageView()
          image.image = UIImage(named: "tiko")
          image.contentMode = .scaleAspectFill
          image.layer.masksToBounds = true
          image.layer.cornerRadius = 60/2
         return image
      }()
       
    lazy var timeLabel : UILabel = {
               let label = UILabel()
               let title = "30 นาทีที่แล้ว"
               let attributedTexts = NSMutableAttributedString(string: title,
               attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 14),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
               label.attributedText = attributedTexts
               label.numberOfLines = 0
               return label
    }()
    

       func setLayout(){
           addSubview(bgActivitity)
           addSubview(profileImage)
           addSubview(textLabelTitle)
           addSubview(timeLabel)
           
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 5, bottomConstant: 5, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        profileImage.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        textLabelTitle.anchor(bgActivitity.topAnchor, left: profileImage.rightAnchor, right: bgActivitity.rightAnchor, bottom: timeLabel.topAnchor, topConstant: 20, bottomConstant: 15, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        textLabelTitle.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
        timeLabel.anchor(textLabelTitle.bottomAnchor, left: textLabelTitle.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        timeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true

       }
}
