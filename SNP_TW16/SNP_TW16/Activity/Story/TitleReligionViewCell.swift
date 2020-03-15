//
//  TitleMusic.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TitleReligionViewCell: UITableViewCell{
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
                     image.image = UIImage(named: "")
                     image.contentMode = .scaleAspectFill
                     image.layer.masksToBounds = true
                     return image
       }()
       
       lazy var titleHeader : UILabel = {
                      let label = UILabel()
                      let title = "ศาสนา \nปฏิบัติธรรม"
                      let attributedText = NSMutableAttributedString(string: title,
                      attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                      label.attributedText = attributedText
                      label.numberOfLines = 0
                      return label
       }()
    
       lazy var Header : UILabel = {
                         let label = UILabel()
                         let title = "บทสวดธรรมมะ"
                         let attributedText = NSMutableAttributedString(string: title,
                         attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                         label.attributedText = attributedText
                         label.numberOfLines = 0
                         return label
        }()
       

       func setLayout(){
           addSubview(bgActivitity)
           addSubview(bgImage)
           addSubview(titleHeader)
           addSubview(Header)
           bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 200)

           bgImage.anchor(bgActivitity.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200
                  )
           
           titleHeader.anchor(bgImage.topAnchor, left: bgImage.leftAnchor, right: bgImage.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 30, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
           Header.anchor(titleHeader.bottomAnchor, left: titleHeader.leftAnchor, right: titleHeader.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
       }
}

