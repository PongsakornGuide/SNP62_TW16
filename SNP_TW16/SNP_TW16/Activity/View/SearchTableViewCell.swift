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

    let bgActivitity:UIImageView = {
             let image = UIImageView()
             image.image = UIImage(named: "maeMuUnu")
             image.contentMode = .scaleAspectFill
             image.layer.masksToBounds = true
             image.layer.cornerRadius = 20
             return image
    }()
    
    var titleFullname: UILabel = {
           let label = UILabel()
                   label.text = "แซนวิสเพื่อสุขภาพ"
                   label.textColor = UIColor.black
                   label.font = UIFont.PoppinsBold(size: 20)
                   label.numberOfLines = 1
           return label
        }()
    
        let line: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 252)
            return view
        }()
    
         let Labelid: UILabel = {
              let view = UILabel()
//              view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 252)
                view.text = "1"
              return view
          }()
    
        let supportName: UILabel = {
            let label = UILabel()
            label.text = "โดย ไกด์ ฐิติวัฒน์"
            label.textColor = UIColor.blackAlpha(alpha: 0.3)
            label.font = UIFont.PoppinsMedium(size: 16)
             return label
          }()
    
        let supportTime: UILabel = {
          let label = UILabel()
          label.text = "14 สิงหาคม 2562"
          label.textColor = UIColor.blackAlpha(alpha: 0.8)
          label.font = UIFont.PoppinsMedium(size: 16)
          return label
        }()
    
        func setupViewCell(){
            
            
            addSubview(profileImage)
            addSubview(bgActivitity)
            addSubview(titleFullname)
            addSubview(line)
            addSubview(supportName)
            addSubview(supportTime)
            addSubview(Labelid)

            profileImage.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 280)
//
            bgActivitity.anchor(profileImage.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 150)

            titleFullname.anchor(bgActivitity.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 50, rightConstant: 0, widthConstant: 0, heightConstant: 0)

            line.anchor(titleFullname.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 1.1)
            
            
            Labelid.anchor(line.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 20, widthConstant: 0, heightConstant: 80)
            
            supportName.anchor(Labelid.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 20, widthConstant: 0, heightConstant: 80)

            supportTime.anchor(line.bottomAnchor, left: nil, right: rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 80)
        
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

