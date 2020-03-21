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


     lazy var bgActivitity:UIView = {
         let background = UIView()
        background.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
         return background
     }()
     
     lazy var bgImage : UIImageView = {
                   let image = UIImageView()
                   image.image = UIImage(named: "bgPrayer")
                   image.contentMode = .scaleAspectFill
                   image.layer.masksToBounds = true
                   return image
     }()
     
     lazy var textHeader : UILabel = {
                 let label = UILabel()
                 let title = "กิจกรรม"
                 let text = "\n สร้างสุข"
                 let attributedText = NSMutableAttributedString(string: title,
                 attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.black])

                 attributedText.append(NSMutableAttributedString(string: text,attributes: [NSMutableAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
                 label.attributedText = attributedText
                 label.numberOfLines = 1
                 return label
             }()
    
        lazy var titleComent: UILabel = {
                 let label = UILabel()
                 label.text = "แนะนำสำหรับคุณ"
                 label.textColor = UIColor.black
                 label.font = UIFont.BaiJamjureeMedium(size: 24)
                 label.numberOfLines = 0
                 return label
        }()
     

     func setLayout(){
         addSubview(bgActivitity)
         addSubview(bgImage)
         addSubview(textHeader)
         addSubview(titleComent)
         
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 180)

         bgImage.anchor(bgActivitity.topAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 190, heightConstant: 113)
         
         textHeader.anchor(bgImage.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 20, widthConstant: 140, heightConstant: 100)
        
         titleComent.anchor(textHeader.bottomAnchor, left: textHeader.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        

     }
}
