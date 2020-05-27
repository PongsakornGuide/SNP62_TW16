//
//  TypeActivityView.swift
//  SNP_TW16
//
//  Created by Guide on 24/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TypeActivityView: UITableViewCell {
    
    
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
     
     lazy var bgBorder:UIView = {
           let background = UIView()
                background.backgroundColor = UIColor.white
                background.layer.cornerRadius = 30
                background.layer.borderColor = UIColor.blackAlpha(alpha: 0.4).cgColor
                background.layer.shadowOpacity = 0.1
                background.layer.shadowOffset = CGSize(width: 0, height: 0)
                background.layer.shadowRadius = 10
           return background
    }()
    
     lazy var bgImage : UIImageView = {
                   let image = UIImageView()
                   image.image = UIImage(named: "val-vesa-P0F_zH39qhs-unsplash")
                   image.contentMode = .scaleAspectFill
                   image.layer.cornerRadius = 30
                   image.layer.masksToBounds = true
//                   image.backgroundColor = UIColor(white: 0, alpha: 0.1)
                   image.layer.opacity = 8
                   return image
     }()

     lazy var textHeader : UILabel = {
                 let label = UILabel()
                 let title = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                 let attributedText = NSMutableAttributedString(string: title,
                                                                attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
            
                 label.attributedText = attributedText
                 label.numberOfLines = 0
                 return label
             }()

     

     func setLayout(){
         addSubview(bgActivitity)
         addSubview(bgBorder)
         addSubview(bgImage)
         addSubview(textHeader)
         
         bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 250)
         
        bgBorder.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 230)
        
        textHeader.anchor(nil, left: bgBorder.leftAnchor, right: bgBorder.rightAnchor, bottom: bgBorder.bottomAnchor, topConstant: 0, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        bgImage.anchor(bgBorder.topAnchor, left:bgBorder.leftAnchor, right: bgBorder.rightAnchor, bottom: bgBorder.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0
                )



     }
}
