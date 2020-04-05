//
//  otpViewController.swift
//  SNP_TW16
//
//  Created by Guide on 19/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//
//import UIKit
//import Pastel
//import Foundation
//import Alamofire
//
//class OtpViewController: UIViewController {
//
//    var idUserLabelText = String()
//    var OTP = String()
//    
//    let URL_USER_OtpPost = "\(AppDelegate.link)alder_iosapp/v1/otp.php"
//
//     var defaultValues = UserDefaults.standard
//     var textTure : UILabel = {
//        let label = UILabel()
//        let title = "Verification Code,"
//        let text = "\n \n Please type the verification code sent \n \n to +49 157 706816306."
//        let style = NSMutableParagraphStyle()
//        style.alignment = NSTextAlignment.center
//        let attributedText = NSMutableAttributedString(string: title,
//        attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 26),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
//        attributedText.append(NSMutableAttributedString(string: text,attributes: [NSMutableAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 14),NSMutableAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.4)]))
//        label.attributedText = attributedText
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    let otpTextField: UITextField = {
//        let textField = UITextField()
//        textField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
//        textField.font = UIFont.BaiJamjureeRegular(size: 16)
//        textField.textColor = UIColor.blackAlpha(alpha: 0.7)
//        textField.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
//        textField.layer.borderWidth = 2
//        textField.layer.cornerRadius = 5
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        textField.leftViewMode = UITextField.ViewMode.always
//        textField.addTarget(self, action: #selector(checkField), for: .editingChanged)
//        return textField
//    }()
////    func checkKey(){
////           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
////           view.addGestureRecognizer(tap)
////    }
//    
//   var idTextField: UITextField = {
//        let textField = UITextField()
//        textField.attributedPlaceholder = NSAttributedString(string: "id", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
//        textField.font = UIFont.BaiJamjureeBold(size: 16)
//        textField.textColor = UIColor.blackAlpha(alpha: 0.7)
//        textField.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
//        textField.layer.borderWidth = 2
//        textField.layer.cornerRadius = 5
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        textField.leftViewMode = UITextField.ViewMode.always
//        return textField
//    }()
//    
//    
//    @objc func checkField(){
////        checkKey()
//        let isCheckValid = otpTextField.text?.count ?? 0 > 0
//        errorLabel.isHidden = false
//        if isCheckValid {
//            errorLabel.isHidden = false
//            showLabel.isHidden = true
//            successLabel.isHidden = true
//            otpTextField.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
//        }else{
//            errorLabel.isHidden = false
//            showLabel.isHidden = true
//            otpTextField.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 0).cgColor
//        }
//    }
//    
//    var errorLabel : UILabel = {
//        let error = UILabel()
//        let errorText = "You have problem with OTP ?"
//        let style = NSMutableParagraphStyle()
//        style.alignment = NSTextAlignment.center
//        
//        let attributedText = NSMutableAttributedString(string: errorText,
//          attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
//        error.attributedText = attributedText
//        error.numberOfLines = 0
//        return error
//    }()
//    
//    var successLabel : UILabel = {
//        let success = UILabel()
//        let successText = "OTP have compute."
//        let style = NSMutableParagraphStyle()
//        style.alignment = NSTextAlignment.center
//
//        let attributedText = NSMutableAttributedString(string: successText,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 31, green: 220, blue: 156)])
//        success.attributedText = attributedText
//        success.numberOfLines = 0
//        return success
//    }()
//    
//    
//    var showLabel : UILabel = {
//        let show = UILabel()
//        let showText = "Error of OTP you can input otp new."
//        let attributedText = NSMutableAttributedString(string: showText,attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.red])
//        show.attributedText = attributedText
//        show.numberOfLines = 0
//        return show
//    }()
//
//    var imageIcon : UIImageView = {
//        let iconImage = UIImageView()
//        iconImage.image = UIImage(named:"smartphone")
//        iconImage.contentMode = .scaleAspectFit
//        return iconImage
//    }()
//    
//    @objc func clickCheck(){
//        
//            if otpTextField.text?.count ?? 0 == 5{
//            otpTextField.layer.borderColor = UIColor.green.cgColor
//            successLabel.isHidden = false
//            errorLabel.isHidden = true
//            showLabel.isHidden = true
//            let parameters = ["otp" : otpTextField.text!]
//                                     Alamofire.request(URL_USER_OtpPost, method: .post,parameters: parameters).responseJSON
//                                       { response in
//                                               print(response)
//                            if let result = response.result.value {
//                                let jsonData = result as? Bool ?? true
//                                if(jsonData == false) {
//                                    let otpId = ("otp") as NSObject
//                                    self.defaultValues.set(otpId, forKey: "otp")
//                                 let puchToReg = RegisterViewController ()
//                                 puchToReg.NumberPhoneLabelText = self.idTextField.text ?? "0"
//                                 self.navigationController?.pushViewController(puchToReg, animated: true)
//                                                                 self.errorLabel.text = "OTP สามารถใช้งานได้"
//                                                                 
//                                                             } else {
//                                                                  self.errorLabel.text = "รหัสไม่ถูกต้อง"
//                                                             }
//
//                                                     }
//
//                                       }
//        
//        }else{
//            otpTextField.layer.borderColor = UIColor.red.cgColor
//            successLabel.isHidden = true
//            errorLabel.isHidden = true
//            showLabel.isHidden = false
//        }
//    }
//    
//    var submitButton : UIButton = {
//        let submit = UIButton()
//        submit.backgroundColor = UIColor.rgb(red: 47, green: 58, blue: 243)
//        submit.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
//        submit.layer.borderWidth = 2
//        submit.layer.cornerRadius = 25
//        submit.setTitle("CHECK OTP", for: .normal)
//        submit.setTitleColor(UIColor.whiteAlpha(alpha: 0.8), for: .normal)
//        submit.titleLabel?.font = UIFont.BaiJamjureeMedium(size: 24)
//        submit.addTarget(self, action: #selector(clickCheck), for: .touchUpInside)
//        return submit
//    }()
//    
//   lazy var btnBack : UIButton = {
//        let btn = UIButton()
//        btn.tintColor = UIColor.black
//        btn.setImage(UIImage(named: "left-arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
//        btn.imageView?.contentMode = .scaleAspectFit
//        btn.addTarget(self, action: #selector(performSegueToReturnBack), for: .touchUpInside)
//        return btn
//    }()
//    
//    @objc func performSegueToReturnBack()  {
////        if let nav = self.navigationController {
////            _ = navigationController?.popViewController(animated: true)
////        } else {
////            self.dismiss(animated: true, completion: nil)
////        }
//        navigationController?.popViewController(animated: true)
//    }
//    
//   ////hide keyborad
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
// 
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        idTextField.text = idUserLabelText
//        otpTextField.text = OTP
//        view.addSubview(textTure)
//        view.addSubview(otpTextField)
//        view.addSubview(submitButton)
//        view.addSubview(errorLabel)
//        view.addSubview(successLabel)
//        view.addSubview(imageIcon)
//        view.addSubview(showLabel)
//        view.addSubview(btnBack)
//        self.errorLabel.isHidden = true
//        self.successLabel.isHidden = true
//        self.showLabel.isHidden = true
//        
//        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
//        )
//        
//        textTure.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 180)
//        
//        imageIcon.anchor(textTure.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: -50, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 200, heightConstant: 200)
//        
//        
//        otpTextField.anchor(imageIcon.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 50)
//        
//        errorLabel.anchor(otpTextField.bottomAnchor, left: nil, right: otpTextField.rightAnchor, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 50)
//
//        successLabel.anchor(otpTextField.bottomAnchor, left: nil, right: otpTextField.rightAnchor, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 50)
//        
//        showLabel.anchor(otpTextField.bottomAnchor, left: nil, right: otpTextField.rightAnchor, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 50)
//        
//        submitButton.anchor(errorLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 120, rightConstant: 120, widthConstant: 0, heightConstant: 50)
//        
//    }
//}

import UIKit
import Foundation
import Alamofire

class OtpViewController: UIViewController {
    var idUserLabelText = String()
    var OTP = String()
    let URL_USER_OtpPost = "\(AppDelegate.link)alder_iosapp/v1/otp.php"

    let defaultValues = UserDefaults.standard
    var Tel_user = String()
    
     var imageView : UIImageView = {
           let image = UIImageView(frame: UIScreen.main.bounds)
           image.image = UIImage(named: "bg")
           image.contentMode = .scaleAspectFill
           image.layer.masksToBounds = true
           return image
       }()
    
     var imageIcon : UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "thailand")
        return iconImage
    }()
    
     var textHeader : UILabel = {
        let label = UILabel()
        let title = "กรอกรหัสยืนยัน"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,
        attributes: [NSAttributedString.Key.paragraphStyle:style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 35),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    var textHeader2 : UILabel = {
        let label = UILabel()
        let text = "โปรดกรอกรหัสที่ท่านได้รับ"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: text,attributes: [NSAttributedString.Key.paragraphStyle:style,NSMutableAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    var otpTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "กรอกรหัสยืนยัน", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
        textField.font = UIFont.BaiJamjureeRegular(size:18)
        textField.textColor = UIColor.blackAlpha(alpha: 0.7)
        textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.addTarget(self, action: #selector(checkNumber), for: .editingChanged)
        return textField
    }()
    
    
    @objc func checkNumber(){
        let checkValue = otpTextField.text?.count ?? 0 > 0
        if !checkValue{
            submitButton.backgroundColor = UIColor.white
            submitButton.setTitleColor(UIColor.rgb(red: 47, green: 58, blue: 243),for: .normal)
            submitButton.layer.borderColor = UIColor.rgb(red: 47, green: 58, blue: 243).cgColor
            checkError.isHidden = true
        }else{
            
            submitButton.setTitleColor(UIColor.white,for: .normal)
            submitButton.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
        }
    }
    
    let submitButton : UIButton = {
        let submit = UIButton()
        submit.backgroundColor = UIColor.white
        submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
        submit.layer.borderWidth = 2
        submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
        submit.layer.cornerRadius = 15
        submit.setTitle("ยืนยัน", for: .normal)
        submit.setTitleColor(UIColor.white,for: .normal)
        submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
        submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
        return submit
    }()
    
    @objc func submitBtn (){
            if otpTextField.text?.count ?? 0 == 5{
//            otpTextField.layer.borderColor = UIColor.green.cgColor
            let parameters = ["otp" : otpTextField.text!]
                                     Alamofire.request(URL_USER_OtpPost, method: .post,parameters: parameters).responseJSON
                                       { response in
                                               print(response)
                            if let result = response.result.value {
                                let jsonData = result as? Bool ?? true
                                if(jsonData == false) {
                                    let otpId = ("otp") as NSObject
                                    self.defaultValues.set(otpId, forKey: "otp")
                                 let puchToReg = RegisterViewController ()
                                 puchToReg.NumberPhoneLabelText = self.idTextField.text ?? "0"
                                 self.navigationController?.pushViewController(puchToReg, animated: true)
                                } else {
                            }

                            }

                    }

        }else{
            checkError.isHidden = false
        }
    }
    
    
    lazy var btnBack : UIButton = {
        let btn = UIButton()
        btn.tintColor = UIColor.black
        btn.setImage(UIImage(named: "left-arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(performSegueToReturnBack), for: .touchUpInside)
        return btn
    }()
    
    @objc func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popToRootViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    var idTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "id", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
            textField.font = UIFont.BaiJamjureeBold(size: 16)
            textField.textColor = UIColor.blackAlpha(alpha: 0.7)
            textField.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            textField.layer.borderWidth = 2
            textField.layer.cornerRadius = 5
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            textField.leftViewMode = UITextField.ViewMode.always
            return textField
    }()
    
    lazy var checkError : UILabel = {
         let check = UILabel()
         let showText = "รหัส OTP ไม่ถูกต้องกรุณาดำเนินการใหม่"
         let style = NSMutableParagraphStyle()
         style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: showText,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 255, green: 0, blue: 0)])

        
         check.attributedText = attributedText
         check.numberOfLines = 0
         return check
     }()
    
    
    lazy var line: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.rgb(red: 198, green: 198, blue: 198)
        return lineView
    }()
    
    lazy var otpView: UIView = {
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
    
    
   ////hide keyborad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stackView = UIStackView(arrangedSubviews: [otpView])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        self.tabBarController?.tabBar.isHidden = true
        self.extendedLayoutIncludesOpaqueBars = true
        otpTextField.text = OTP
        view.addSubview(stackView)
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.insertSubview(imageView, at: 0)
        idTextField.text = idUserLabelText
    
        otpView.addSubview(imageIcon)
        otpView.addSubview(line)
        otpView.addSubview(otpTextField)
        
        view.addSubview(textHeader)
        view.addSubview(textHeader2)
        view.addSubview(submitButton)
        view.addSubview(btnBack)
        view.addSubview(checkError)
        checkError.isHidden = true
        
     
        imageView.anchor(view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 380
        )
        
        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
        )

        
        textHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 130, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        textHeader2.anchor(textHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        

        stackView.anchor(textHeader2.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 80)
                   
        imageIcon.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: otpView.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 40, heightConstant: 30)

        line.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: imageIcon.rightAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 1.5, heightConstant: 80)

        
        otpTextField.anchor(otpView.topAnchor, left: line.rightAnchor, right: otpView.rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        
    
        
        submitButton.anchor(otpView.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 80, rightConstant: 80, widthConstant: 0, heightConstant: 60)

        checkError.anchor(submitButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
    }
}
