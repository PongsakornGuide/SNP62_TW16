//
//  TextFieldTableViewCell.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 8/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import KMPlaceholderTextView
class  TextFieldTableViewCell :UITableViewCell,UITextFieldDelegate {
     
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
        let title = "อื่นๆ (โปรดระบุ)"
        let attributedText = NSMutableAttributedString(string: title,
                   attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        header.attributedText = attributedText
        header.numberOfLines = 2
        return header
    }()
    
    static var textView: KMPlaceholderTextView = {
        let textView = KMPlaceholderTextView()
         textView.textColor = UIColor.blackAlpha(alpha: 0.8)
         textView.font = UIFont.BaiJamjureeRegular(size: 16)
         textView.layer.borderColor = UIColor.blackAlpha(alpha: 0.3).cgColor
         textView.layer.borderWidth = 0.5
         textView.textColor = UIColor.lightGray
         textView.layer.cornerRadius = 5
         textView.placeholder = "เขียนข้อความ ..."
         textView.placeholderColor = UIColor.rgb(red: 167, green: 169, blue: 172)
         return textView
    }()
    
    var regButton : UIButton = {
         let submit = UIButton(type: UIButton.ButtonType.system)
         submit.backgroundColor = UIColor.rgb(red: 27, green: 71, blue: 147)
         submit.layer.cornerRadius = 15
         submit.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
         submit.layer.shadowOpacity = 0.2
         submit.layer.shadowOffset = CGSize(width: 0, height: 0)
         submit.layer.shadowRadius = 10
         submit.setTitle("เข้าร่วมกิจกรรม", for: .normal)
         submit.setTitleColor(UIColor.white,for: .normal)
         submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
         submit.addTarget(self, action: #selector(psuhCheckBox), for: .touchUpInside)
         return submit
    }()
    
       
    
    @objc func psuhCheckBox(){
    }
    
    func setLayout(){
        
        
        addSubview(bgActivitity)
        addSubview(headerText)
        addSubview(TextFieldTableViewCell.textView)
        addSubview(regButton)
        backgroundColor = .white
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        
        headerText.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 25)
        
        TextFieldTableViewCell.textView.anchor(headerText.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant:100)

        
        regButton.anchor(TextFieldTableViewCell.textView.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 70)
            
    }
            
}
