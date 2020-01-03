//
//  ComViewController.swift
//  SNP_TW16
//
//  Created by Guide on 18/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class ComViewController: UICollectionViewCell {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .emerald
//        navigationController?.navigationBar.isHidden = true
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCell()
    }

   
       var pages: PageControl? {
           didSet{
               
               guard let image = pages?.imageIcon else { return }
               ImageIcon.image = image.withRenderingMode(.alwaysTemplate)
               titleTextLabel.text = pages?.titleText
               subTitleTextLabel.text = pages?.subTitle
               
           }
       }
       
       let ImageIcon: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "shopping-bag")?.withRenderingMode(.alwaysTemplate)
           image.contentMode = .scaleAspectFit
           image.layer.masksToBounds = true
           image.tintColor = .white
           return image
       }()
       
       let titleTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Welcome to our AShop"
           label.textColor = .white
           label.font = UIFont.PoppinsMedium(size: 34)
           label.numberOfLines = 2
           label.textAlignment = .center
           return label
       }()
       
       let subTitleTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
           label.textColor = UIColor.whiteAlpha(alpha: 0.7)
           label.font = UIFont.PoppinsRegular(size: 16)
           label.numberOfLines = 0
           label.textAlignment = .center
           return label
       }()
       
       func setupViewCell(){
           
           addSubview(ImageIcon)
           addSubview(titleTextLabel)
           addSubview(subTitleTextLabel)
           
        ImageIcon.anchor(topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 150, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 120, heightConstant: 120)
        titleTextLabel.anchor(ImageIcon.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 70, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 0)
        subTitleTextLabel.anchor(titleTextLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 0)
           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}
