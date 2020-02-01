//
//  TitleTableVIiewCellTest.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TitleTableVIiewCellTest:UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
     
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       let bgActivitity:UIImageView = {
            let background = UIImageView()
            background.image = UIImage(named: "Step3")
            background.contentMode = .scaleAspectFill
            background.layer.masksToBounds = true
            return background
        }()

       func setLayout(){
           addSubview(bgActivitity)
           backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
           bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 120)
       }
}
