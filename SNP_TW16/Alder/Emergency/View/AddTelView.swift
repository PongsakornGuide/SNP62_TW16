//
//  AddTelView.swift
//  SNP_TW16
//
//  Created by Guide on 3/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class AddTelView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bgActivitity:UIView = {
            let background = UIView()
//            background.backgroundColor = .purple
            return background
    }()
    
    lazy var bgEmergency : UIView = {
         let bg = UIView()
         bg.backgroundColor = UIColor.white
         bg.layer.cornerRadius = 32
         bg.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
         bg.layer.shadowOpacity = 0.1
         bg.layer.shadowOffset = CGSize(width: 0, height: 0)
         bg.layer.shadowRadius = 10
         return bg
      }()
      
    lazy var titleLabel : UILabel = {
         let title = UILabel()
          title.text = "เพิ่มเบอร์ติดต่ออื่นๆ.."
          title.font = UIFont.BaiJamjureeBold(size: 20)
          title.textColor = UIColor.rgb(red: 33, green: 64, blue: 154)
          return title
      }()
    
    
    lazy var ImageCall : UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "call")
           image.contentMode = .scaleAspectFill
           return image
    }()
    

    func setLayout(){
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        addSubview(bgActivitity)
        addSubview(bgEmergency)
        addSubview(titleLabel)
        addSubview(ImageCall)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 20, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 90)
        
        bgEmergency.anchor(bgActivitity.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 80)
        
        
        titleLabel.anchor(bgEmergency.topAnchor, left: bgEmergency.leftAnchor, right: ImageCall.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant: 25, widthConstant: 0, heightConstant: 0)
        
        ImageCall.anchor(bgEmergency.topAnchor, left: nil, right: bgEmergency.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant: 25, widthConstant: 30, heightConstant: 30)
         
    
    }
}
