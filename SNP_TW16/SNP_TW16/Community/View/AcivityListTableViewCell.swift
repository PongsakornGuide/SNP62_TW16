//
//  AcivityListTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class AcivityListTableViewCell: UITableViewCell{
    
    
    var id_user = String()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCell()
    }
    
    let pageView:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.red
        return background
    }()
    
    
    let bgActivitity:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.white
        background.layer.cornerRadius = 30
        background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
        background.layer.shadowOpacity = 0.1
        background.layer.shadowOffset = CGSize(width: 0, height: 0)
        background.layer.shadowRadius = 10
        background.layer.shouldRasterize = true
        return background
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "petr")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 70/2
        return image
    }()
    
    let userFullname: UILabel = {
       let label = UILabel()
         label.text = "Dorothy Puscas"
               label.textColor = UIColor.black
               label.font = UIFont.PoppinsMedium(size: 18)
               label.numberOfLines = 1
       return label
    }()
    
    let messageTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing."
        label.textColor = UIColor.blackAlpha(alpha: 0.5)
        label.font = UIFont.PoppinsRegular(size: 16)
        label.numberOfLines = 10
        return label
    }()
    
    let timeTextLabel: UILabel = {
           let label = UILabel()
           label.text = "9:34"
           label.textColor = UIColor.blackAlpha(alpha: 0.5)
           label.font = UIFont.PoppinsRegular(size: 14)
           label.numberOfLines = 0
           return label
    }()
    
   
    
    let postImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "val-vesa-P0F_zH39qhs-unsplash")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 50/2
        return image
    }()
    
    let iconImageLike: UIButton = {
        let imagelike = UIImage(named: "like") as UIImage?
        let image = UIButton()
        image.setImage(imagelike, for: .normal)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.addTarget(self, action: #selector(likePost), for: .touchUpInside)
        return image
    }()
    
    @objc func likePost(){
        iconImageLike.backgroundColor = .red
    }
    
    
    let iconImageComment: UIButton = {
        let image = UIButton()
        let imagecomment = UIImage(named: "comment") as UIImage?
        image.setImage(imagecomment, for: .normal)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    let numCount: UILabel = {
            let label = UILabel()
            label.text = "2"
            label.textColor = UIColor.blackAlpha(alpha: 0.5)
            label.font = UIFont.PoppinsRegular(size: 18)
            label.numberOfLines = 0
            return label
     }()
    
    
    let numCom: UILabel = {
           let label = UILabel()
           label.text = "10"
           label.textColor = UIColor.blackAlpha(alpha: 0.5)
           label.font = UIFont.PoppinsRegular(size: 18)
           label.numberOfLines = 0
           return label
    }()
    
    let postAct  : UIButton = {
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
        addSubview(numCount)
        addSubview(iconImageComment)
        addSubview(numCom)
        addSubview(pageView)
        
//        addSubview(hoverLike)
        
        
        bgActivitity.anchor(safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 30, bottomConstant: 30, leftConstant: 30, rightConstant: 30, widthConstant: 60, heightConstant: 530)
        
        profileImage.anchor(bgActivitity.topAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 50, rightConstant: 0, widthConstant: 80, heightConstant: 80)
             
        userFullname.anchor(topAnchor, left: profileImage.rightAnchor, right: nil, bottom: nil, topConstant: 60, bottomConstant: 0, leftConstant: 15, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        timeTextLabel.anchor(userFullname.bottomAnchor, left: profileImage.rightAnchor, right: rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 15, rightConstant: 20, widthConstant: 0, heightConstant: 0)


        messageTextLabel.anchor(timeTextLabel.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
      
        postImage.anchor(messageTextLabel.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 30, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 250)
        
        iconImageLike.anchor(postImage.bottomAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 30, leftConstant: 60, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        numCount.anchor(postImage.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 38, leftConstant: 40, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        iconImageComment.anchor(postImage.bottomAnchor, left: numCount.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 38, leftConstant: 160, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        numCom.anchor(postImage.bottomAnchor, left: iconImageComment.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 38, leftConstant: 40, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
