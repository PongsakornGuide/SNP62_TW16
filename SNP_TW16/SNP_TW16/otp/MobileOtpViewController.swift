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

class MobileOtpViewController: UIViewController {
    let URL_USER_USE_OTP = "http://localhost/alder_iosapp/v1/select_otp.php"
    let defaultValues = UserDefaults.standard
    var Tel_user = String()
    let imageView : UIImageView = {
           let image = UIImageView(frame: UIScreen.main.bounds)
           image.image = UIImage(named: "bg")
           image.contentMode = .scaleAspectFill
           image.layer.masksToBounds = true
           return image
       }()
    
    let imageIcon : UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "thailand")
//        iconImage.image = UIImage(named:"thailand")?.withRenderingMode(.alwaysTemplate)
//        iconImage.contentMode = .scaleAspectFit
        
        return iconImage
    }()
    
    let textHeader : UILabel = {
        let label = UILabel()
        let title = "กรุณาลงทะเบียน"
        let text = "\n \n โปรดใส่เบอร์มือถือสำหรับการลงทะเบียน"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,
        attributes: [NSAttributedString.Key.paragraphStyle:style,NSAttributedString.Key.font : UIFont.PoppinsBold(size: 35),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
        
        attributedText.append(NSMutableAttributedString(string: text,attributes: [NSAttributedString.Key.paragraphStyle:style,NSMutableAttributedString.Key.font : UIFont.PoppinsBold(size: 22),NSMutableAttributedString.Key.foregroundColor: UIColor.white]))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    
    let otpTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "กรอกเบอร์โทรศัพท์มือถือ", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
        textField.font = UIFont.PoppinsRegular(size:18)
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
        submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
        return submit
    }()
    
    
    func pushiduser(){
        let nextToOtp = OtpViewController()
        nextToOtp.idUserLabelText = otpTextField.text ?? "0"
        self.navigationController?.pushViewController(nextToOtp, animated: true)
    }
    
    
    @objc func submitBtn (){
        if otpTextField.text?.count ?? 0 == 10{
            pushiduser()
            print("เรียบร้อย")
            check_use_otp()
        }else{
            print("เอาใหม่")
            checkError.isHidden = false
        }
    }
    
    
    func check_use_otp(){
        Alamofire.request(URL_USER_USE_OTP, method: .post).responseJSON { response in
                    print(response)
            if let otp = response.result.value {
                self.Tel_user = "\(otp)"
                              let twilioSID = "AC399894510e0fe4b814b3e40737f3b2a5"
                              let twilioSecret = "a74824968da571b8afac81506f84acf2"
                              //Note replace + = %2B , for To and From phone number
                              let fromNumber = "+12565308003"// actual number is +9999999
                              let toNumber = "+66631921545"// actual number is +9999999
                             let message = "Your verification code is " + "\(otp)" + "of Register"
                
                             let request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
                             request.httpMethod = "POST"
                             request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)

                             // Build the completion block and send the request
                             URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                                 print("Finished")
                                 if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                                     // Success
                                     print("Response: \(responseDetails)")
                                 } else {
                                     // Failure
                                    print("Error: \(error)")
                                 }
                             }).resume()
                }
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
            nav.popToRootViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    let checkError : UILabel = {
         let check = UILabel()
         let showText = "Phone number error message."
         let style = NSMutableParagraphStyle()
         style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: showText,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 255, green: 0, blue: 0)])

        
         check.attributedText = attributedText
         check.numberOfLines = 0
         return check
     }()
    
    
    let line: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.rgb(red: 198, green: 198, blue: 198)
        return lineView
    }()
    
    let otpView: UIView = {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
//        view.addGestureRecognizer(tap)
        
        
        let stackView = UIStackView(arrangedSubviews: [otpView])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
//        self.navigationItem(visible: false, duration: 0.3, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        self.extendedLayoutIncludesOpaqueBars = true
//        let backButton = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
//        navigationItem.leftBarButtonItem = backButton
//        navigationItem.hidesBackButton = true
//        navigationItem.setHidesBackButton(true, animated:true);
        

        view.addSubview(stackView)
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.insertSubview(imageView, at: 0)
        
        
        otpView.addSubview(imageIcon)
        otpView.addSubview(line)
        otpView.addSubview(otpTextField)
        
        view.addSubview(textHeader)
        view.addSubview(submitButton)
        view.addSubview(btnBack)
        view.addSubview(checkError)
        checkError.isHidden = true
        
     
        imageView.anchor(view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 380
        )
        
        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
        )

        
        textHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 130, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        stackView.anchor(textHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 80)
                   
        imageIcon.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: otpView.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 40, heightConstant: 30)

        line.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: imageIcon.rightAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 1.5, heightConstant: 80)

        
        otpTextField.anchor(otpView.topAnchor, left: line.rightAnchor, right: otpView.rightAnchor, bottom: nil, topConstant: 26, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
    
        
        submitButton.anchor(otpView.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 80, rightConstant: 80, widthConstant: 0, heightConstant: 70)

        checkError.anchor(submitButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
    }
}
