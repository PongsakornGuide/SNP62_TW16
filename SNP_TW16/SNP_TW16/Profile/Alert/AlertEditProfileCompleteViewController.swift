//
//  AlertEditProfileCompleteViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 6/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit

class AlertEditProfileCompleteViewController: UIViewController {
    
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
            let title = "กรุณากรอกรหัส OTP"
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 23),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
    }()
    
    lazy var titleHeader2 : UILabel = {
               let label = UILabel()
               let title = "เพื่อทำการยืนยันการแก้ไขข้อมูล"
               let style = NSMutableParagraphStyle()
               style.alignment = NSTextAlignment.center
               let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
               label.attributedText = attributedText
               label.numberOfLines = 0
               return label
    }()
    
    static var otpTextField : UITextField = {
       let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "กรอก otp ",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
        textField.font = UIFont.BaiJamjureeRegular(size: 18)
        textField.textColor = UIColor.blackAlpha(alpha: 0.7)
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 1, height: 3)
        textField.layer.shadowOpacity = 0.1
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftViewMode = UITextField.ViewMode.always
       return textField
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
            submit.addTarget(self, action: #selector(editProfileView.actionComplete), for: .touchUpInside)
            return submit
    }()
    
    var postUsercancel : UIButton = {
               let submit = UIButton(type: UIButton.ButtonType.system)
               submit.backgroundColor = UIColor.rgb(red: 241, green: 90, blue: 66)
               submit.layer.borderColor = UIColor.rgb(red: 241, green: 90, blue: 66).cgColor
               submit.layer.borderWidth = 2
               submit.layer.cornerRadius = 10
               submit.setTitle("ไม่", for: .normal)
               submit.setTitleColor(UIColor.white,for: .normal)
               submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
               submit.addTarget(self, action: #selector(editProfileView.cancelErrorUser), for: .touchUpInside)
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
        
        let stacView = UIStackView(arrangedSubviews:[postUser,postUsercancel])
        stacView.distribution = .fillEqually
        stacView.spacing = 20
        stacView.axis = .horizontal
        
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        showAlert()
        view.addSubview(bgImageProfile)
        view.addSubview(titleHeader)
        view.addSubview(titleHeader2)
        view.addSubview(iconImage)
        view.addSubview(AlertEditProfileCompleteViewController.otpTextField)
        view.addSubview(stacView)
        
        
        
        bgImageProfile.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: bgImageProfile.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        bgImageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        bgImageProfile.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
               
        
        iconImage.anchor(bgImageProfile.topAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: 80, heightConstant: 80)
        
        
        titleHeader.anchor(iconImage.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        
        titleHeader.centerXAnchor.constraint(equalTo: bgImageProfile.centerXAnchor).isActive = true

        
        titleHeader2.anchor(titleHeader.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 30)
               
        titleHeader2.centerXAnchor.constraint(equalTo: bgImageProfile.centerXAnchor).isActive = true

        
        AlertEditProfileCompleteViewController.otpTextField.anchor(titleHeader2.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 60)
         
        
        stacView.anchor(AlertEditProfileCompleteViewController.otpTextField.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: bgImageProfile.bottomAnchor, topConstant: 30, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 50)
    }
}

