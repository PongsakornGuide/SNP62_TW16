//
//  AcivityListTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
class AcivityListTableViewCell: UITableViewCell{
    
    var id_user = String()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCell()
    }
    
    lazy var pageView:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.red
        return background
    }()
    
    
    lazy var bgActivitity:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.white
        background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
        background.layer.shadowOpacity = 0.1
        background.layer.shadowOffset = CGSize(width: 0, height: 0)
        background.layer.shadowRadius = 10
        background.layer.shouldRasterize = true
        return background
    }()

    
    lazy var profileImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "tiko")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 60/2
       return image
    }()
    
    lazy var userFullname: UILabel = {
       let label = UILabel()
        label.text = "Dorothy Puscas"
         label.textColor = UIColor.black
         label.font = UIFont.PoppinsBold(size: 16)
         label.numberOfLines = 1
       return label
    }()
    
    lazy var messageTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing."
        label.textColor = UIColor.black
        label.font =  UIFont.PoppinsBold(size: 18)
        label.numberOfLines = 10
        return label
    }()
    
    lazy var timeTextLabel: UILabel = {
           let label = UILabel()
           label.text = "9:34"
           label.textColor = UIColor.blackAlpha(alpha: 0.5)
           label.font = UIFont.PoppinsRegular(size: 14)
           label.numberOfLines = 0
           return label
    }()
    
   
    
    lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "val-vesa-P0F_zH39qhs-unsplash")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    var iconImageLike: UIButton = {
               let Btn =  UIButton()
               Btn.tintColor = UIColor.blackAlpha(alpha: 1)
               Btn.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
               Btn.imageView?.contentMode = .scaleAspectFit
               Btn.tag = 0
               Btn.addTarget(self, action: #selector(likePost), for: .touchUpInside)
               return Btn
    }()
    
    @objc func likePost(_sender:UIButton){
    }
    
    
    lazy var iconImageComment: UIButton = {
        let image = UIButton()
        let imagecomment = UIImage(named: "comment") as UIImage?
        image.setImage(imagecomment, for: .normal)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var numCount: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor.blackAlpha(alpha: 0.5)
            label.font = UIFont.PoppinsRegular(size: 18)
            label.numberOfLines = 0
            return label
     }()
    
    lazy var typeLike: UILabel = {
               let label = UILabel()
               label.text = "ถูกใจ"
               label.textColor = UIColor.blackAlpha(alpha: 0.5)
               label.font = UIFont.PoppinsRegular(size: 18)
               label.numberOfLines = 0
               return label
    }()
    
    
    lazy var numCom: UILabel = {
           let label = UILabel()
           label.text = "0"
           label.textColor = UIColor.blackAlpha(alpha: 0.5)
           label.font = UIFont.PoppinsRegular(size: 18)
           label.numberOfLines = 0
           return label
    }()
    
    lazy var typeCom: UILabel = {
                 let label = UILabel()
                 label.text = "คอมเม้นต์"
                 label.textColor = UIColor.blackAlpha(alpha: 0.5)
                 label.font = UIFont.PoppinsRegular(size: 18)
                 label.numberOfLines = 0
                 return label
      }()
    
    lazy var postAct  : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.whiteAlpha(alpha: 0)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 300
        button.setTitle("โพส", for: .normal)
        button.setTitleColor(UIColor.whiteAlpha(alpha: 0.8), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.whiteAlpha(alpha: 0.8)
        return button
    }()
    
    func setupViewCell(){
            addSubview(bgActivitity)
            addSubview(profileImage)
            addSubview(userFullname)
            addSubview(messageTextLabel)
            addSubview(timeTextLabel)
            addSubview(postImage)
            addSubview(iconImageLike)
            addSubview(typeLike)
            addSubview(typeCom)
            addSubview(numCount)
            addSubview(iconImageComment)
            addSubview(numCom)
            addSubview(pageView)
        backgroundColor = UIColor.rgb(red: 247, green: 250, blue: 255)
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 450)
        
        profileImage.anchor(bgActivitity.topAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 0, widthConstant: 60, heightConstant: 60)
             
        userFullname.anchor(topAnchor, left: profileImage.rightAnchor, right: nil, bottom: nil, topConstant: 45, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        timeTextLabel.anchor(userFullname.bottomAnchor, left: profileImage.rightAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 15, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        messageTextLabel.anchor(timeTextLabel.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 50, widthConstant: 0, heightConstant: 50)
    
        postImage.anchor(messageTextLabel.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 200)
        
        iconImageLike.anchor(postImage.bottomAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 5, leftConstant: 20, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        numCount.anchor(postImage.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 5, leftConstant: 40, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
         typeLike.anchor(postImage.bottomAnchor, left: numCount.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 5, leftConstant: 20, rightConstant: 0, widthConstant: 60, heightConstant: 30)
        
        iconImageComment.anchor(postImage.bottomAnchor, left: nil, right: numCom.leftAnchor, bottom: nil, topConstant: 25, bottomConstant: 5, leftConstant: 0, rightConstant: 12, widthConstant: 30, heightConstant: 30)
        
        numCom.anchor(postImage.bottomAnchor, left: nil, right: typeCom.leftAnchor, bottom: nil, topConstant: 25, bottomConstant: 15, leftConstant: 0, rightConstant: -10, widthConstant: 30, heightConstant: 30)
        
        typeCom.anchor(postImage.bottomAnchor, left: nil, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 5, leftConstant: 0, rightConstant: 16, widthConstant: 80, heightConstant: 30)
               
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
