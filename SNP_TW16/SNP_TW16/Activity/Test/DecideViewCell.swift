//
//  DecideViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 26/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DecideViewCell: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let bgActivitity:UIView = {
         let background = UIView()
         return background
     }()
    
    let headerText : UILabel = {
        let header = UILabel()
        let title = "โปรดเลือกคำตอบก่อนเข้าร่วมกิจกรรม"
        let attributedText = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        header.attributedText = attributedText
        header.numberOfLines = 2
        return header
    }()
    
    let titleText : UILabel = {
          let header = UILabel()
          let title = "ท่านคาดหวังอย่างไรกับกิจกรรมนี้"
          let attributedText = NSMutableAttributedString(string: title,
                     attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 17),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
          header.attributedText = attributedText
          header.numberOfLines = 0
          header.textColor = .red
          return header
    }()
    
    let alertText : UILabel = {
          let header = UILabel()
          let title = "*เลือกได้มากกว่า 1 ข้อ"
          let attributedText = NSMutableAttributedString(string: title,
                     attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 17),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
          header.attributedText = attributedText
          header.numberOfLines = 0
        header.textColor = .red
          return header
    }()

    func setLayout(){
        addSubview(bgActivitity)
        addSubview(headerText)
        addSubview(titleText)
        addSubview(alertText)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 190)
        
        headerText.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 30)

        titleText.anchor(headerText.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 30)
        
        alertText.anchor(titleText.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 30)
    }
            
}
