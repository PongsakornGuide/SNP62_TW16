//
//  TitleFavoriteView.swift
//  SNP_TW16
//
//  Created by Guide on 30/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TitleFavoriteView: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate  {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setLayout()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     lazy var bgActivitity:UIView = {
          let background = UIImageView()
          return background
      }()
    
    lazy var titleHeader : UILabel = {
                   let label = UILabel()
                   let title = "ความสนใจ *"
                   let attributedText = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 30),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                   label.attributedText = attributedText
                   label.numberOfLines = 0
                   return label
    }()
    
    lazy var Header : UILabel = {
                     let label = UILabel()
                     let title = "เลือกประเภทสิ่งที่คุณสนใจ"
                     let attributedText = NSMutableAttributedString(string: title,
                     attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 25),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                     label.attributedText = attributedText
                     label.numberOfLines = 0
                     return label
      }()
    
    

     func setLayout(){
         addSubview(bgActivitity)
         addSubview(titleHeader)
        addSubview(Header)
         backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
         bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 125)
         titleHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 50)
          Header.anchor(titleHeader.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 50)
     }
}
