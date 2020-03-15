//
//  TitleMusicViewCell.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//


import UIKit
class TitleMusicViewCell: UITableViewCell{
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                  super.init(style: style, reuseIdentifier: reuseIdentifier)
                  setLayout()
              }
         
             lazy var bgImage : UIImageView = {
                        let image = UIImageView()
                        image.image = UIImage(named: "bgPrayer")
                        image.contentMode = .scaleAspectFill
                        image.layer.masksToBounds = true
                        return image
             }()
    
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
                            let title = "ฟังเพลง \nประจำวัน"
                            let attributedText = NSMutableAttributedString(string: title,
                            attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                            label.attributedText = attributedText
                            label.numberOfLines = 0
                            return label
             }()
          
             lazy var Header : UILabel = {
                               let label = UILabel()
                               let title = "แนะนำสำหรับคุณ"
                               let attributedText = NSMutableAttributedString(string: title,
                               attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                               label.attributedText = attributedText
                               label.numberOfLines = 0
                               return label
              }()
             

             func setLayout(){
                 addSubview(bgImage)
                 addSubview(bgActivitity)
                 addSubview(bgImage)
                 addSubview(titleHeader)
                 addSubview(Header)
                bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

                bgImage.anchor(bgActivitity.topAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 260, heightConstant: 150)

                 titleHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 30, rightConstant: 20, widthConstant: 0, heightConstant: 0)
//
                 Header.anchor(titleHeader.bottomAnchor, left: titleHeader.leftAnchor, right: nil, bottom: bgActivitity.bottomAnchor, topConstant: 40, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
             }
}
