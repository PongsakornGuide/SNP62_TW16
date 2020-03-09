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
         bg.layer.shouldRasterize = true
         return bg
      }()
      
    lazy var titleLabel : UILabel = {
         let title = UILabel()
          title.text = "เพิ่มเบอร์ฉุกเฉินเบอร์อื่นๆ .."
          title.font = UIFont.PoppinsBold(size: 20)
          title.textColor = UIColor.rgb(red: 33, green: 64, blue: 154)
          return title
      }()
    
    var btnCell : UIButton = {
        let bg = UIButton(type: .system)
        bg.setTitle("+", for: .normal)
        bg.titleLabel?.font = UIFont.PoppinsMedium(size: 65)
        bg.setTitleColor(UIColor.rgb(red: 33, green: 64, blue: 154), for: .normal)
        bg.addTarget(self, action: #selector(addTelUserRelative), for: .touchUpInside)
        return bg
    }()
    
    @objc func addTelUserRelative(){
//        print("555")
    }
    
    func setLayout(){
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        addSubview(bgActivitity)
        addSubview(bgEmergency)
        addSubview(titleLabel)
        addSubview(btnCell)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 100)
        
        bgEmergency.anchor(bgActivitity.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 80)
        
        
        titleLabel.anchor(bgEmergency.topAnchor, left: bgEmergency.leftAnchor, right: btnCell.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 25, rightConstant: 25, widthConstant: 0, heightConstant: 0)
        
        btnCell.anchor(bgEmergency.topAnchor, left: nil, right: rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 25, leftConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 30)
    
    }
}
