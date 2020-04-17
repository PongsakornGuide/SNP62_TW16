//
//  DetailActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 20/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class DetailActivityViewController: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupViewCell()
    }
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    lazy var pageView: UIView = {
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
        name.text = "asdsa"
        name.font = UIFont.BaiJamjureeBold(size: 16)
        name.numberOfLines = 0
        return name
     }()
     
     lazy var date : UILabel = {
           let timer = UILabel()
           timer.text = "9:34"
           timer.textColor = UIColor.blackAlpha(alpha: 0.5)
           timer.font = UIFont.BaiJamjureeRegular(size: 14)
           timer.numberOfLines = 0
           return timer
     }()
    
    
    lazy var comment:UILabel = {
        let comment = UILabel()
        comment.text = "Lorem Ipsum is simply dummy text of the printing."
        comment.textColor = UIColor.black
        comment.font =  UIFont.BaiJamjureeBold(size: 18)
        comment.numberOfLines = 0
        return comment
    }()
    
    
    lazy var imagePost: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "tenor")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 30/2
       return image
    }()
    
    lazy var contrainer: UIView = {
        let box = UIView()
        return box
    }()
    
    var iconImageLike: UIButton = {
              let imagelike = UIImage(named: "like") as UIImage?
              let image = UIButton(type: UIButton.ButtonType.system)
              image.tag = 0
              image.tintColor = .black
              image.setImage(imagelike, for: .normal)
              image.contentMode = .scaleAspectFill
              image.layer.masksToBounds = true
              image.addTarget(self, action: #selector(likePost), for: .touchUpInside)
              
              return image
    }()
    
    @objc func likePost(_sender:UIButton){
        
    }
    
    lazy var numCount: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.textColor = UIColor.blackAlpha(alpha: 0.5)
            label.font = UIFont.BaiJamjureeRegular(size: 20)
            label.numberOfLines = 0
            return label
    }()
    
    lazy var iconImageComment: UIButton = {
           let image = UIButton()
           let imagecomment = UIImage(named: "comment") as UIImage?
           image.setImage(imagecomment, for: .normal)
           image.contentMode = .scaleAspectFill
           image.layer.masksToBounds = true
           return image
       }()
       
    lazy var comCount: UILabel = {
               let label = UILabel()
               label.text = "0"
               label.textColor = UIColor.blackAlpha(alpha: 0.5)
               label.font = UIFont.BaiJamjureeRegular(size: 20)
               label.numberOfLines = 0
               return label
    }()
    
    lazy var lineLayout: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.blackAlpha(alpha: 0.1)
            return view
    }()

    lazy var typeLike: UILabel = {
               let label = UILabel()
               label.text = "ถูกใจ"
               label.textColor = UIColor.blackAlpha(alpha: 0.5)
               label.font = UIFont.BaiJamjureeRegular(size: 18)
               label.numberOfLines = 0
               return label
    }()
    lazy var typeCom: UILabel = {
                    let label = UILabel()
                    label.text = "คอมเม้นต์"
                    label.textColor = UIColor.blackAlpha(alpha: 0.5)
                    label.font = UIFont.BaiJamjureeRegular(size: 18)
                    label.numberOfLines = 0
                    return label
    }()

    
    func setupViewCell(){
        addSubview(pageView)
        addSubview(profile)
        addSubview(username)
        addSubview(date)
        addSubview(imagePost)
        addSubview(comment)
        addSubview(contrainer)
        addSubview(iconImageLike)
        addSubview(numCount)
        addSubview(typeLike)
        addSubview(iconImageComment)
        addSubview(comCount)
        addSubview(typeCom)
        addSubview(lineLayout)
        
        pageView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom:safeAreaLayoutGuide.bottomAnchor, topConstant: 15, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        profile.anchor(pageView.topAnchor, left: pageView.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 15, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        username.anchor(pageView.topAnchor, left: profile.rightAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 16, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        username.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 160).isActive = true
              
        
        date.anchor(username.bottomAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        comment.anchor(date.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 15, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        comment.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 100).isActive = true
        
        
        imagePost.anchor(comment.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant:230)
        
        
        iconImageLike.anchor(imagePost.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: nil, bottom: lineLayout.topAnchor, topConstant: 25, bottomConstant: 25, leftConstant: 20, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
//        numCount.anchor(imagePost.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: lineLayout.topAnchor, topConstant: 15, bottomConstant: 25, leftConstant: 40, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//
        numCount.anchor(imagePost.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: lineLayout.bottomAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 40, rightConstant: 10, widthConstant: 20, heightConstant: 30)
            
            
        typeLike.anchor(imagePost.bottomAnchor, left: numCount.rightAnchor, right: nil, bottom: lineLayout.bottomAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 30)
                
        
        lineLayout.anchor(iconImageLike.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: pageView.bottomAnchor, topConstant: 30, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1.5)
        
        iconImageComment.anchor(imagePost.bottomAnchor, left: nil, right: comCount.leftAnchor, bottom: lineLayout.topAnchor, topConstant: 25, bottomConstant: 25, leftConstant: 0, rightConstant: 10, widthConstant: 30, heightConstant: 30)
        
//        comCount.anchor(imagePost.bottomAnchor, left: nil, right: safeAreaLayoutGuide.rightAnchor, bottom: lineLayout.topAnchor, topConstant: 15, bottomConstant: 25, leftConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
//
        comCount.anchor(imagePost.bottomAnchor, left: nil, right: typeCom.leftAnchor, bottom: lineLayout.topAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 10, rightConstant: 0, widthConstant: 20, heightConstant: 30)
               
        typeCom.anchor(imagePost.bottomAnchor, left: nil, right: safeAreaLayoutGuide.rightAnchor, bottom: lineLayout.topAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
