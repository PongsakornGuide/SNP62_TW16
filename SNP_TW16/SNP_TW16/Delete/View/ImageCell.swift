//
//  ImageCell.swift
//  SNP_TW16
//
//  Created by Guide on 11/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class ImageCell: UICollectionViewCell {
     override init(frame: CGRect) {
           super.init(frame: frame)
           setupViewCell()
       }
       
       var items: Items? {
           didSet{
               
               guard let image = items?.itemImage else { return }
               
               itemImage.image = UIImage(named: image[0])
               itemCategory.text = items?.itemCategory
    
           }
       }
       
       let itemImageBackgroundShadow: UIView = {
           let view = UIView()
           view.layer.cornerRadius = 25
           view.layer.shadowColor = UIColor.black.cgColor
           view.layer.shadowOffset = .zero
           view.layer.shadowRadius = 25
           view.backgroundColor = .white
           view.layer.shadowOpacity = 0.2
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
       
       let itemCategory: UILabel = {
           let label = UILabel()
           let text = "กิจกรรม"
               let style = NSMutableParagraphStyle()
               style.alignment = NSTextAlignment.center
           
               let attributedText = NSMutableAttributedString(string: text,
                   attributes: [NSAttributedString.Key.paragraphStyle:style,NSAttributedString.Key.font : UIFont.PoppinsBold(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.blackAlpha(alpha: 0.9)])
           

           label.attributedText = attributedText
              label.numberOfLines = 0
           return label
       }()
       
     
       
       func setupViewCell(){
           
           addSubview(itemImageBackgroundShadow)
           itemImageBackgroundShadow.addSubview(itemImage)
           itemImageBackgroundShadow.addSubview(itemCategory)
         
           
           itemImageBackgroundShadow.anchor(topAnchor, left: leftAnchor,right: rightAnchor,bottom: nil,  topConstant: 20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
            itemImage.anchor(itemImageBackgroundShadow.topAnchor, left: leftAnchor, right: rightAnchor,bottom: nil,  topConstant: 30, bottomConstant: 0,leftConstant: 0,  rightConstant: 0, widthConstant: 60, heightConstant: 60)
           
           itemCategory.anchor(itemImage.bottomAnchor, left: leftAnchor, right: rightAnchor,bottom: nil,  topConstant: 10 ,bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
    
}
