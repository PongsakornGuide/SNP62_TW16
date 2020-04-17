//
//  ChoiceCommitView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 1/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ChoiceCommitView: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nextButton: UIButton = {
                    let button = UIButton(type: .system)
                    button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                    button.layer.cornerRadius = 12
                    button.setTitle("ส่งคำตอบ", for: .normal)
                    button.setTitleColor(.white, for: .normal)
                    button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
                    button.addTarget(self, action: #selector(pushCheckBox), for: .touchUpInside)
                    return button
    }()
   lazy var BGView: UIView = {
          let view = UIView()
          return view
      }()
    
    @objc func pushCheckBox(){
         }
    func setLayout(){
        addSubview(BGView)
        addSubview(nextButton)
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
        BGView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        nextButton.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 10, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 60)
    }
    
}
