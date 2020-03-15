//
//  DecideViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 26/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DecideViewCell: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {

    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var bgActivitity:UIView = {
         let background = UIView()
         return background
     }()
    
    lazy var headerText : UILabel = {
        let header = UILabel()
        let title = "โปรดเลือกคำตอบก่อนเข้าร่วมกิจกรรม"
        let attributedText = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 25),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        header.attributedText = attributedText
        header.numberOfLines = 2
        return header
    }()
    
    lazy var titleText : UILabel = {
          let header = UILabel()
          let title = "ท่านคาดหวังอะไรกับกิจกรรมนี้"
          let attributedText = NSMutableAttributedString(string: title,
                     attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
          header.attributedText = attributedText
          header.numberOfLines = 0
          header.textColor = .red
          return header
    }()
    
    lazy var alertText : UILabel = {
          let header = UILabel()
          let title = "*เลือกได้มากกว่า 1 ข้อ"
          let attributedText = NSMutableAttributedString(string: title,
                     attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 17),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
          header.attributedText = attributedText
          header.numberOfLines = 0
        header.textColor = UIColor.rgb(red: 241, green: 90, blue: 66)
          return header
    }()

    func setLayout(){
        addSubview(bgActivitity)
        addSubview(headerText)
        addSubview(titleText)
        addSubview(alertText)
        backgroundColor = .white
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        headerText.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 0)
         
        headerText.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true

        titleText.anchor(headerText.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        
        titleText.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
        alertText.anchor(titleText.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        
        alertText.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
    }
            
}
