//
//  DetailEmergencyView.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class DetailEmergencyView: UITableViewCell {
         override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let bgActivitity:UIView = {
        let background = UIView()
//        background.backgroundColor = .purple
        return background
    }()
    
    
    let bgEmergency : UIView = {
       let bg = UIView()
       bg.backgroundColor = UIColor.green
       bg.layer.cornerRadius = 32
       bg.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
       bg.layer.shadowOpacity = 0.1
       bg.layer.shadowOffset = CGSize(width: 0, height: 0)
       bg.layer.shadowRadius = 10
       bg.layer.shouldRasterize = true
       return bg
    }()
    
    let num : UILabel = {
       let title = UILabel()
        title.text = "161"
        return title
    }()
    
    let title : UILabel = {
       let title = UILabel()
        title.text = "ตำรวจ 191"
        return title
    }()

    let btnCell : UIButton = {
          let bg = UIButton()
          bg.backgroundColor = UIColor.purple
          bg.layer.cornerRadius = 20
          bg.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
          bg.layer.shadowOpacity = 0.1
          bg.layer.shadowOffset = CGSize(width: 0, height: 0)
          bg.layer.shadowRadius = 10
          bg.layer.shouldRasterize = true
          return bg
    }()

    func setLayout(){
        addSubview(bgActivitity)
        addSubview(bgEmergency)
        addSubview(btnCell)
        addSubview(title)
        addSubview(num)
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 100)
        
        bgEmergency.anchor(bgActivitity.topAnchor, left: leftAnchor, right: btnCell.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 100, widthConstant: 0, heightConstant: 80)
        
        num.anchor(bgEmergency.topAnchor, left: leftAnchor, right: num.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 30, leftConstant: 50, rightConstant: 0, widthConstant: 0, heightConstant: 0)
               
        title.anchor(bgEmergency.topAnchor, left: num.leftAnchor, right: rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 30, leftConstant: 50, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        btnCell.anchor(bgActivitity.topAnchor, left: nil, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 0, rightConstant: 20, widthConstant: 80, heightConstant: 80)
        
    }
}

