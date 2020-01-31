//
//  ConfirmTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ConfirmTableViewCell: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nextButton: UIButton = {
                    let button = UIButton(type: .system)
                    button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                    button.layer.cornerRadius = 20
                    button.setTitle("บันทึก", for: .normal)
                    button.setTitleColor(.white, for: .normal)
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                    button.addTarget(self, action: #selector(psuhCheckBox), for: .touchUpInside)
                    return button
    }()
   let BGView: UIView = {
          let view = UIView()
          return view
      }()
    
    @objc func psuhCheckBox(){
         }
    func setLayout(){
        addSubview(BGView)
        addSubview(nextButton)
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
        BGView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 120)
          nextButton.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 30, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 70)
    }
    
}
