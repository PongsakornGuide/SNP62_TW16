//
//  CheckBoxTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class CheckBoxTableViewCell: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       lazy var bgCheck : UIView = {
               let image = UIImageView()
               return image
       }()
       
       lazy var bgImage : UIImageView = {
               let image = UIImageView()
               image.image = UIImage(named: "comment")
               image.contentMode = .scaleAspectFill
               image.layer.masksToBounds = true
               return image
       }()
       
       lazy var textHeader : UILabel = {
                   let label = UILabel()
                   let title = "check box"
                   let attributedText = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 28),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
                   label.attributedText = attributedText
                   label.textColor = .black
                   label.numberOfLines = 0
                   return label
       }()
    
       
       func setLayout(){
           addSubview(bgCheck)
           addSubview(bgImage)
           addSubview(textHeader)
           backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
           
           bgCheck.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 100, heightConstant: 100)

           bgImage.anchor(bgCheck.topAnchor, left: bgCheck.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 0, widthConstant: 90, heightConstant: 90)

           textHeader.anchor(bgCheck.topAnchor, left: bgImage.leftAnchor, right: bgCheck.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 130, rightConstant: 0, widthConstant: 50, heightConstant: 50)
           
       
       }
}
