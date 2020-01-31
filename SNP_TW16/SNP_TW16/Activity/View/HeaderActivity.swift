//
//  HeaderActivity.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class HeaderActivity: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViewCell()
            backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    let bgActivitity:UIView = {
        let background = UIView()
        return background
    }()
    
    let bgEmergency : UIView = {
       let bg = UIView()
       bg.backgroundColor = UIColor.white
       bg.layer.cornerRadius = 32
       bg.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
       bg.layer.shadowOpacity = 0.1
       bg.layer.shadowOffset = CGSize(width: 0, height: 0)
       bg.layer.shadowRadius = 10
       bg.layer.shouldRasterize = true
       return bg
    }()
    
    let iconImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gameController")
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    let titleType : UILabel = {
       let title = UILabel()
        title.text = "กิจกรรม"
        title.font = UIFont.PoppinsBold(size: 25)
        title.numberOfLines = 2
        return title
    }()
    
    func setupViewCell(){

        addSubview(bgActivitity)
        addSubview(bgEmergency)
        addSubview(iconImage)
        addSubview(titleType)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 170)
        
        bgEmergency.anchor(bgActivitity.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 10, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 150)
             
        iconImage.anchor(bgEmergency.topAnchor, left: bgEmergency.leftAnchor, right: nil, bottom: nil, topConstant: 35, bottomConstant: 20, leftConstant: 40, rightConstant: 0, widthConstant: 80, heightConstant: 80)
                    
        titleType.anchor(bgEmergency.topAnchor, left: iconImage.leftAnchor, right: bgEmergency.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 20, leftConstant: 120, rightConstant: 35, widthConstant: 0, heightConstant: 0)
             
    }
    
}
