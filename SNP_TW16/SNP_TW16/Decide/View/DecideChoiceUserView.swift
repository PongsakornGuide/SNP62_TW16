//
//  DecideChoiceUserView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 31/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DecideChoiceUserView: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
     let bgCheck : UIView = {
              let image = UIImageView()
                   image.backgroundColor = UIColor.white
                   image.layer.cornerRadius = 20
                   image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                   image.layer.shadowOpacity = 0.1
                   image.layer.shadowOffset = CGSize(width: 0, height: 0)
                   image.layer.shadowRadius = 10
                   image.layer.shouldRasterize = true
                return image
      }()
      
      let bgImage : UIImageView = {
              let image = UIImageView()
              image.image = UIImage(named: "rectangle142")
              image.contentMode = .scaleAspectFill
              image.layer.masksToBounds = true
              return image
      }()
    
    
      let textHeader : UILabel = {
                  let label = UILabel()
                  let title = "check box"
                  let attributedText = NSMutableAttributedString(string: title,
                  attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                  label.attributedText = attributedText
                  label.textColor = .black
                  label.numberOfLines = 0
                  return label
      }()
    
       func setLayout(){
//           addSubview(bgCheck)
           addSubview(bgImage)
           addSubview(textHeader)
           backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            bgImage.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: nil, bottom: nil, topConstant: 35, bottomConstant: 0, leftConstant: 40, rightConstant: 0, widthConstant: 40, heightConstant:40)
        
           textHeader.anchor(safeAreaLayoutGuide.topAnchor, left: bgImage.rightAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 40, widthConstant: 0, heightConstant:100)
       }
}
