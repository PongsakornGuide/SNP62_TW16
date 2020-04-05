//
//  titleDecideChoiceViwe.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 31/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class titleDecideChoiceViwe: UITableViewCell{
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                  super.init(style: style, reuseIdentifier: reuseIdentifier)
                  setLayout()
              }
         

             required init?(coder: NSCoder) {
                 fatalError("init(coder:) has not been implemented")
             }

             lazy var bgActivitity:UIView = {
                 let background = UIView()
                 background.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
                 return background
             }()
             
             
             lazy var titleHeader : UILabel = {
                            let label = UILabel()
                            let title = "โปรดเลือกสาเหตุเพื่อให้เรา \nเข้าใจถึงสิ่งที่เกิดในการจัด\nกิจกรรมครั้งนี้"
                            let attributedText = NSMutableAttributedString(string: title,
                            attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 25),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                            label.attributedText = attributedText
                            label.numberOfLines = 0
                            return label
             }()
          
            let line: UIView = {
                        let view = UIView()
                        view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                        return view
            }()


             func setLayout(){
          
                 addSubview(bgActivitity)
                 addSubview(line)
                 addSubview(titleHeader)
    
                bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

                 titleHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 40, bottomConstant: 40, leftConstant: 30, rightConstant: 20, widthConstant: 0, heightConstant: 0)
                
                line.anchor(titleHeader.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 30, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)
             }
}
