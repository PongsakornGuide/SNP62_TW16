//
//  layoutTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 26/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class layoutTableViewCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bgCheck : UIView = {
            let image = UIImageView()
                 image.backgroundColor = UIColor.white
                 image.layer.cornerRadius = 20
                 image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                 image.layer.shadowOpacity = 0.1
                 image.layer.shadowOffset = CGSize(width: 0, height: 0)
                 image.layer.shadowRadius = 10
                 image.layer.shouldRasterize = true
            return image
    }()
    
    let bgImage : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "comment")
            image.contentMode = .scaleAspectFill
            image.layer.masksToBounds = true
            return image
    }()
    
    let textHeader : UILabel = {
                let label = UILabel()
                let title = "check box"
                let attributedText = NSMutableAttributedString(string: title,
                attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 25),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
    }()
 
    func setLayout(){
        addSubview(bgCheck)
        addSubview(bgImage)
        addSubview(textHeader)
        backgroundColor = .white
        
        bgCheck.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 20, widthConstant: 100, heightConstant: 120)

        bgImage.anchor(bgCheck.topAnchor, left: bgCheck.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 20, leftConstant: 20, rightConstant: 0, widthConstant: 90, heightConstant: 90)

        textHeader.anchor(bgCheck.topAnchor, left: bgImage.rightAnchor, right: nil, bottom: bgCheck.bottomAnchor, topConstant: 35, bottomConstant: 30, leftConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant:0)
        
    }
}

