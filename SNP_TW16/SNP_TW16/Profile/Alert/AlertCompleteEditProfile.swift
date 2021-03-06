//
//  AlertCompleteEditProfile.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 27/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//


import UIKit

class AlertCompleteEditProfile: UIViewController {
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.removeFromSuperview()
    }
    
    lazy var bgImageProfile:UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.white
        background.layer.cornerRadius = 15
        background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
        background.layer.shadowOpacity = 0.1
        background.layer.shadowOffset = CGSize(width: 0, height: 0)
        background.layer.shadowRadius = 10
        background.layer.shouldRasterize = true
        return background
    }()
    
    lazy var iconImage : UIImageView = {
              let image = UIImageView()
              image.image = UIImage(named: "group1108")
              image.contentMode = .scaleAspectFit
              image.layer.masksToBounds = true
              return image
    }()
    

    
    lazy var titleHeader : UILabel = {
            let label = UILabel()
            let title = "แก้ไขข้อมูลสำเร็จ"
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 23),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
    }()
        
     var postUser : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            submit.layer.borderWidth = 2
            submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
            submit.layer.cornerRadius = 10
            submit.setTitle("ตกลง", for: .normal)
            submit.setTitleColor(UIColor.white,for: .normal)
            submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
            submit.addTarget(self, action: #selector(editProfileView.complete), for: .touchUpInside)
            return submit
    }()
    
    
    func showAlert(){
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0;
            self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
            
        });
    }
    

    func showAlertcancel(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.view.alpha = 0.0;
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

    
    override func viewDidLoad() {
    super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        showAlert()
        view.addSubview(bgImageProfile)
        view.addSubview(titleHeader)
        view.addSubview(iconImage)
        view.addSubview(postUser)
        
        
        
        bgImageProfile.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: postUser.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        bgImageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        bgImageProfile.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
               
        
        iconImage.anchor(bgImageProfile.topAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: 80, heightConstant: 80)
        
        
        titleHeader.anchor(iconImage.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        
        titleHeader.centerXAnchor.constraint(equalTo: bgImageProfile.centerXAnchor).isActive = true

        postUser.anchor(titleHeader.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: bgImageProfile.bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 60)
        
    
    }
}


