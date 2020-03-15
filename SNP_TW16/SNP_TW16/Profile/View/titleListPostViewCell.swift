//
//  titleListPostViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 31/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class titleListPostViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bgActivitity:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
        return background
    }()
    
    lazy var titleHeader : UILabel = {
                   let label = UILabel()
                   let title = "โพสต์ของฉัน"
                   let attributedText = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                   label.attributedText = attributedText
                   label.numberOfLines = 0
                   return label
    }()
    
    

    func setLayout(){
        
        addSubview(bgActivitity)
        addSubview(titleHeader)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 100)
        
        titleHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 40, widthConstant: 0, heightConstant: 0)
    }
}
