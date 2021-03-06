//
//  SearchTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 21/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class SearchTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViewCell()
    }
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
                
    lazy var profileImage: UIView = {
              let background = UIView()
                 background.backgroundColor = .white
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
    
    lazy var recommend:UIImageView = {
              let image = UIImageView()
              image.image = UIImage(named: "group1322")
              image.contentMode = .scaleAspectFill
              image.layer.masksToBounds = true
              return image
    }()
    

    lazy var bgActivitityBg : UIView = {
             let image = UIView()
             image.layer.cornerRadius = 20
             image.backgroundColor = UIColor(white: 0, alpha: 0.6)
             return image
    }()
    
    lazy var titleFullnameEnd: UILabel = {
            let label = UILabel()
            label.text = "กิจกรรมนี้สิ้นสุดลงแล้ว"
            label.textColor = UIColor.white
            label.font = UIFont.BaiJamjureeBold(size: 24)
            label.numberOfLines = 0
            return label
    }()
    
    lazy var titleFullname: UILabel = {
           let label = UILabel()
           label.text = "แซนวิสเพื่อสุขภาพ"
           label.textColor = UIColor.black
           label.font = UIFont.BaiJamjureeBold(size: 20)
           label.numberOfLines = 0
           return label
    }()
    
    lazy var fullActivity: UILabel = {
           let label = UILabel()
           label.text = "กิจกรรมเต็มแล้ว"
           label.textColor = UIColor.white
           label.font = UIFont.BaiJamjureeBold(size: 25)
           label.numberOfLines = 0
           return label
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
            label.font = UIFont.BaiJamjureeRegular(size: 16)
            return label
    }()
    
    lazy var maxUser: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor.blackAlpha(alpha: 0.3)
        label.font = UIFont.BaiJamjureeMedium(size: 16)
        return label
    }()
    
    lazy var supportTime: UILabel = {
          let label = UILabel()
          label.text = "14 สิงหาคม 2562"
          label.textColor = UIColor.blackAlpha(alpha: 0.8)
          label.font = UIFont.BaiJamjureeRegular(size: 16)
          return label
    }()
    
    lazy var supportTime1: UILabel = {
          let label = UILabel()
          label.text = "14"
          label.textColor = UIColor.blackAlpha(alpha: 0.8)
          label.font = UIFont.BaiJamjureeRegular(size: 16)
          return label
    }()
    
    lazy var supportTime2: UILabel = {
          let label = UILabel()
          label.text = "2562"
          label.textColor = UIColor.blackAlpha(alpha: 0.8)
          label.font = UIFont.BaiJamjureeRegular(size: 16)
          return label
    }()
    
    let CheckPoint: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.rgb(red: 241, green: 90, blue: 66)
               button.layer.cornerRadius = 20/2
               button.tag = 0
               button.setTitle("ยังไม่ได้ประเมิน", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.BaiJamjureeMedium(size: 14)
               button.isEnabled = true
               button.addTarget(self, action: #selector(InviteActivityViewController.ClickUser), for: .touchUpInside)
               return button
    }()
    
    
    var decidePass: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.rgb(red: 70, green: 136, blue: 61)
               button.layer.cornerRadius = 20/2
               button.tag = 0
               button.setTitle("ประเมินแล้ว", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.BaiJamjureeMedium(size: 14)
               button.isEnabled = true
               button.isHidden = true
               return button
    }()
    
    @objc func ClickUser(){
    }
    
        func setupViewCell(){
          
            backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            bgActivitityBg.isHidden = true
            titleFullnameEnd.isHidden = true
            fullActivity.isHidden = true
            addSubview(profileImage)
            addSubview(bgActivitity)
            addSubview(recommend)
            addSubview(bgActivitityBg)
            addSubview(titleFullname)
            addSubview(fullActivity)
            addSubview(titleFullnameEnd)
            addSubview(line)
            addSubview(supportName)
            addSubview(supportTime)
            addSubview(supportTime1)
            addSubview(supportTime2)
            addSubview(CheckPoint)
            addSubview(decidePass)

            profileImage.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: supportName.bottomAnchor, topConstant: 5, bottomConstant: 15, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
            bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 150)

            bgActivitityBg.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)

            titleFullnameEnd.anchor(bgActivitityBg.topAnchor, left: nil, right: nil, bottom: bgActivitityBg.bottomAnchor, topConstant: 40, bottomConstant: 40, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 50)

            titleFullnameEnd.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true
            
            fullActivity.anchor(bgActivitityBg.topAnchor, left: nil, right: nil, bottom: bgActivitityBg.bottomAnchor, topConstant: 40, bottomConstant: 40, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 50)

            fullActivity.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true
                       
            
            recommend.anchor(bgActivitity.bottomAnchor, left:bgActivitity.leftAnchor, right:  nil, bottom: nil, topConstant: 22, bottomConstant: 0, leftConstant: 15, rightConstant: 0, widthConstant: 20, heightConstant: 20)
                       
            titleFullname.anchor(bgActivitity.bottomAnchor, left: recommend.rightAnchor, right: CheckPoint.leftAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 10, rightConstant: 5, widthConstant: 0, heightConstant: 0)

            titleFullname.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 160).isActive = true
                        
            CheckPoint.anchor(bgActivitity.bottomAnchor, left: titleFullname.rightAnchor, right:profileImage.rightAnchor, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 110, heightConstant: 30)
            
            decidePass.anchor(bgActivitity.bottomAnchor, left: titleFullname.rightAnchor, right:profileImage.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
            
            line.anchor(titleFullname.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1.1)
                     
            supportName.anchor(line.bottomAnchor, left: bgActivitity.leftAnchor, right: rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 80)
            
            
            supportTime1.anchor(line.bottomAnchor, left: nil, right: supportTime.leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 80)
            
            supportTime.anchor(line.bottomAnchor, left: nil, right: supportTime2.leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 80)
            
            supportTime2.anchor(line.bottomAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 80)

        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

