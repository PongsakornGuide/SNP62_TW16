//
//  otpViewController.swift
//  SNP_TW16
//
//  Created by Guide on 19/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Pastel

class otpViewController: UIViewController {
//    let imageView : UIImageView = {
//        let image = UIImageView(frame: UIScreen.main.bounds)
//        image.image = UIImage(named: "marisa-howenstine-nFsOlSE9Mn8-unsplash")
//        image.layer.cornerRadius = 5
//        image.layer.opacity = 0.4
//        image.contentMode = .scaleAspectFill
//        image.layer.masksToBounds = true
//        return image
//    }()
//
    let textTure : UILabel = {
        let label = UILabel()
        let title = "Verification Code,"
        let text = "\n \n Please type the verification code sent \n \n to +49 157 706816306."
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,
    attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 26),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
        
        attributedText.append(NSMutableAttributedString(string: text,attributes: [NSMutableAttributedString.Key.font : UIFont.PoppinsMediumItalic(size: 14),NSMutableAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.4)]))
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    let otpTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
        textField.font = UIFont.PoppinsRegular(size: 16)
        textField.textColor = UIColor.blackAlpha(alpha: 0.7)
        textField.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.keyboardType = UIKeyboardType.numberPad
        textField.addTarget(self, action: #selector(checkField), for: .editingChanged)
        return textField
    }()
    
    @objc func checkField(){
        let isCheckValid = otpTextField.text?.count ?? 0 > 0
        errorLabel.isHidden = false
        if isCheckValid {
            errorLabel.isHidden = false
            showLabel.isHidden = true
            successLabel.isHidden = true
            otpTextField.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
        }else{
            errorLabel.isHidden = false
            showLabel.isHidden = true
            otpTextField.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
        }
    }
    
    let errorLabel : UILabel = {
        let error = UILabel()
        let errorText = "You have problem with OTP ?"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        
        let attributedText = NSMutableAttributedString(string: errorText,
          attributes: [NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
        error.attributedText = attributedText
        error.numberOfLines = 0
        return error
    }()
    
    let successLabel : UILabel = {
        let success = UILabel()
        let successText = "OTP have compute."
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center

        let attributedText = NSMutableAttributedString(string: successText,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 31, green: 220, blue: 156)])
        success.attributedText = attributedText
        success.numberOfLines = 0
        return success
    }()
    
    
    let showLabel : UILabel = {
        let show = UILabel()
        let showText = "Error of OTP you can input otp new."
        let attributedText = NSMutableAttributedString(string: showText,attributes: [NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.red])
        show.attributedText = attributedText
        show.numberOfLines = 0
        return show
    }()

    let imageIcon : UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named:"smartphone")
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    @objc func clickCheck(){
        if otpTextField.text?.count ?? 0 == 4{
            otpTextField.layer.borderColor = UIColor.green.cgColor
            successLabel.isHidden = false
            errorLabel.isHidden = true
            showLabel.isHidden = true
            let nextController = registerViewController()
            self.present(nextController, animated: true)
        }else{
            otpTextField.layer.borderColor = UIColor.red.cgColor
            successLabel.isHidden = true
            errorLabel.isHidden = true
            showLabel.isHidden = false
        }
    }
    
    let submitButton : UIButton = {
        let submit = UIButton()
        submit.backgroundColor = UIColor.rgb(red: 47, green: 58, blue: 243)
        submit.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
        submit.layer.borderWidth = 2
        submit.layer.cornerRadius = 25
        submit.setTitle("CHECK OTP", for: .normal)
        submit.setTitleColor(UIColor.whiteAlpha(alpha: 0.8), for: .normal)
        submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        submit.addTarget(self, action: #selector(clickCheck), for: .touchUpInside)
        return submit
    }()
    
    let btnBack : UIButton = {
        let btn = UIButton()
        btn.tintColor = UIColor.black
        btn.setImage(UIImage(named: "left-arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(performSegueToReturnBack), for: .touchUpInside)
        return btn
    }()
    
    @objc func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.navigationController?.popToRootViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//      view.addSubview(imageView)
//      view.insertSubview(imageView, at: 0)
        view.addSubview(textTure)
        view.addSubview(otpTextField)
        view.addSubview(submitButton)
        view.addSubview(errorLabel)
        view.addSubview(successLabel)
        view.addSubview(imageIcon)
        view.addSubview(showLabel)
        view.addSubview(btnBack)
        
        self.errorLabel.isHidden = true
        self.successLabel.isHidden = true
        self.showLabel.isHidden = true
        
        
        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
        )
        
        textTure.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: -20, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 300)
        
        
        imageIcon.anchor(textTure.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: -50, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 200, heightConstant: 200)
        
        
        otpTextField.anchor(imageIcon.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 50)
        
        errorLabel.anchor(otpTextField.bottomAnchor, left: nil, right: otpTextField.rightAnchor, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 50)

        successLabel.anchor(otpTextField.bottomAnchor, left: nil, right: otpTextField.rightAnchor, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 50)
        
        showLabel.anchor(otpTextField.bottomAnchor, left: nil, right: otpTextField.rightAnchor, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 50)
        
        submitButton.anchor(errorLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 120, rightConstant: 120, widthConstant: 0, heightConstant: 50)

    }
}
