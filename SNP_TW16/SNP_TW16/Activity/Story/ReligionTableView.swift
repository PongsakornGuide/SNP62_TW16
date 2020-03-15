//
//  MusicTableView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ReligionTableView: UITableViewCell {
//        var id_user = String()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViewCell()
    }
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
                
        
     
    lazy var profileImage: UIView = {
              let background = UIView()
                 background.backgroundColor = UIColor.white
                 background.layer.cornerRadius = 20
                 background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                 background.layer.shadowOpacity = 0.1
                 background.layer.shadowOffset = CGSize(width: 0, height: 0)
                 background.layer.shadowRadius = 10
                 background.layer.shouldRasterize = true
                 return background
    }()

    lazy var bgActivitity:UIImageView = {
             let image = UIImageView()
             image.image = UIImage(named: "religion")
             image.contentMode = .scaleAspectFill
             image.layer.masksToBounds = true
             image.layer.cornerRadius = 20
             return image
    }()
    
    lazy var titleFullname: UILabel = {
           let label = UILabel()
                   label.text = "คำนมัสการพระรัตนตรัย"
                   label.textColor = UIColor.black
                   label.font = UIFont.BaiJamjureeBold(size: 20)
                   label.numberOfLines = 0
           return label
    }()
        func setupViewCell(){
            backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            addSubview(profileImage)
            addSubview(bgActivitity)
            addSubview(titleFullname)

           profileImage.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: titleFullname.bottomAnchor, topConstant: 0, bottomConstant: -20, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                      
                      bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 150)

                      titleFullname.anchor(bgActivitity.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 5, widthConstant: 0, heightConstant: 0)

                      titleFullname.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 140).isActive = true
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}


