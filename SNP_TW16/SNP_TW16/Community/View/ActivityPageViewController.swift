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


    lazy var bgActivitity:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "group1531")
        return image
    }()
    
    lazy var header:UILabel = {
       let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont.BaiJamjureeBold(size: 25)
        title.textColor = UIColor.rgb(red: 66, green: 100, blue: 38)
        title.numberOfLines = 5
        title.text = "กิจกรรม รักษ์โลก \nเชิญชวนปลูกต้นไม้ \nณ บริเวณท่าน้ำนนท์"
        return title
    }()
    


    func setLayout(){
        addSubview(bgActivitity)
//        addSubview(header)

        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 170)

//        header.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 120)

    }
}
