//
//  ImpressViewController.swift
//  SNP_TW16
//
//  Created by Guide on 18/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
class ImpressViewController: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    let URL_USER_REGISTER = "http://localhost/alder_iosapp/v1/add_disease_activity.php"
    var disease = ["1","2","3","4"]
    var activity = ["1","2","3","5"]
    let defaultValues = UserDefaults.standard
    let activityPickerView = UIPickerView()
    let diseasePickerView = UIPickerView()
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView == activityPickerView {
            return activity.count
            
        }else if pickerView == diseasePickerView {
            return disease.count
        }else{
            return disease.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                        if pickerView == activityPickerView {
                                  return activity[row]
                              }else if pickerView == diseasePickerView {
                                  return disease[row]
                              }else{
                                  return disease[row]
                }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                                if pickerView == activityPickerView {
                                     activityTextField.text = activity[row]
                                      self.view.endEditing(false)
                                  }else if pickerView == diseasePickerView {
                                      
                                      diseaseNameTextField.text = disease[row]
                                      self.view.endEditing(false)
                                      
                                  }else{
                                       diseaseNameTextField.text = disease[row]
                                       self.view.endEditing(false)
                                  }
    }

    var disease_user_id = String()
    var activity_user_id = String()
    var username_user = String()
    var phone_number_user = String()
    
   
            var viewScroll: UIScrollView = {
                  let view = UIScrollView()
                  return view
              }()
              let stepView: UIImageView = {
                  let view = UIImageView()
                  view.image = UIImage(named: "Step3")
                  view.layer.cornerRadius = 20
                  return view
              }()
           
    

               let BGView: UIView = {
                   let view = UIView()
                   view.backgroundColor = .white
                   view.layer.cornerRadius = 20
                   return view
               }()
            
 //-----------------------------------------------------------------------------------------------
               let nextButton: UIButton = {
                   let button = UIButton(type: .system)
                   button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                   button.layer.cornerRadius = 20
                   button.setTitle("บันทึก", for: .normal)
                   button.setTitleColor(.white, for: .normal)
                   button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                   button.addTarget(self, action: #selector(pushtoHomeController), for: .touchUpInside)
                   return button
               }()
    
            @objc func pushtoHomeController(){
//                let ImpressView = TestController()
//                ImpressView.num1 = diseaseNameTextField.text ?? "0"
//                ImpressView.num2 = activityTextField.text ?? "0"
//                self.navigationController?.pushViewController(ImpressView, animated: true)


                let parameters: Parameters = [
                "activity_user_apps":activity_user_id,
                "activity_name":activityTextField.text!,
                    
                "disease_id":diseaseNameTextField.text!,
                "disease_detail":diseaseDetailTextField.text!,
                "disease_user_apps":disease_user_id,
                "tel":phone_number_user]
                
                Alamofire.request(URL_USER_REGISTER, method: .post,parameters: parameters).responseJSON { response in
                         print(response)
                       
                       if let result = response.result.value {
                           let jsonData = result as! NSDictionary
                           if(!(jsonData.value(forKey: "error") as! Bool )){

                               if let result = response.result.value {
                                   let user_act = jsonData.value(forKey: "user_act") as! NSDictionary

                                   let id = user_act.value(forKey: "id") as! Int
                                   let userName = user_act.value(forKey: "username") as! String
                                   let userPhone = user_act.value(forKey: "tel") as! String

                                   self.defaultValues.set(id, forKey: "user_id")
                                   self.defaultValues.set(userName, forKey: "userName")
                                   self.defaultValues.set(userPhone, forKey: "tel")
                                   if self.defaultValues.string(forKey:"userName") != nil {
//                                              let TestViewController = MainActivityViewController()
//                                                        TestViewController.num1 = self.diseaseNameTextField.text ?? "0"
//                                                        TestViewController.num2 = self.activityTextField.text ?? "0"
//                                              self.navigationController?.pushViewController(TestViewController, animated: true)
                                          
                                          self.view.window?.rootViewController = tabBarViewController()
                                          self.view.window?.makeKeyAndVisible()
                                   }
                               }else{
                                   print("สมัครสมาชิกไม่สำเร็จ")
                               }
                           }
                       }
                   }
                
                
                
            }
            
    
            let titleLabel : UILabel = {
               let label = UILabel()
               let title = "โรคประจำตัว"
               let style = NSMutableParagraphStyle()
               style.alignment = NSTextAlignment.center
               let attributedText = NSMutableAttributedString(string: title,
           attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 26),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])

               label.attributedText = attributedText
               label.numberOfLines = 0
               return label
           }()
           //-----------------------------------------------------------------------------------------------
            
            let favoriteLabel : UILabel = {
                        let label = UILabel()
                        let title = "ความชื่นชอบ"
                        let style = NSMutableParagraphStyle()
                        style.alignment = NSTextAlignment.center
                        let attributedText = NSMutableAttributedString(string: title,
                    attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 26),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])

                        label.attributedText = attributedText
                        label.numberOfLines = 0
                        return label
                    }()
                    //-----------------------------------------------------------------------------------------------
    
              let diseaseNameTextField: UITextField = {
                      let textField = UITextField()
                      textField.attributedPlaceholder = NSAttributedString(string: "โรคประจำตัว", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                      textField.textColor = .black
//                      textField.addTarget(self, action: #selector(checkOnClick), for: .editingChanged)
                      textField.font = UIFont.boldSystemFont(ofSize: 15)
                      return textField
                  }()
                  let diseaseTextFieldLine: UIView = {
                         let view = UIView()
                         view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                         return view
                  }()
    
              //-----------------------------------------------------------------------------------------------
                  let diseaseDetailTextField: UITextField = {
                      let textField = UITextField()
                      textField.attributedPlaceholder = NSAttributedString(string: "รายละเอียดอื่นๆ",attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                      textField.textColor = .black
                      //textField.addTarget(self, action: #selector(handelemailCheckValid), for: .editingChanged)
                      textField.font = UIFont.boldSystemFont(ofSize: 15)
                      textField.keyboardType = .emailAddress
                      return textField
                  }()
                  let diseaseDetailTextFieldLine: UIView = {
                      let view = UIView()
                      view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                      return view
                  }()
              //-----------------------------------------------------------------------------------------------
                  let activityTextField: UITextField = {
                      let textField = UITextField()
                      textField.attributedPlaceholder = NSAttributedString(string: "ความชอบชื่นชอบ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                      textField.textColor = .black
                      //textField.addTarget(self, action: #selector(handlepasswordCheckValid), for: .editingChanged)
       //               textField.isSecureTextEntry = true
                      textField.font = UIFont.boldSystemFont(ofSize: 15)
                      return textField
                  }()
                  let activityTextFieldLine: UIView = {
                      let view = UIView()
                      view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                      return view
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
             nav.popToRootViewController(animated: true)
         } else {
             self.dismiss(animated: true, completion: nil)
         }
     }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btnBack)
        print(disease_user_id)
        print(activity_user_id)
        print(username_user)
        print(phone_number_user)
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
               activityPickerView.delegate = self
               activityPickerView.dataSource = self
               activityTextField.inputView = activityPickerView


               diseasePickerView.delegate = self
               diseasePickerView.dataSource = self
               diseaseNameTextField.inputView = diseasePickerView
        
        
         let stacView = UIStackView(arrangedSubviews: [diseaseNameTextField,diseaseDetailTextField])
                               stacView.distribution = .fillEqually
                               stacView.spacing = 0
                               stacView.axis = .vertical

                               self.diseaseNameTextField.delegate = self
                               self.diseaseDetailTextField.delegate = self
        
                               view.addSubview(viewScroll)
                               viewScroll.addSubview(stepView)
                               viewScroll.addSubview(BGView)
                               viewScroll.addSubview(titleLabel)
                               viewScroll.addSubview(favoriteLabel)
                               viewScroll.addSubview(stacView)
                               viewScroll.addSubview(nextButton)
                               viewScroll.addSubview(diseaseTextFieldLine)
                               viewScroll.addSubview(diseaseDetailTextFieldLine)
                               viewScroll.addSubview(activityTextField)
                               viewScroll.addSubview(activityTextFieldLine)
                                
        
                            btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
                     )
        
                            viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

                            stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX - 0, heightConstant: 115)

                            BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nextButton.topAnchor, topConstant: 50, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: screenSizeY)
        

                            stacView.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 100, bottomConstant: 250, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 190)
                               //stacView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true


                            titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)


                            diseaseTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: diseaseNameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

                            diseaseDetailTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: diseaseDetailTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        
                            favoriteLabel.anchor(diseaseDetailTextFieldLine.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 100)
        
        
                            
                            activityTextField.anchor(favoriteLabel.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: 0, heightConstant: 0)
        
        
                            activityTextFieldLine.anchor(activityTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)


        
                            nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 70)
                               // Do any additional setup after loading the view.
                           }

    }
