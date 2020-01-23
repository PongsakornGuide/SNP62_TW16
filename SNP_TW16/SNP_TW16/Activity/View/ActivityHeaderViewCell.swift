//
//  ActivityHeaderViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 6/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ActivityHeaderViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setLayout()
      }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }


     let bgActivitity:UIView = {
         let background = UIView()
         background.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
         return background
     }()
     
     let bgImage : UIImageView = {
                   let image = UIImageView()
                   image.image = UIImage(named: "Intersection 4")
                   image.contentMode = .scaleAspectFill
                   image.layer.masksToBounds = true
                   return image
     }()
     
           let textHeader : UILabel = {
                 let label = UILabel()
                 let title = "กิจกรรม"
                 let text = "\n สร้างสุข"
                 let attributedText = NSMutableAttributedString(string: title,
                 attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.white])

                 attributedText.append(NSMutableAttributedString(string: text,attributes: [NSMutableAttributedString.Key.font : UIFont.PoppinsBold(size: 32),NSMutableAttributedString.Key.foregroundColor: UIColor.white]))

                 label.attributedText = attributedText
                 label.numberOfLines = 0
                 return label
             }()
     
     

     func setLayout(){
         addSubview(bgActivitity)
         addSubview(bgImage)
         addSubview(textHeader)
         
         bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 200)

         bgImage.anchor(bgActivitity.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200
                )
         
         textHeader.anchor(bgImage.topAnchor, left: bgImage.leftAnchor, right: bgImage.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 30, rightConstant: 20, widthConstant: 0, heightConstant: 0)

     }
}