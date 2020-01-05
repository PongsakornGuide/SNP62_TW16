//
//  PageViewController.swift
//  SNP_TW16
//
//  Created by Guide on 29/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class ActivityPageViewController: UITableViewCell {
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////        setup()
////    }
////
//           override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//             super.init(style: style, reuseIdentifier: reuseIdentifier)
//             setup()
//         }
//    func setup(){
//        backgroundColor = .red
//    }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let bgActivitity:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.blue
        background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
        return background
    }()

    func setLayout(){
        addSubview(bgActivitity)

        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 400)


    }
}
