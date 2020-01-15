//
//  CommentTableView.swift
//  SNP_TW16
//
//  Created by Guide on 11/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class CommentTableView: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupViewCell()
    }
    
   
    
    let bgActivitity:UIView = {
        let background = UIView()
        return background
    }()
    
    let contrainer:UIView = {
       let view = UIView()
//        view.backgroundColor = .red
        return view
    }()
    
    let profile: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "tiko")
        image.contentMode = .scaleAspectFill
       return image
    }()
    
    let username : UILabel = {
       let name = UILabel()
       name.text = "Pongsakorn"
        name.font = UIFont.PoppinsBold(size: 18)
       return name
    }()
    
    let date : UILabel = {
          let timer = UILabel()
          timer.text = "12 ตุลาคม 2562 เวลา 15: 20"
          timer.font = UIFont.PoppinsMedium(size: 14)
          timer.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
          return timer
    }()
    
    let comment:UILabel = {
            let comment = UILabel()
            comment.text = "สวัสดีวันจันทร์นะคะ คุณสมเกียรติ"
            comment.font = UIFont.PoppinsMedium(size: 18)
            comment.textColor = UIColor.black
            return comment
    }()
    
    
    let imagePost: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "sam")
        image.contentMode = .scaleAspectFill
       return image
    }()

    
      let iconImageLike: UIButton = {
            let imagelike = UIImage(named: "like") as UIImage?
            let image = UIButton()
            image.setImage(imagelike, for: .normal)
            image.contentMode = .scaleAspectFill
            image.layer.masksToBounds = true
            return image
    }()
    
    let numCount: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor.blackAlpha(alpha: 0.5)
            label.font = UIFont.PoppinsRegular(size: 20)
            label.numberOfLines = 0
            return label
    }()
    
    func setupViewCell(){
        addSubview(bgActivitity)
        addSubview(contrainer)
        addSubview(profile)
        addSubview(username)
        addSubview(date)
        addSubview(comment)
        addSubview(iconImageLike)
        addSubview(numCount)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 60, heightConstant: 200)
        
        contrainer.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 5, rightConstant: 0, widthConstant: 70, heightConstant: 100)
//
        profile.anchor(contrainer.topAnchor, left: contrainer.leftAnchor, right: nil, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 55, heightConstant: 20)
//
        username.anchor(contrainer.topAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        date.anchor(username.bottomAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 20)
//
        comment.anchor(contrainer.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 40)

        iconImageLike.anchor(comment.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 10, rightConstant: 10, widthConstant: 30, heightConstant: 30)

        numCount.anchor(comment.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 40, rightConstant: 10, widthConstant: 20, heightConstant: 20)
        
//             numCount.anchor(contrainer.topAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 10, leftConstant: 60, rightConstant: 10, widthConstant: 40, heightConstant: 40)
        
    }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
}
