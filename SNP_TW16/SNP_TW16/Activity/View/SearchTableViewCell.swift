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
             image.image = UIImage(named: "maeMuUnu")
             image.contentMode = .scaleAspectFill
             image.layer.masksToBounds = true
             image.layer.cornerRadius = 20
             return image
    }()
    
    lazy var titleFullname: UILabel = {
           let label = UILabel()
                   label.text = "แซนวิสเพื่อสุขภาพ"
                   label.textColor = UIColor.black
                   label.font = UIFont.PoppinsBold(size: 20)
                   label.numberOfLines = 0
           return label
    }()
    
    lazy var markImage:UIImageView = {
                let image = UIImageView()
                image.image = UIImage(named: "group1310")
                image.contentMode = .scaleAspectFill
                image.layer.masksToBounds = true
                return image
    }()
    
    lazy var line: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 252)
            return view
    }()
    
    lazy var supportName: UILabel = {
            let label = UILabel()
            label.text = "โดย ไกด์ ฐิติวัฒน์"
            label.textColor = UIColor.blackAlpha(alpha: 0.3)
            label.font = UIFont.PoppinsMedium(size: 16)
            return label
    }()
    
    lazy var maxUser: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor.blackAlpha(alpha: 0.3)
        label.font = UIFont.PoppinsMedium(size: 16)
        return label
    }()
    
    lazy var supportTime: UILabel = {
          let label = UILabel()
          label.text = "14 สิงหาคม 2562"
          label.textColor = UIColor.blackAlpha(alpha: 0.8)
          label.font = UIFont.PoppinsMedium(size: 16)
          return label
    }()
     let CheckPoint: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.rgb(red: 241, green: 90, blue: 66)
               button.layer.cornerRadius = 30/2
               button.setTitle("ยังไม่ได้ประเมิน", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
               button.isEnabled = true
               button.addTarget(self, action: #selector(ClickUser), for: .touchUpInside)
               return button
    }()
    let decidePass: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.rgb(red: 70, green: 136, blue: 61)
               button.layer.cornerRadius = 30/2
               button.setTitle("ประเมินแล้ว", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
               button.isEnabled = true
               button.isHidden = true
               return button
    }()
    
    @objc func ClickUser(){
    }
    
        func setupViewCell(){

            addSubview(profileImage)
            profileImage.addSubview(bgActivitity)
            profileImage.addSubview(titleFullname)
            profileImage.addSubview(line)
            profileImage.addSubview(supportName)
            profileImage.addSubview(supportTime)

            profileImage.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: supportName.bottomAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
            bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 150)

            titleFullname.anchor(bgActivitity.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)

            titleFullname.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
                        
            line.anchor(titleFullname.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 1.1)
                     
            supportName.anchor(line.bottomAnchor, left: bgActivitity.leftAnchor, right: rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 80)
                        
            supportTime.anchor(line.bottomAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 80)
            

        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

