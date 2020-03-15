//
//  CreateRelativeTelView.swift
//  SNP_TW16
//
//  Created by Guide on 23/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class CreateRelativeTelView: UIViewController {
    var user_id = String()
//    var addList: [addRelative]?
    
     let URL_ADD_RELATIVE = "\(AppDelegate.link)alder_iosapp/v1/addTel.php"
//     let URL_ADD_RELATIVE = "http://172.20.10.5/alder_iosapp/v1/addTel.php"
    let defaultValues = UserDefaults.standard
    let bgActivitity:UIView = {
         let background = UIView()
//         background.backgroundColor = .purple
         return background
     }()
     
      lazy var textHeader : UILabel = {
        let label = UILabel()
        let title = "เพิ่มเบอร์ติดต่อฉุกเฉิน"
        let attributedText = NSMutableAttributedString(string: title,
        attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 30),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 1
        return label
      }()
    
    //-----------------------------------------------------------------------------------------------
       lazy var nameTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "ชื่อของคุณ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
               textField.textColor = .black
               textField.font = UIFont.BaiJamjureeBold(size: 15)
               return textField
           }()
           let nameTextFieldLine: UIView = {
                  let view = UIView()
                  view.backgroundColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                  return view
           }()
    //-----------------------------------------------------------------------------------------------

       lazy var telTextField: UITextField = {
                  let textField = UITextField()
                  textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
                  textField.textColor = .black
                  textField.font = UIFont.BaiJamjureeBold(size: 15)
                  return textField
              }()
       lazy var telTextFieldLine: UIView = {
                     let view = UIView()
                     view.backgroundColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                     return view
              }()
    //-----------------------------------------------------------------------------------------------
       
       lazy var addTel : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.backgroundColor = UIColor.rgb(red: 27, green: 71, blue: 147)
            submit.layer.cornerRadius = 30
            submit.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            submit.layer.shadowOpacity = 0.2
            submit.layer.shadowOffset = CGSize(width: 0, height: 0)
            submit.layer.shadowRadius = 10
            submit.setTitle("บันทึก", for: .normal)
            submit.setTitleColor(UIColor.white,for: .normal)
            submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
            submit.addTarget(self, action: #selector(pushToRelatvie), for: .touchUpInside)
            return submit
        }()
    //----------------------------------------------------------------------------------------------
    
    lazy var alertLabel : UILabel = {
        let label = UILabel()
        label.text = "กรุณากรอกเบอร์โทรศัพท์ให้ครบ"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.BaiJamjureeBold(size: 18)
        return label
      }()
    
    //-----------------------------------------------------------------------------------------------
    
    @objc func pushToRelatvie(){
        let checkTel = telTextField.text?.count ?? 0 >= 10 && nameTextField.text?.count ?? 0 > 2 && nameTextField.text?.count ?? 0 < 20
        if !checkTel{
            print("OTP NOT REGISTER")
            alertLabel.isHidden = false
        }else{
            print("USE REGISTER SUCCECT")
            let parameters: Parameters = ["user_id":user_id,"name":nameTextField.text ?? "NULL","tel":telTextField.text ?? "NULL"]
                    Alamofire.request(URL_ADD_RELATIVE, method: .post,parameters: parameters).responseJSON { response in
                            print(response)
                        if let nav = self.navigationController {
                            nav.popToRootViewController(animated: true)
                             self.navigationController?.popViewController(animated: true)
                        } else {
                            self.dismiss(animated: true, completion: nil)
                        }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(bgActivitity)
        view.addSubview(textHeader)
        view.addSubview(nameTextField)
        view.addSubview(nameTextFieldLine)
        view.addSubview(telTextField)
        view.addSubview(telTextFieldLine)
        view.addSubview(addTel)
        view.addSubview(alertLabel)
        alertLabel.isHidden = true
        if let user = defaultValues.string(forKey: "userId") {
                         user_id = user
                        print(user_id)
              }else{
                           //send back to login view controller
        }
        
        bgActivitity.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 200)
       
        textHeader.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 80, bottomConstant: 0, leftConstant: 25, rightConstant: 25, widthConstant: 0, heightConstant: 0)
        
        nameTextField.anchor(textHeader.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 80, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        nameTextFieldLine.anchor(nameTextField.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)
         
        
        telTextField.anchor(nameTextFieldLine.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 80, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
             
               telTextFieldLine.anchor(telTextField.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)
        
        addTel.anchor(telTextFieldLine.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 80)
        
         alertLabel.anchor(addTel.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 80)
    }
}
