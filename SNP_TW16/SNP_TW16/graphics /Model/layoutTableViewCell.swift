//
//  layoutTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 26/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class layoutTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bgCheck : UIView = {
            let image = UIImageView()
        
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
                attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 25),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                label.attributedText = attributedText
                label.textColor = .black
                label.numberOfLines = 0
                return label
    }()
 

    
    func setLayout(){
        addSubview(bgCheck)
        addSubview(bgImage)
        addSubview(textHeader)
        
        bgCheck.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 20, rightConstant: 0, widthConstant: 100, heightConstant: 80)

        bgImage.anchor(bgCheck.topAnchor, left: bgCheck.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 0, widthConstant: 80, heightConstant: 80)

        textHeader.anchor(bgCheck.topAnchor, left: bgImage.leftAnchor, right: bgCheck.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 95, rightConstant: 0, widthConstant: 50, heightConstant:80)
        
    
    }
}

