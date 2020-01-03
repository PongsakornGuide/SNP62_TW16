//
//  ImageCell4.swift
//  SNP_TW16
//
//  Created by Guide on 12/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class ImageCell4: UICollectionViewCell {
     override init(frame: CGRect) {
           super.init(frame: frame)
           setupViewCell()
       }
       
       var items: Items3? {
           didSet{
            
               guard let image = items?.itemImage else { return }
               itemImage.image = UIImage(named: image[0])
                guard let image1 = items?.itemImage1 else { return }
                itemImage1.image = UIImage(named: image1[0])
               itemCategory.text = items?.itemCategory
             itemName.text = items?.itemName
                itemTime.text = items?.itemTime
           }
       }
       
       let itemImageBackgroundShadow: UIView = {
           let view = UIView()
           view.layer.cornerRadius = 10
           view.layer.shadowColor = UIColor.black.cgColor
           view.layer.shadowOffset = .zero
          view.backgroundColor = .white
           view.layer.shadowRadius = 10
           view.layer.shadowOpacity = 0.2
            view.layer.shadowOffset = CGSize(width: -1, height: 3)
           return view
       }()
    
  
    let itemImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "pete-bellis-388531-unsplash")
            image.contentMode = .scaleAspectFit
            image.layer.masksToBounds = true
            image.layer.cornerRadius = 10
         
            return image
        }()
    
    let itemImage1: UIImageView = {
               let image = UIImageView()
               image.image = UIImage(named: "pete-bellis-388531-unsplash")
               image.contentMode = .scaleAspectFit
               image.layer.masksToBounds = true
               image.layer.cornerRadius = 10
            
               return image
           }()
    
       let itemCategory: UILabel = {
           let label = UILabel()
            let text = "โปรดใส่เบอร์มือถือสำหรับการลงทะเบียน"
            
            let attributedText = NSMutableAttributedString(string: text,
             attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.blackAlpha(alpha: 0.9)])
        
        label.attributedText = attributedText
           label.numberOfLines = 0
           return label
       }()
    
    let itemName: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing"
        label.textColor = UIColor.blackAlpha(alpha: 0.7)
        label.font = UIFont.PoppinsMedium(size: 16)
        label.numberOfLines = 3
        return label
    }()
    
    
    let itemTime: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing"
        label.textColor = UIColor.blackAlpha(alpha: 0.8)
        label.font = UIFont.PoppinsMedium(size: 16)
        label.numberOfLines = 3
        return label
    }()
       

       func setupViewCell(){
           
            addSubview(itemImageBackgroundShadow)
            itemImageBackgroundShadow.addSubview(itemCategory)
            itemImageBackgroundShadow.addSubview(itemImage)
        itemImageBackgroundShadow.addSubview(itemImage1)
        itemImageBackgroundShadow.addSubview(itemName)
                  itemImageBackgroundShadow.addSubview(itemTime)
           
        
        
        itemImage1.anchor(itemImageBackgroundShadow.topAnchor, left: itemImageBackgroundShadow.leftAnchor, right: nil,bottom: nil,  topConstant: -40, bottomConstant: 0,leftConstant: -10,  rightConstant: 0, widthConstant: 0, heightConstant: 0)
               
        
        itemImage.anchor(itemImageBackgroundShadow.topAnchor, left: itemImageBackgroundShadow.leftAnchor, right: nil,bottom: nil,  topConstant: -30, bottomConstant: 0,leftConstant: -30,  rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
            itemImageBackgroundShadow.anchor(topAnchor, left: leftAnchor,right: rightAnchor,bottom: nil,  topConstant: 40, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 180)
         
        itemCategory.anchor(itemImageBackgroundShadow.topAnchor, left:itemImage.leftAnchor, right: rightAnchor,bottom: nil,  topConstant: 25 ,bottomConstant: 0, leftConstant: 170, rightConstant: 0, widthConstant: 0, heightConstant: 0)
       
           itemName.anchor(itemCategory.bottomAnchor, left: leftAnchor, right: rightAnchor,bottom: nil,  topConstant: 15 ,bottomConstant: 0, leftConstant: 150, rightConstant: 50, widthConstant: 0, heightConstant: 0)
        
        itemTime.anchor(itemName.bottomAnchor, left: leftAnchor, right: rightAnchor,bottom: nil,  topConstant: 10 ,bottomConstant: 0, leftConstant: 150, rightConstant: 50, widthConstant: 0, heightConstant: 0)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
    
}



