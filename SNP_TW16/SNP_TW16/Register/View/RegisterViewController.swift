//
//  registerViewController.swift
//  SNP_TW16
//
//  Created by Guide on 14/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Pastel
import Alamofire

class RegisterViewController: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate , UIImagePickerControllerDelegate ,UIPickerViewDelegate,UIPickerViewDataSource{

        lazy var NumberPhoneLabelText = String()
        lazy var imageTy = UIImage()
        private var datePicker : UIDatePicker?
    
        lazy var religionPicker = UIPickerView()
        lazy var genPicker = UIPickerView()
        lazy var centerPicker = UIPickerView()
        lazy var religion = ["พุทธ","อิสลาม","คริสต์","ไม่ระบุ"]
        lazy var center = ["Chersery Home","อยู่นอกศูนย์","ไม่ระบุ"]
        lazy var gender = ["ชาย","หญิง"]
        lazy var picker1 = UIPickerView()
    
    
           func numberOfComponents(in pickerView: UIPickerView) -> Int {
               return 1
           }
           func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                        if pickerView == religionPicker {
                            return religion.count
                        }else if pickerView == genPicker {
                            return gender.count
                        }else if pickerView == centerPicker{
                            return center.count
                        }else{
                            return center.count
                        }
           }
    
           func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

                        if pickerView == religionPicker {
                            return religion[row]
                        }else if pickerView == genPicker {
                            return gender[row]
                        }else if pickerView == centerPicker {
                            return center[row]
                        }else{
                            return center[row]
                        }

            }
        
           
           func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

                            if pickerView == religionPicker {
                               cultTextField.text = religion[row]
                                self.view.endEditing(false)
                            }else if pickerView == genPicker {
                                
                                genTextField.text = gender[row]
                                self.view.endEditing(false)
                                
                            }else if pickerView == centerPicker {
                                addressTextField.text = center[row]
                                self.view.endEditing(false)
                            }else{
                                addressTextField.text = center[row]
                                self.view.endEditing(false)
                            }
           }
    
       let screenSizeX: CGFloat = UIScreen.main.bounds.width
       let screenSizeY: CGFloat = UIScreen.main.bounds.height
       var viewScroll: UIScrollView = {
           let view = UIScrollView()
           return view
       }()
    
    
       let stepView: UIImageView = {
           let view = UIImageView()
           view.image = UIImage(named: "Step1")
           view.layer.cornerRadius = 30/2
           return view
       }()
    
       let imgView: UIImageView = {
           let view = UIImageView()
            view.image = UIImage(named: "Group 1094")
            view.layer.cornerRadius = 30/2
            view.contentMode = .scaleAspectFit
            view.layer.masksToBounds = true
           return view
       }()
    
    
        let uploadImage: UIButton = {
            let image = UIImage(named: "Group 1093") as UIImage?
            let button = UIButton()
            button.setImage(image, for: .normal)
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(upload), for: .touchUpInside)
            return button
        }()

    
    
    @objc func upload (){
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imgView.image = image
            imageTy = image
        }else{
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
       let BGView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.layer.cornerRadius = 20
           return view
       }()
    
       let nextButton: UIButton = {
           let button = UIButton(type: .system)
           button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
           button.layer.cornerRadius = 20
           button.setTitle("ขั้นตอนต่อไป", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
           button.addTarget(self, action: #selector(pushto), for: .touchUpInside)
           return button
       }()
    
    @objc func pushto (){
        pushData()
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        let title = "ข้อมูลส่วนตัว"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,
    attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 0),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
    
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    //-----------------------------------------------------------------------------------------------
       let nameTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "ชื่อของคุณ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               textField.font = UIFont.BaiJamjureeBold(size: 20)
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
               textField.attributedPlaceholder = NSAttributedString(string: "นามสกุล",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               textField.font = UIFont.BaiJamjureeBold(size: 20)
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
               textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               textField.font = UIFont.BaiJamjureeBold(size: 20)
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
               textField.attributedPlaceholder = NSAttributedString(string: "ปี / เดือน / วัน", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               textField.font = UIFont.BaiJamjureeBold(size: 20)
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
                  textField.attributedPlaceholder = NSAttributedString(string: "เพศ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                  textField.textColor = .black
                  textField.font = UIFont.BaiJamjureeBold(size: 20)
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
                      textField.attributedPlaceholder = NSAttributedString(string: "ศาสนา", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                      textField.textColor = .black
                      textField.font = UIFont.BaiJamjureeBold(size: 20)
                      return textField
                  }()
                  let cultTextFieldTextFieldLine: UIView = {
                      let view = UIView()
                      view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                      return view
                  }()
    
    //-----------------------------------------------------------------------------------------------
                  let addressTextField: UITextField = {
                      let textField = UITextField()
                      textField.attributedPlaceholder = NSAttributedString(string: "ศูนย์ที่อยู่อาศัย", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                      textField.textColor = .black
                      textField.font = UIFont.BaiJamjureeBold(size: 20)
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
    
        func pushData(){
                let passData = RecordViewController()
                passData.NameLabelText = nameTextField.text ?? "0"
                passData.SernameLabelText = surnameTextField.text ?? "0"
                passData.MobileLabelText = phoneTextField.text ?? "0"
                passData.PhotoLabelText = imageTy
                passData.BirthLabelText = dateTextField.text ?? "0"
                passData.RegligionLabelText = cultTextField.text ?? "0"
                passData.AddressLabelText = addressTextField.text ?? "0"
                passData.GenderLabelText = genTextField.text ?? "0"
                self.navigationController?.pushViewController(passData, animated: true)
        }
        
    
    let btnBack : UIButton = {
         let btn = UIButton()
        btn.tintColor = UIColor.blackAlpha(alpha: 0.5)
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
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
       override func viewDidLoad() {
       super.viewDidLoad()
       view.addSubview(btnBack)
       genPicker.delegate = self
       genPicker.dataSource = self
       genTextField.inputView = genPicker

       religionPicker.delegate = self
       religionPicker.dataSource = self
       cultTextField.inputView = religionPicker
                
       centerPicker.delegate = self
       centerPicker.dataSource = self
       addressTextField.inputView = centerPicker
        //picker
       datePicker = UIDatePicker()
       datePicker?.datePickerMode = .date
       dateTextField.inputView = datePicker
        
       datePicker?.addTarget(self, action: #selector(RegisterViewController.dateChanged(datePicker: )), for: .valueChanged)
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.viewTapped(gestureRecognizer:)))
        
            phoneTextField.text = NumberPhoneLabelText

            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
           navigationItem.title = "ข้อมูลส่วนตัว"
           let stacView = UIStackView(arrangedSubviews: [nameTextField,surnameTextField,phoneTextField,dateTextField,genTextField,cultTextField,addressTextField])
           stacView.distribution = .fillEqually
           stacView.spacing = 30
           stacView.axis = .vertical
        
           self.nameTextField.delegate = self
           self.surnameTextField.delegate = self
           self.phoneTextField.delegate = self
           self.dateTextField.delegate = self
           self.genTextField.delegate = self
           self.cultTextField.delegate = self
           self.addressTextField.delegate = self
     
           
            view.addSubview(viewScroll)
            viewScroll.addSubview(btnBack)
            viewScroll.addSubview(stepView)
            viewScroll.addSubview(BGView)
            viewScroll.addSubview(imgView)
            viewScroll.addSubview(uploadImage)
            viewScroll.addSubview(titleLabel)
            viewScroll.addSubview(stacView)
            viewScroll.addSubview(nextButton)
            viewScroll.addSubview(nameTextFieldLine)
            viewScroll.addSubview(surnameTextFieldLine)
            viewScroll.addSubview(phoneTextFieldLine)
            viewScroll.addSubview(dateTextFieldLine)
            viewScroll.addSubview(genTextFieldTextFieldLine)
            viewScroll.addSubview(cultTextFieldTextFieldLine)
            viewScroll.addSubview(addressTextFieldTextFieldLine)
    
           
        viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
//     viewUIView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
        btnBack.anchor(viewScroll.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 15, rightConstant: 0, widthConstant: 20, heightConstant: 20
               )
//
        stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX - 0, heightConstant: 120)

        imgView.anchor(BGView.topAnchor, left: nil, right: nil, bottom: nil, topConstant: -60, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
            imgView.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        uploadImage.anchor(imgView.topAnchor, left: nil, right: imgView.rightAnchor, bottom: nil, topConstant: 75, bottomConstant: 0, leftConstant: 0, rightConstant: -15, widthConstant: 70, heightConstant: 70)

        BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nextButton.topAnchor, topConstant: 100, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: screenSizeY)

        stacView.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 100, bottomConstant: 50, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 700)

        titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        nameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        surnameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: surnameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        phoneTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: phoneTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        dateTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: dateTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        genTextFieldTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: genTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        cultTextFieldTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: cultTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        addressTextFieldTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: addressTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 70)
           // Do any additional setup after loading the view.
       }

}
