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
    
    lazy var IdUser : UILabel = {
       let name = UILabel()
       return name
    }()
    
    lazy var bgActivitity:UIView = {
        let background = UIView()
        return background
    }()

    lazy var contrainer:UIView = {
       let view = UIView()
//        view.backgroundColor = .purple
        return view
    }()
    
    lazy var profile: UIImageView = {
       let image = UIImageView()
          image.image = UIImage(named: "tiko")
               image.contentMode = .scaleAspectFill
               image.layer.masksToBounds = true
               image.layer.cornerRadius = 60/2
       return image
    }()
    
    lazy var username : UILabel = {
       let name = UILabel()
       name.text = "Pongsakorn"
        name.font = UIFont.PoppinsBold(size: 16)
       return name
    }()
    
    lazy var date : UILabel = {
          let timer = UILabel()
          timer.text = "12 ตุลาคม 2562 เวลา 15: 20"
          timer.font = UIFont.PoppinsMedium(size: 12)
          timer.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
          return timer
    }()
    
    lazy var contrainerComment:UIView = {
           let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 236, green: 243, blue: 253)
            view.layer.cornerRadius = 20/2
            return view
    }()
    
    
    lazy var comment:UILabel = {
             let comment = UILabel()
             comment.text = "สวัสดีวันจันทร์นะคะ คุณสมเกียรติ"
             comment.font = UIFont.PoppinsMedium(size: 16)
             comment.textColor = UIColor.black
             return comment
     }()
    
    
    lazy var imagePost: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "sam")
        image.contentMode = .scaleAspectFill
       return image
    }()

    
    var iconImageLike: UIButton = {
            let imagelike = UIImage(named: "like") as UIImage?
            let image = UIButton()
            image.setImage(imagelike, for: .normal)
            image.contentMode = .scaleAspectFill
            image.layer.masksToBounds = true
            image.tag = 0
            image.addTarget(self, action: #selector(likeComment), for: .touchUpInside)
            return image
    }()
    
    lazy var numCount: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor.red
            label.font = UIFont.PoppinsBold(size: 12)
            label.numberOfLines = 0
            return label
    }()
    @objc func likeComment(_sender:UIButton){
        
    }
    
    func setupViewCell(){
        addSubview(bgActivitity)
        addSubview(contrainer)
        addSubview(contrainerComment)
        addSubview(profile)
        addSubview(username)
        addSubview(date)
        addSubview(comment)
        addSubview(iconImageLike)
        addSubview(numCount)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 20, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 60, heightConstant: 120)
        
        contrainer.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 5, rightConstant: 0, widthConstant: 70, heightConstant: 100)
//
        profile.anchor(contrainer.topAnchor, left: contrainer.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
//
        contrainerComment.anchor(contrainer.topAnchor, left: profile.rightAnchor, right: contrainer.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 90)
        
        username.anchor(contrainerComment.topAnchor, left: contrainerComment.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        date.anchor(contrainerComment.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        comment.anchor(username.bottomAnchor, left: contrainerComment.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 40)

        numCount.anchor(contrainerComment.bottomAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        iconImageLike.anchor(contrainerComment.bottomAnchor, left: nil, right: numCount.leftAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 20, heightConstant: 20)

    }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
}
