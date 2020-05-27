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
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    
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
        name.font = UIFont.BaiJamjureeBold(size: 16)
       return name
    }()
    
    lazy var date : UILabel = {
          let timer = UILabel()
          timer.text = "12 ตุลาคม 2562 เวลา 15: 20"
          timer.font = UIFont.BaiJamjureeRegular(size: 12)
          timer.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
          return timer
    }()
    
    lazy var contrainerComment:UIView = {
           let view = UIView()
           view.layer.cornerRadius = 20/2
           view.layer.backgroundColor = UIColor.rgb(red: 247, green: 250, blue: 255).cgColor
           return view
    }()
    
    
    lazy var comment:UILabel = {
             let comment = UILabel()
             comment.text = "สวัสดีวันจันทร์นะคะ คุณสมเกียรติ"
             comment.font = UIFont.BaiJamjureeMedium(size: 16)
             comment.textColor = UIColor.black
             comment.numberOfLines = 0
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
            let image = UIButton(type: UIButton.ButtonType.system)
            image.setImage(imagelike, for: .normal)
            image.contentMode = .scaleAspectFill
            image.layer.masksToBounds = true
            image.tintColor = .black
            image.tag = 0
            image.addTarget(self, action: #selector(likeComment), for: .touchUpInside)
            return image
    }()
    
    lazy var numCount: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor.red
            label.font = UIFont.BaiJamjureeBold(size: 14)
            label.numberOfLines = 0
            return label
    }()
    
    var iconOther: UIButton = {
           let image = UIButton(type: UIButton.ButtonType.system)
           let imagecomment = UIImage(named: "other") as UIImage?
           image.setImage(imagecomment, for: .normal)
           image.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
           image.contentMode = .scaleAspectFill
           image.layer.masksToBounds = true
           image.isHidden = true
           image.tag = 0
           image.addTarget(self, action: #selector(InputCommentViewController.actionOther), for: .touchUpInside)
           return image
       }()
    
    @objc func likeComment(_sender:UIButton){
        
    }
    
    func setupViewCell(){
        addSubview(bgActivitity)
        addSubview(iconOther)
        addSubview(contrainer)
        addSubview(contrainerComment)
        addSubview(profile)
        addSubview(username)
        addSubview(date)
        addSubview(comment)
        addSubview(iconImageLike)
        addSubview(numCount)
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        iconOther.anchor(contrainerComment.topAnchor, left: nil , right: bgActivitity.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 30, heightConstant: 30)

        
        profile.anchor(contrainerComment.topAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 10, rightConstant: 0, widthConstant: 60, heightConstant: 60)

       
        
        contrainerComment.anchor(bgActivitity.topAnchor, left: profile.rightAnchor, right: iconOther.leftAnchor, bottom: date.topAnchor, topConstant: 20, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)


        username.anchor(contrainerComment.topAnchor, left: contrainerComment.leftAnchor, right: contrainerComment.rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        username.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 160).isActive = true

        comment.anchor(username.bottomAnchor, left: contrainerComment.leftAnchor, right: contrainerComment.rightAnchor, bottom: contrainerComment.bottomAnchor, topConstant: 10, bottomConstant: 15, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)

        comment.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 160).isActive = true


        date.anchor(contrainerComment.bottomAnchor, left: bgActivitity.leftAnchor, right: nil, bottom: bgActivitity.bottomAnchor, topConstant: 10, bottomConstant: 20, leftConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        numCount.anchor(contrainerComment.bottomAnchor, left: nil, right: contrainerComment.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 10, bottomConstant: 20, leftConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        iconImageLike.anchor(contrainerComment.bottomAnchor, left: nil, right: numCount.leftAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 10, bottomConstant: 20, leftConstant: 0, rightConstant: 10, widthConstant: 20, heightConstant: 30)

    }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
}
