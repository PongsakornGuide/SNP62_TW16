//
//  SearchTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 21/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class SearchTableViewCell: UITableViewCell {
//        var id_user = String()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViewCell()
            backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        }
        
        let bgActivitity:UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "older-americans-moth1")
            image.contentMode = .scaleAspectFill
            image.layer.masksToBounds = true
            image.layer.cornerRadius = 20
            return image
        }()

        let profileImage: UIView = {
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

    
    var titleFullname: UILabel = {
           let label = UILabel()
                   label.text = "Cannot see activity on alder"
                   label.textColor = UIColor.black
                   label.font = UIFont.PoppinsMedium(size: 18)
                   label.numberOfLines = 1
           return label
        }()
    
    
        let line: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.blackAlpha(alpha: 0.1)
            return view
        }()
    
        let supportName: UILabel = {
            let label = UILabel()
            label.text = "Admin"
            label.textColor = UIColor.blackAlpha(alpha: 0.3)
            label.font = UIFont.PoppinsMedium(size: 14)
             return label
          }()
    
        let supportTime: UILabel = {
          let label = UILabel()
          label.text = "xxxx"
          label.textColor = UIColor.blackAlpha(alpha: 0.8)
          label.font = UIFont.PoppinsMedium(size: 14)
           return label
        }()
    
        func setupViewCell(){
            
            addSubview(bgActivitity)
            addSubview(profileImage)
            addSubview(titleFullname)
            addSubview(line)
            addSubview(supportName)
            addSubview(supportTime)

            bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 60, heightConstant: 280)

            profileImage.anchor(bgActivitity.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 160, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 125)

            titleFullname.anchor(profileImage.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 60, rightConstant: 30, widthConstant: 0, heightConstant: 0)

            line.anchor(titleFullname.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 1.5)
            
            supportName.anchor(line.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 50, rightConstant: 20, widthConstant: 0, heightConstant: 80)
            
            supportTime.anchor(line.topAnchor, left: supportName.leftAnchor, right: rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 120, rightConstant: 20, widthConstant: 0, heightConstant: 80)
            
            
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
