//
//  TileStoryViewCell.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TileStoryViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
        }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }


       lazy var bgActivitity:UIView = {
           let background = UIView()
           background.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
           return background
       }()
       
       
       lazy var titleHeader : UILabel = {
                      let label = UILabel()
                      let title = "นิทานธรรมมะ"
                      let attributedText = NSMutableAttributedString(string: title,
                      attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                      label.attributedText = attributedText
                      label.numberOfLines = 0
                      return label
       }()
       

       func setLayout(){
           addSubview(bgActivitity)
           addSubview(titleHeader)
           
          
           
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 80)


        titleHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 40, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        

       }
}

