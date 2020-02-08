//
//  DetailEmergencyView.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class DetailEmergencyView: UITableViewCell {
    var activityData: allListTel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
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
    
    let title : UILabel = {
       let title = UILabel()
        title.text = "ตำรวจ 191"
        title.font = UIFont.PoppinsBold(size: 20)
        return title
    }()
    
    let ImageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Group 1094")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let ImageCall : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "call")
        image.contentMode = .scaleAspectFill
        return image
    }()


    func setLayout(){
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        addSubview(bgActivitity)
        addSubview(bgEmergency)
        addSubview(title)
        addSubview(ImageView)
        addSubview(ImageCall)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 100)
        
        bgEmergency.anchor(bgActivitity.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 75)
        
        ImageView.anchor(bgEmergency.topAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 15, leftConstant: 40, rightConstant: 0, widthConstant: 50, heightConstant: 50)
               
        title.anchor(bgEmergency.topAnchor, left: ImageView.rightAnchor, right: bgEmergency.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant: 25, widthConstant: 0, heightConstant: 0)
        
        ImageCall.anchor(bgEmergency.topAnchor, left: title.rightAnchor, right: bgEmergency.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant: 25, widthConstant: 30, heightConstant: 30)
        

    }
}

