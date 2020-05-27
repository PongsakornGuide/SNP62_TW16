//
//  NotificationTitle.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 11/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class NotificationTitle: UITableViewCell {

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
           return background
       }()
       
       var textHeader : UILabel = {
                   let label = UILabel()
                   let title = "5 รายการ"
                   let attributedTexts = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 34),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                   label.attributedText = attributedTexts
                   label.numberOfLines = 0
                   return label
        }()
       
       

        func setLayout(){
        addSubview(bgActivitity)
        addSubview(textHeader)
           
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 100)
        
        textHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        textHeader.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
       }
}
