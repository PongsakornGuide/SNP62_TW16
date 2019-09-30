//
//  mobileOtpViewController.swift
//  SNP_TW16
//
//  Created by Guide on 20/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit

class mobileOtpViewController: UIViewController {
    
    let imageIcon : UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named:"envelope")?.withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = UIColor.blackAlpha(alpha: 0.6)
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    let textHeader : UILabel = {
        let label = UILabel()
        let title = "We Send to text you the OTP \n to authenticate your account"
//        let text = "\n \n Please type the verification code sent \n \n to +49 157 706816306."
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,
                                                       attributes: [NSAttributedString.Key.paragraphStyle:style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    let otpTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Your Mobile Number", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
        textField.font = UIFont.PoppinsRegular(size: 16)
        textField.textColor = UIColor.blackAlpha(alpha: 0.7)
        textField.backgroundColor = UIColor.whiteAlpha(alpha: 0.6)
        textField.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 25
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.keyboardType = UIKeyboardType.numberPad
        textField.addTarget(self, action: #selector(checkNumber), for: .editingChanged)
        return textField
    }()
    
    @objc func checkNumber(){
        let checkValue = otpTextField.text?.count ?? 0 > 0
        if !checkValue{
            print("มีค่าว่าง")
            submitButton.backgroundColor = UIColor.white
            submitButton.setTitleColor(UIColor.rgb(red: 47, green: 58, blue: 243),for: .normal)
            submitButton.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
        }else{
            print("ไม่มีค่าว่าง")
            submitButton.backgroundColor = UIColor.blue
            submitButton.setTitleColor(UIColor.white,for: .normal)
        }
    }
    
    let submitButton : UIButton = {
        let submit = UIButton()
        submit.backgroundColor = UIColor.white
        submit.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
        submit.layer.borderWidth = 2
        submit.layer.cornerRadius = 25
        submit.setTitle("Continue", for: .normal)
        submit.setTitleColor(UIColor.rgb(red: 47, green: 58, blue: 243),for: .normal)
        submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        submit.isUserInteractionEnabled = false
        submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
        return submit
    }()
    
    @objc func submitBtn (){
        if otpTextField.text?.count ?? 0 == 10{
            let nextController = otpViewController()
            self.present(nextController, animated: true)
            print("เรียบร้อย")
        }else{
            print("เอาใหม่")
        }
    }
    
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
        view.addSubview(imageIcon)
        view.addSubview(textHeader)
        view.addSubview(otpTextField)
        view.addSubview(submitButton)
        view.addSubview(btnBack)
        
        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
        )
        
        imageIcon.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 80, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 80, heightConstant: 80)
        
        textHeader.anchor(imageIcon.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 0)
        
        otpTextField.anchor(textHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 50)
        
        submitButton.anchor(otpTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 50)
    }
}
