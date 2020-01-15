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
    
     let pageView: UIView = {
        let view = UIView()
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
        name.text = "asdsa"
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
               comment.text = "สวัสดีวันจันทร์แสนสดใส "
               comment.font = UIFont.PoppinsMedium(size: 18)
               comment.textColor = UIColor.black
               return comment
    }()
    
    
    let imagePost: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "tenor")
        image.contentMode = .scaleAspectFill
       return image
    }()
    
    let contrainer: UIView = {
        let box = UIView()
        return box
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
    
    let buttomComment : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitle("Summit", for: .normal)
        btn.setTitleColor(UIColor.white,for: .normal)
        return btn
    }()

    
    func setupViewCell(){
        addSubview(buttomComment)
        addSubview(pageView)
        addSubview(profile)
        addSubview(username)
        addSubview(date)
        addSubview(imagePost)
        addSubview(comment)
        addSubview(contrainer)
        addSubview(iconImageLike)
        addSubview(numCount)
        
        pageView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom:bottomAnchor, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: screenSizeY - 340)
        
        
        profile.anchor(pageView.topAnchor, left: pageView.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 0, widthConstant: 70, heightConstant: 60)
             
        username.anchor(pageView.topAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 0, widthConstant: 0, heightConstant: 20)
             
        date.anchor(username.bottomAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 0, widthConstant: 0, heightConstant: 20)
             
    
        comment.anchor(date.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 40)
  
        imagePost.anchor(comment.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 80, bottomConstant: 20, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant:100)
        
        contrainer.anchor(imagePost.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: pageView.bottomAnchor, topConstant: 100, bottomConstant: 20, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 40)
        
        iconImageLike.anchor(contrainer.topAnchor, left: contrainer.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 30, heightConstant: 30)
            
        
        numCount.anchor(contrainer.topAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 60, rightConstant: 10, widthConstant: 40, heightConstant: 40)

        buttomComment.anchor(pageView.topAnchor, left:nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 130)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
