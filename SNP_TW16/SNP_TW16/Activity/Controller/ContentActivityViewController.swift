//
//  ContentActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ContentActivityViewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate{
       let screenSizeX: CGFloat = UIScreen.main.bounds.width
             let screenSizeY: CGFloat = UIScreen.main.bounds.height
             
             var viewScroll: UIScrollView = {
                 let view = UIScrollView()
                 return view
             }()
             let stepView: UIImageView = {
                 let view = UIImageView()
//                 view.image = UIImage(named: "Step1")
                 view.backgroundColor = .red
                 return view
             }()
          
             let imgView: UIImageView = {
                 let view = UIImageView()
                 view.backgroundColor = .red
//                  view.image = UIImage(named: "Group 1094")
//                  view.layer.cornerRadius = 30/2
//                  view.contentMode = .scaleAspectFit
//                  view.layer.masksToBounds = true
                 return view
             }()
          
          
          let uploadImage: UIButton = {
              let image = UIImage(named: "Group 1093") as UIImage?
              let button = UIButton()
              button.setImage(image, for: .normal)
              button.layer.masksToBounds = true
//              button.addTarget(self, action: #selector(upload), for: .touchUpInside)
              return button
          }()

          
          
          
          
          
             let BGView: UIView = {
                 let view = UIView()
                 view.backgroundColor = .purple
                 view.layer.cornerRadius = 20
                 return view
             }()
          
             let nextButton: UIButton = {
                 let button = UIButton(type: .system)
                 button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                 button.layer.cornerRadius = 20
                 button.setTitle("ขั้นตอนต่อไป", for: .normal)
                 button.setTitleColor(.white, for: .normal)
                 button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//                 button.addTarget(self, action: #selector(pushto), for: .touchUpInside)
                 return button
             }()
          
          let titleLabel : UILabel = {
              let label = UILabel()
              let title = "ข้อมูลส่วนตัว"
              let style = NSMutableParagraphStyle()
              style.alignment = NSTextAlignment.center
              let attributedText = NSMutableAttributedString(string: title,
          attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 0),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
          
              label.attributedText = attributedText
              label.numberOfLines = 0
              return label
          }()
          //-----------------------------------------------------------------------------------------------
             let nameTextField: UITextField = {
                     let textField = UITextField()
                     textField.attributedPlaceholder = NSAttributedString(string: "ชื่อของคุณ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                     textField.textColor = .black
                     //textField.addTarget(self, action: #selector(checkOnClick), for: .editingChanged)
                     textField.font = UIFont.boldSystemFont(ofSize: 15)
                     return textField
                 }()
                 let nameTextFieldLine: UIView = {
                        let view = UIView()
                        view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                        return view
                 }()
             //-----------------------------------------------------------------------------------------------
                 let surnameTextField: UITextField = {
                     let textField = UITextField()
                     textField.attributedPlaceholder = NSAttributedString(string: "นามสกุล",attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                     textField.textColor = .black
                     //textField.addTarget(self, action: #selector(handelemailCheckValid), for: .editingChanged)
                     textField.font = UIFont.boldSystemFont(ofSize: 15)
                     textField.keyboardType = .emailAddress
                     return textField
                 }()
                 let surnameTextFieldLine: UIView = {
                     let view = UIView()
                     view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                     return view
                 }()
             //-----------------------------------------------------------------------------------------------
                 let phoneTextField: UITextField = {
                     let textField = UITextField()
                     textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                     textField.textColor = .black
                     //textField.addTarget(self, action: #selector(handlepasswordCheckValid), for: .editingChanged)
      //               textField.isSecureTextEntry = true
                     textField.font = UIFont.boldSystemFont(ofSize: 15)
                     return textField
                 }()
                 let phoneTextFieldLine: UIView = {
                     let view = UIView()
                     view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                     return view
                 }()
                
             //-----------------------------------------------------------------------------------------------
                 let dateTextField: UITextField = {
                     let textField = UITextField()
                     textField.attributedPlaceholder = NSAttributedString(string: "ปี / เดือน / วัน", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                     textField.textColor = .black
                     //textField.addTarget(self, action: #selector(handleconfirmpasswordCheckValid), for: .editingChanged)
      //               textField.isSecureTextEntry = true
                     textField.font = UIFont.boldSystemFont(ofSize: 15)
                     return textField
                 }()
                 let dateTextFieldLine: UIView = {
                     let view = UIView()
                     view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                     return view
                 }()
             
          
          //-----------------------------------------------------------------------------------------------
                    let genTextField: UITextField = {
                        let textField = UITextField()
                        textField.attributedPlaceholder = NSAttributedString(string: "เพศ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                        textField.textColor = .black
                        //textField.addTarget(self, action: #selector(handleconfirmpasswordCheckValid), for: .editingChanged)
      //                  textField.isSecureTextEntry = true
                        textField.font = UIFont.boldSystemFont(ofSize: 15)
                        return textField
                    }()
                    let genTextFieldTextFieldLine: UIView = {
                        let view = UIView()
                        view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                        return view
                    }()
          
          
          //-----------------------------------------------------------------------------------------------
                        let cultTextField: UITextField = {
                            let textField = UITextField()
                            textField.attributedPlaceholder = NSAttributedString(string: "ศาสนา", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                            textField.textColor = .black
                            textField.addTarget(self, action: #selector(CheckPicker), for: .editingChanged)
          //                  textField.isSecureTextEntry = true
                            textField.font = UIFont.boldSystemFont(ofSize: 15)
                            return textField
                        }()
                        let cultTextFieldTextFieldLine: UIView = {
                            let view = UIView()
                            view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                            return view
                        }()
          @objc func CheckPicker(){
      //        pickerReg()
          }
          
          //-----------------------------------------------------------------------------------------------
                        let addressTextField: UITextField = {
                            let textField = UITextField()
                            textField.attributedPlaceholder = NSAttributedString(string: "ศูนย์ที่อยู่อาศัย", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                            textField.textColor = .black
                            //textField.addTarget(self, action: #selector(handleconfirmpasswordCheckValid), for: .editingChanged)
          //                  textField.isSecureTextEntry = true
                            textField.font = UIFont.boldSystemFont(ofSize: 15)
                            return textField
                        }()
                        let addressTextFieldTextFieldLine: UIView = {
                            let view = UIView()
                            view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                            return view
                        }()
                
              @objc func dateChanged(datePicker: UIDatePicker) {
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "yyyy/MM/dd"
                  dateTextField.text = dateFormatter.string(from: datePicker.date)
                  view.endEditing(true)
              }
          
              @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
                  view.endEditing(true)
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
          
          
             override func viewDidLoad() {
                 super.viewDidLoad()
              
              
      view.addSubview(btnBack)
              


              
                  view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
                 navigationItem.title = "ข้อมูลส่วนตัว"
      //           ,surnameTextField,phoneTextField
      //           ,dateTextField,genTextField,cultTextField,addressTextField
                 let stacView = UIStackView(arrangedSubviews: [nameTextField,surnameTextField,phoneTextField,dateTextField,genTextField,cultTextField,addressTextField])
                 stacView.distribution = .fillEqually
                 stacView.spacing = 0
                 stacView.axis = .vertical
              
                 self.nameTextField.delegate = self
                 self.surnameTextField.delegate = self
                 self.phoneTextField.delegate = self
                 self.dateTextField.delegate = self
                 self.genTextField.delegate = self
                 self.cultTextField.delegate = self
                 self.addressTextField.delegate = self
           
                 
                 view.addSubview(viewScroll)
                 viewScroll.addSubview(stepView)
                 viewScroll.addSubview(BGView)
              
//                 viewScroll.addSubview(titleLabel)
              
//                 viewScroll.addSubview(stacView)
//                 viewScroll.addSubview(nextButton)
//
//                 viewScroll.addSubview(nameTextFieldLine)
//                 viewScroll.addSubview(surnameTextFieldLine)
//                 viewScroll.addSubview(phoneTextFieldLine)
//
//                  viewScroll.addSubview(dateTextFieldLine)
//                  viewScroll.addSubview(genTextFieldTextFieldLine)
//                  viewScroll.addSubview(cultTextFieldTextFieldLine)
//                  viewScroll.addSubview(addressTextFieldTextFieldLine)
              
             
              viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
              
              btnBack.anchor(viewScroll.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
                     )
                 
              stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 200)
                 
              BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)

                
                
//                nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 50)
                
//              stacView.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 100, bottomConstant: 50, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 700)
//                 //stacView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
//
//
//
//              titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//
//              nameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//              surnameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: surnameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//              phoneTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: phoneTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//              dateTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: dateTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//                  genTextFieldTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: genTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//              cultTextFieldTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: cultTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//
//              addressTextFieldTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: addressTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
//      //
      //
                 
//              nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 50)
                 // Do any additional setup after loading the view.
             }

}
