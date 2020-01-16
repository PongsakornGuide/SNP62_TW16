//
//  PageViewController.swift
//  SNP_TW16
//
//  Created by Guide on 29/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class ActivityPageViewController: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let bgActivitity:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.rgb(red: 244, green: 241, blue: 230)
        background.layer.borderColor = UIColor.rgb(red: 244, green: 241, blue: 230).cgColor
        return background
    }()
    
    let header:UILabel = {
       let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 3
        title.text = "กิจกรรม รักษ์โลก \n เชิญชวนปลูกต้นไม้ ณ \n บริเวณท่าน้ำนนท์"
        title.font = UIFont.PoppinsBold(size: 28)
        title.textColor = UIColor.rgb(red: 66, green: 100, blue: 38)
        return title
    }()
    
    let backgroundImage:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "group")
       return image
    }()

    func setLayout(){
        addSubview(bgActivitity)
        addSubview(header)
        addSubview(backgroundImage)

        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)

        header.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 200)

        backgroundImage.anchor(header.bottomAnchor, left: header.leftAnchor, right: nil, bottom: bgActivitity.bottomAnchor, topConstant: -60, bottomConstant: 0, leftConstant: 200, rightConstant: 0, widthConstant: 0, heightConstant: 220)
    }
}
