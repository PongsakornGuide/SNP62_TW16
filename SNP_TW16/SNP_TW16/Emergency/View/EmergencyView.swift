//
//  EmergencyView.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class EmergencyView: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setLayout()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let bgActivitity:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        return background
    }()
    
    let bgImage : UIImageView = {
                  let image = UIImageView()
                  image.image = UIImage(named: "Intersection 4")
                  image.contentMode = .scaleAspectFill
                  image.layer.masksToBounds = true
                  return image
    }()
    
    let textHeader : UILabel = {
                let label = UILabel()
                let title = "ต้องการความช่วยเหลือ"
                let text = "\nโทรด่วน"
                let attributedText = NSMutableAttributedString(string: title,
                attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 30),NSMutableAttributedString.Key.foregroundColor : UIColor.white])

                attributedText.append(NSMutableAttributedString(string: text,attributes: [NSMutableAttributedString.Key.font : UIFont.PoppinsBold(size: 40),NSMutableAttributedString.Key.foregroundColor: UIColor.white]))

                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
    }()
    
    let btnEmergency : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("โทรด่วน", for: .normal)
        btn.titleLabel?.font = UIFont.PoppinsBold(size: 30)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 95
        btn.layer.shadowOpacity = 0.1
        btn.layer.shadowRadius = 10
        btn.layer.shouldRasterize = true
//        btn.addTarget(self, action: #selector(call), for: .touchUpInside)
        return btn
    }()

    
    
    let lineborder : UIView = {
        let line = UIView()
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor.red.cgColor
        line.layer.cornerRadius = 85
        line.layer.shadowOpacity = 0.1
        line.layer.shadowRadius = 10
        line.layer.shouldRasterize = true
        return line
    }()
    
    let titleLabel : UILabel = {
              let label = UILabel()
              let title = "ติดต่อญาติทันทีเพียงแค่กดปุ่ม"
                let style = NSMutableParagraphStyle()
             style.alignment = NSTextAlignment.center
        
             let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 24),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 33, green: 64, blue: 154)])
             label.attributedText = attributedText
             label.numberOfLines = 0
              return label
    }()

    func setLayout(){
        addSubview(bgActivitity)
        addSubview(bgImage)
        addSubview(textHeader)
        addSubview(btnEmergency)
        addSubview(titleLabel)
        addSubview(lineborder)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 450)

        bgImage.anchor(bgActivitity.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        textHeader.anchor(bgImage.topAnchor, left: bgImage.leftAnchor, right: bgImage.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        btnEmergency.anchor(bgImage.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: -50, bottomConstant: 0, leftConstant: 90, rightConstant: 90, widthConstant: 100, heightConstant: 190)
        
        lineborder.anchor(btnEmergency.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 100, widthConstant: 0, heightConstant: 170)

        titleLabel.anchor(btnEmergency.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 100)

    }
}
