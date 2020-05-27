//
//  mobileOtpViewController.swift
//  SNP_TW16
//
//  Created by Guide on 20/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import UserNotifications
class MobileOtpViewController: UIViewController,UNUserNotificationCenterDelegate{
    
    let URL_USER_USE_OTP = "\(AppDelegate.link)alder_iosapp/v1/select_otp.php"
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
        let title = "กรุณาลงทะเบียน"
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
        let text = "\nโปรดใส่เบอร์มือถือ\n สำหรับการลงทะเบียน"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: text,attributes: [NSAttributedString.Key.paragraphStyle:style,NSMutableAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    var otpTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "กรอกเบอร์โทรศัพท์มือถือ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
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
        submit.setTitle("ขอรหัสยืนยัน", for: .normal)
        submit.setTitleColor(UIColor.white,for: .normal)
        submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
        submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
        return submit
    }()
    
    func check_use_otp(){
        Alamofire.request(URL_USER_USE_OTP, method: .post).responseJSON { [weak self](response) in
                    print(response)
            if let otp = response.result.value  as! [String: Any]?  {
                if let yield = otp["otp"] as? Int {
                    
                    
                    self?.Tel_user = "\(yield)"
                            
                                if let otp = response.result.value as! [String: Any]? {
                                            if let yield = otp["otp"] as? String {
                                            print(yield)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            // your code here
                                                self?.otpTextField.text = "\(yield)"
                                            }
                                            let content = UNMutableNotificationContent()
                                            content.title = "ใส่รหัส OTP เพื่อทำการสมัครสมาชิก"
                                            content.body = "รหัส OTP ของคุณคือ \(yield)"
                                            content.badge = 1
                                            content.sound = UNNotificationSound.default
                                        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
                                            let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: triger)
                                                UNUserNotificationCenter.current().add(request) { (Error) in
                                                print(Error as Any)
                                            }
                                        }
                                }
                    
        }
                
            let nextToOtp = OtpViewController()
                nextToOtp.idUserLabelText = self?.otpTextField.text ?? "0"
                nextToOtp.OTP = self?.Tel_user ?? "Nil"
                self?.navigationController?.pushViewController(nextToOtp, animated: true)
        }
        
        }
    }
    @objc func submitBtn (){
        if otpTextField.text?.count ?? 0 == 10{
            check_use_otp()
            UNUserNotificationCenter.current().delegate = self
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
    
    lazy var checkError : UILabel = {
         let check = UILabel()
         let showText = "Phone number error message."
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

        
        view.addSubview(stackView)
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.insertSubview(imageView, at: 0)
        
    
        otpView.addSubview(imageIcon)
        otpView.addSubview(line)
        otpView.addSubview(otpTextField)
        
        view.addSubview(textHeader)
        view.addSubview(textHeader2)
        view.addSubview(submitButton)
        view.addSubview(btnBack)
        view.addSubview(checkError)
        checkError.isHidden = true
        
     
        imageView.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        
        textHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 60, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        textHeader2.anchor(textHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        

        stackView.anchor(textHeader2.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 80)
                   
        imageIcon.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: otpView.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 40, heightConstant: 30)

        line.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: imageIcon.rightAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 1.5, heightConstant: 80)

        
        otpTextField.anchor(otpView.topAnchor, left: line.rightAnchor, right: otpView.rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        
    
        
        submitButton.anchor(otpView.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 60, rightConstant: 60, widthConstant: 0, heightConstant: 60)

        checkError.anchor(submitButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
             completionHandler([.alert,.sound,.badge])

    }
}
