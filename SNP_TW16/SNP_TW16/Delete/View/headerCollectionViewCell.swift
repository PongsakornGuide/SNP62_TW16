//
//  headerCollectionViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 11/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit

class headerCollectionViewCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCell()
    }
    
    func setupViewCell(){
        backgroundColor = .white
        
        addSubview(titleTextLabel)
        addSubview(viewAll)
        titleTextLabel.anchor(nil, left: leftAnchor, right: nil,bottom: bottomAnchor, topConstant: 0, bottomConstant: 10,leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        viewAll.anchor(nil, left: nil, right: rightAnchor,bottom: bottomAnchor, topConstant: 0, bottomConstant: 7,leftConstant: 0,rightConstant: 30, widthConstant: 0, heightConstant: 0)
  
    }
    
    let titleTextLabel: UILabel = {
           let label = UILabel()
           label.text = "กิจกรรมที่เป็นที่นิยม"
        label.textColor = UIColor.blackAlpha(alpha: 0.8)
        label.font = UIFont.PoppinsBold(size: 22)
           return label
       }()
    
    let viewAll: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("View All", for: .normal)
          button.setTitleColor(UIColor.blackAlpha(alpha: 0.5), for: .normal)
          button.titleLabel?.font = UIFont.PoppinsMedium(size: 14)
          return button
      }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
