//
//  TitleTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class TitleTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
        }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }


       lazy var bgActivitity:UIView = {
           let background = UIView()
//           background.backgroundColor = UIColor.red
           return background
       }()
//       group1485
//    Intersection 4
       lazy var bgImage : UIImageView = {
                     let image = UIImageView()
//                     image.image = UIImage(named: "Intersection 4")
                     image.contentMode = .scaleAspectFill
                     image.layer.masksToBounds = true
                     return image
       }()
       
       lazy var titleHeader : UILabel = {
                      let label = UILabel()
                      let title = "สวัสดีวันจันทร์,"
                      let attributedText = NSMutableAttributedString(string: title,
                      attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                      label.attributedText = attributedText
                      label.numberOfLines = 0
                      return label
       }()
       
       
       lazy var textHeader : UILabel = {
                   let label = UILabel()
                   let title = "สวัสดีวันจันทร์,"
                   let attributedTexts = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                   label.attributedText = attributedTexts
                   label.numberOfLines = 0
                   return label
               }()
       
       

       func setLayout(){
           addSubview(bgActivitity)
           addSubview(bgImage)
           addSubview(titleHeader)
           addSubview(textHeader)
           
           bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 200)

           bgImage.anchor(bgActivitity.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200
                  )
           
        
           titleHeader.anchor(bgImage.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 60, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
           titleHeader.centerXAnchor.constraint(equalTo: bgActivitity.centerXAnchor).isActive = true
        
           textHeader.anchor(titleHeader.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            textHeader.centerXAnchor.constraint(equalTo: bgActivitity.centerXAnchor).isActive = true
       }
}
