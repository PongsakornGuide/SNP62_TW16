//
//  ImageCell2.swift
//  SNP_TW16
//
//  Created by Guide on 11/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit

class ImageCell2: UICollectionViewCell {
override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewCell()
}
    
        let imageView : UIImageView = {
               let image = UIImageView(frame: UIScreen.main.bounds)
               image.image = UIImage(named: "bg")
            image.contentMode = .scaleToFill
               image.layer.masksToBounds = true
               return image
           }()
        
    
     let itemCategory: UILabel = {
        let label = UILabel()
        let showText = "เลือกประเภทกิจกรรม \n ที่คุณสนใจ"
        let attributedText = NSMutableAttributedString(string: showText,attributes: [  NSAttributedString.Key.font : UIFont.PoppinsBold(size: 30),NSMutableAttributedString.Key.foregroundColor : UIColor.white])

               
            label.attributedText = attributedText
            label.numberOfLines = 0
        return label
    }()
    
    
    let searchView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.white
           view.layer.borderWidth = 1
           view.layer.cornerRadius = 15
           view.layer.borderColor = UIColor.white.cgColor
           view.layer.shadowColor = UIColor.black.cgColor
           view.layer.shadowOffset = CGSize(width: 3, height: 3)
           view.layer.shadowOpacity = 0.1
           return view
       }()
    
    let searchTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "ค้นหากิจกรรม", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
            textField.font = UIFont.PoppinsRegular(size:22)
            textField.textColor = UIColor.blackAlpha(alpha: 0.7)
            textField.backgroundColor = UIColor.white
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.masksToBounds = false
            textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
            textField.layer.shadowOffset = CGSize(width: -1, height: 3)
            textField.layer.shadowRadius = 1
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 15
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            textField.leftViewMode = UITextField.ViewMode.always
            textField.keyboardType = UIKeyboardType.numberPad
            return textField
        }()
    
       let imageIcon : UIImageView = {
            let iconImage = UIImageView()
            iconImage.image = UIImage(named: "hide")
            return iconImage
        }()
    
    
    
    
    
func setupViewCell(){
    
    
    let stackView = UIStackView(arrangedSubviews: [searchView])
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    stackView.axis = .vertical
    
    addSubview(itemCategory)
    addSubview(imageView)
    insertSubview(imageView, at: 0)
    backgroundColor = .white
    
    addSubview(searchTextField)
//    searchView.addSubview(imageIcon)
    
    
    imageView.anchor(topAnchor, left:leftAnchor, right: rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 210
    )
    
    itemCategory.anchor(topAnchor, left: leftAnchor,right: rightAnchor,bottom: nil,  topConstant: -20, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 200)
    

    searchTextField.anchor(itemCategory.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: -30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 100, heightConstant: 80)
    
}



required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}
