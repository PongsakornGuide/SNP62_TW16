//
//  LoginViewController.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import UserNotifications
class LoginViewController: UIViewController,UNUserNotificationCenterDelegate {
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    var otpUser = String()
    lazy var OTP_check = String()
    lazy var OTP = String()
    lazy var defaultValues = UserDefaults.standard
    let URL_USER_LOGIN = "\(AppDelegate.link)alder_iosapp/v1/login.php"
    let URL_USER_USE_OTP = "\(AppDelegate.link)alder_iosapp/v1/select_otp.php"
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
         return .lightContent
    }
    
    lazy var imageView : UIImageView = {
               let image = UIImageView()
               image.image = UIImage(named: "Intersection 4")
               image.contentMode = .scaleAspectFill
               image.layer.masksToBounds = true
               return image
    }()
        
    lazy var imageIcon : UIImageView = {
            let iconImage = UIImageView()
            iconImage.image = UIImage(named: "thailand")
            return iconImage
    }()

    lazy var textHeader : UILabel = {
            let label = UILabel()
            let title = "ยินดีต้อนรับ Alder"
            let text = "\n \n ใส่เบอร์มือถือสำหรับเข้าสู่ระบบ"
            let attributedText = NSMutableAttributedString(string: title,
            attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 30),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
            attributedText.append(NSMutableAttributedString(string: text,attributes: [NSMutableAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 18),NSMutableAttributedString.Key.foregroundColor: UIColor.white]))
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
    }()

    lazy var numberTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "กรอกเบอร์โทรศัพท์มือถือ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
            textField.font = UIFont.BaiJamjureeRegular(size:18)
            textField.textColor = UIColor.blackAlpha(alpha: 0.7)
            textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 15
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            textField.leftViewMode = UITextField.ViewMode.always
            return textField
    }()

    lazy var submitButton : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.backgroundColor = UIColor.white
            submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            submit.layer.borderWidth = 2
            submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
            submit.layer.cornerRadius = 30
            submit.setTitle("ขอรหัสยืนยัน", for: .normal)
            submit.setTitleColor(UIColor.white,for: .normal)
            submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
            submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
            return submit
    }()
    
    lazy var otpTextField : UITextField = {
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
    
    lazy var submitLogin : UIButton = {
              let submit = UIButton(type: UIButton.ButtonType.system)
              submit.backgroundColor = UIColor.white
              submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
              submit.layer.borderWidth = 2
              submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
              submit.layer.cornerRadius = 30
              submit.setTitle("ยืนยัน", for: .normal)
              submit.setTitleColor(UIColor.white,for: .normal)
              submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
              submit.addTarget(self, action: #selector(loginToApp), for: .touchUpInside)
              return submit
    }()
    
    lazy var cancelLogin : UIButton = {
                 let submit = UIButton(type: UIButton.ButtonType.system)
                 submit.backgroundColor = UIColor.white
                 submit.layer.borderColor = UIColor.rgb(red: 241, green: 90, blue: 66).cgColor
                 submit.layer.borderWidth = 2
                 submit.backgroundColor = UIColor.rgb(red: 241, green: 90, blue: 66)
                 submit.layer.cornerRadius = 30
                 submit.setTitle("ยกเลิก", for: .normal)
                 submit.setTitleColor(UIColor.white,for: .normal)
                 submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
                 submit.addTarget(self, action: #selector(cancelApp), for: .touchUpInside)
                 return submit
    }()

//    func send_to_otp(){
//        Alamofire.request(URL_USER_USE_OTP, method: .post).responseJSON { response in
//                        if let otp = response.result.value as! [String: Any]? {
//                            if let yield = otp["otp"] as? String {
//                               print(yield)
//
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                                    // your code here
//                                      self.otpTextField.text = yield
//                                }
//                                        let twilioSID = "AC399894510e0fe4b814b3e40737f3b2a5"
//                                        let twilioSecret = "a74824968da571b8afac81506f84acf2"
//                                        let fromNumber = "+12565308003"// actual number is +9999999
//                                        let toNumber = "+66631921545"// actual number is +9999999
//
//                                         let message = "Your verification code is \(yield) for Login"
//                                         // Build the request
//                                         let request = NSMutableURLRequest(url: URL(string:"https://\(twilioSID):\(twilioSecret)@api.twilio.com/2010-04-01/Accounts/\(twilioSID)/SMS/Messages")!)
//                                         request.httpMethod = "POST"
//                                         request.httpBody = "From=\(fromNumber)&To=\(toNumber)&Body=\(message)".data(using: .utf8)
//                                                         // Build the completion block and send the request
//                                         URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
//                                             print("Finished")
//                                             if let data = data, let responseDetails = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
//                                                 // Success
//                                                 print("Response: \(responseDetails)")
//                                             } else {
//                                                 // Failure
//                                                print("Error: \(error)")
//                                             }
//                                         }).resume()
//                             }
//
//                }
//            }
//    }
    
//    if let user = resData.result.value as! [String: Any]? {
//    if let yield = user["tel"] as? Int
        
      func NotificaitonUser(){
        Alamofire.request(URL_USER_USE_OTP, method: .post).responseJSON { [weak self](response) in
                    if let otp = response.result.value as! [String: Any]? {
                        if let yield = otp["otp"] as? Int {
                        print(yield)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        // your code here
                            self?.otpTextField.text = "\(yield)"
                        }
                        let content = UNMutableNotificationContent()
                        content.title = "ใส่รหัส OTP เพื่อทำการเข้าสู่ระบบ Alder"
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
           
    }

  

    @objc func submitBtn(){
        
        let checkNum = numberTextField.text?.count ?? 0 >= 10
        if !checkNum {
            checkError.isHidden = false
        }else{
            NotificaitonUser()
            UNUserNotificationCenter.current().delegate = self
            otpTextField.isHidden = false
            submitLogin.isHidden = false
            checkError.isHidden = true
            regButton.isHidden = true
            cancelLogin.isHidden = false
//            send_to_otp()
        }
    }
    
    @objc func cancelApp(){
        otpTextField.isHidden = true
        submitLogin.isHidden = true
        regButton.isHidden = false
        cancelLogin.isHidden = true
    }
    

    
    @objc func loginToApp(){
        let checkOTP = otpTextField.text?.count ?? 0 >= 5
        if !checkOTP{
            print("OTP NOT REGISTER")
        }else{
            print("USE REGISTER SUCCECT")
            let parameters = ["tel" : numberTextField.text!,"otp": otpTextField.text!]
            Alamofire.request(URL_USER_LOGIN, method: .post,parameters: parameters).responseJSON { response in
                   print(response)
                   if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                              let user = jsonData.value(forKey: "user") as! NSDictionary
                                   let userId = user.value(forKey: "id") as! Int
                                   let userName = user.value(forKey: "username") as! String
                                   let tel = user.value(forKey: "tel") as! String
                                   //saving user
                                   let image = user.value(forKey: "photo") as! String
                                    
                                   let birthday = user.value(forKey: "birthday") as! String
                                   self.defaultValues.set(userId, forKey: "userId")
                                   self.defaultValues.set(userName, forKey: "userName")
                                   self.defaultValues.set(tel, forKey: "tel")
                                   self.defaultValues.set(image, forKey: "ImageUser")
                                   self.defaultValues.set(birthday, forKey: "birthdayUser")
                                   self.dismiss(animated: false, completion: nil)
                    } else {
                                  self.checkError.isHidden = false
                                  self.checkError.text = "Invalid username or password"
                    }
                }
                 if self.defaultValues.string(forKey:"userName") != nil {
                        self.view.window?.rootViewController = tabBarViewController()
                        self.view.window?.makeKeyAndVisible()
               }
            }
        }
    }

    lazy var regButton : UIButton = {
                let submit = UIButton(type: UIButton.ButtonType.system)
                submit.backgroundColor = UIColor.white
                submit.layer.cornerRadius = 30
                submit.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                submit.layer.shadowOpacity = 0.2
                submit.layer.shadowOffset = CGSize(width: 0, height: 0)
                submit.layer.shadowRadius = 10
                submit.setTitle("สมัครสมาชิก", for: .normal)
                submit.setTitleColor(UIColor.blackAlpha(alpha: 0.7),for: .normal)
                submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
                submit.addTarget(self, action: #selector(pushToReigster), for: .touchUpInside)
                return submit
            }()

        @objc func pushToReigster(){
            let Register = MobileOtpViewController()
            navigationController?.pushViewController(Register, animated: true)
            
        }
    
        func pushiduser(){
            let nextToOtp = OtpViewController()
            nextToOtp.idUserLabelText = numberTextField.text ?? "0"
            self.navigationController?.pushViewController(nextToOtp, animated: true)
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

            
            let stacView1 = UIStackView(arrangedSubviews:[submitLogin,cancelLogin])
            stacView1.distribution = .fillEqually
            stacView1.spacing = 10
            stacView1.axis = .horizontal
            
            tabBarController?.tabBar.isHidden = true
            let stackView = UIStackView(arrangedSubviews: [otpView])
            stackView.distribution = .fillEqually
            stackView.spacing = 0
            stackView.axis = .vertical
            
            
            view.addSubview(stackView)
            view.backgroundColor = .white
            view.addSubview(imageView)
            otpView.addSubview(imageIcon)
            otpView.addSubview(line)
            otpView.addSubview(numberTextField)
            view.addSubview(textHeader)
            view.addSubview(submitButton)
            view.addSubview(checkError)
            view.addSubview(regButton)
            view.addSubview(otpTextField)
            view.addSubview(stacView1)
//            view.addSubview(submitLogin)
//            view.addSubview(cancelLogin)
            
            
            checkError.isHidden = true
            otpTextField.isHidden = true
            submitLogin.isHidden = true
            cancelLogin.isHidden = true

            
            imageView.anchor(view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200
            )

            textHeader.anchor(imageView.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 60, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

            stackView.anchor(imageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 80)

            imageIcon.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: otpView.leftAnchor, right: nil, bottom: nil, topConstant: 25, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 40, heightConstant: 30)

            line.anchor(otpView.safeAreaLayoutGuide.topAnchor, left: imageIcon.rightAnchor, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0,  leftConstant: 20, rightConstant: 0, widthConstant: 1.5, heightConstant: 80)

            numberTextField.anchor(otpView.topAnchor, left: line.rightAnchor, right: otpView.rightAnchor, bottom: nil, topConstant: 26, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)

            submitButton.anchor(otpView.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 60, rightConstant: 60, widthConstant: 0, heightConstant: 65)
            
            otpTextField.anchor(submitButton.bottomAnchor, left: otpView.leftAnchor, right: otpView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 80)
            
            stacView1.anchor(otpTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 40, rightConstant: 40, widthConstant: screenSizeX, heightConstant: 60)
                   
            
            regButton.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: -130, bottomConstant: 0, leftConstant: 60, rightConstant: 60, widthConstant: 0, heightConstant: 65)
            
             checkError.anchor(regButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        }
    
      func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
          completionHandler([.alert,.sound,.badge])

      }
}
