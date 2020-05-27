//
//  AlertCancelJoinActivityFromNotification.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 22/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class AlertCancelJoinActivityFromNotification: UIViewController {
    
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
              image.image = UIImage(named: "Group 1076")
              image.contentMode = .scaleAspectFit
              image.layer.masksToBounds = true
              return image
    }()
    

    
    lazy var titleHeader : UILabel = {
            let label = UILabel()
            let title = "ต้องการยกเลิก"
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 24),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.textAlignment = .center
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
    }()
    
    lazy var titleHeader1 : UILabel = {
            let label = UILabel()
            let title = "ต้องการยกเลิก"
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.attributedText = attributedText
            
            label.numberOfLines = 0
            return label
    }()
    
     var postUser : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.backgroundColor = UIColor.white
            submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            submit.layer.borderWidth = 2
            submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
            submit.layer.cornerRadius = 10
            submit.setTitle("ใช่", for: .normal)
            submit.setTitleColor(UIColor.white,for: .normal)
            submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
            submit.addTarget(self, action: #selector(NotificationContent.cancelJoin), for: .touchUpInside)
            return submit
    }()

    
   
            
    
    var cancel : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.backgroundColor = UIColor.white
            submit.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            submit.layer.shadowOpacity = 0.1
            submit.layer.shadowOffset = CGSize(width: 0, height: 0)
            submit.layer.shadowRadius = 10
            submit.layer.borderWidth = 2
            submit.layer.cornerRadius = 10
            submit.setTitle("ไม่", for: .normal)
            submit.setTitleColor(UIColor.black,for: .normal)
            submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
            submit.addTarget(self, action: #selector(cancelError), for: .touchUpInside)
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
    
    
    @objc func cancelError(){
        showAlertcancel()
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        showAlert()
        view.addSubview(bgImageProfile)
        view.addSubview(titleHeader)
        view.addSubview(titleHeader1)
        view.addSubview(iconImage)
        view.addSubview(postUser)
        view.addSubview(cancel)
        
        
         bgImageProfile.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: cancel.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
               
               bgImageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               bgImageProfile.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                         
               iconImage.anchor(bgImageProfile.topAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: 100, heightConstant: 100)
               
               titleHeader.anchor(iconImage.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 30)
               
               titleHeader.centerXAnchor.constraint(equalTo: bgImageProfile.centerXAnchor).isActive = true

               titleHeader1.anchor(titleHeader.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 30)
               
               titleHeader1.centerXAnchor.constraint(equalTo: bgImageProfile.centerXAnchor).isActive = true

               postUser.anchor(titleHeader1.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 60)
               
               cancel.anchor(postUser.bottomAnchor, left: bgImageProfile.leftAnchor, right: bgImageProfile.rightAnchor, bottom: bgImageProfile.bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 60)

    }
}

