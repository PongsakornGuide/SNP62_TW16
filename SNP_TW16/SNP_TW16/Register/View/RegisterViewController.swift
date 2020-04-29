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
                            }else if pickerView == genPicker {
                                genTextField.text = gender[row]
                            }else if pickerView == centerPicker {
                                addressTextField.text = center[row]
                            }else{
                                addressTextField.text = center[row]
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
    

        lazy var imgView: UIImageView = {
            let view = UIImageView()
             view.image = UIImage(named: "Group 1094")
             view.layer.cornerRadius = 160/2
             view.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
             view.layer.shadowOpacity = 0.1
             view.layer.shadowOffset = CGSize(width: 0, height: 0)
             view.layer.shadowRadius = 10
             view.contentMode = .scaleToFill
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
        label.text = "ข้อมูลส่วนตัว *"
        label.font = UIFont.BaiJamjureeBold(size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    //-----------------------------------------------------------------------------------------------
        lazy var titlenameLabel : UILabel = {
              let label = UILabel()
              let title = "ชื่อ:"
              let attributedText = NSMutableAttributedString(string: title,
          attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
              label.attributedText = attributedText
              label.numberOfLines = 0
              return label
        }()
    
       let nameTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "ชื่อของคุณ", attributes: [NSAttributedString.Key.font :  UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
               return textField
           }()
           let nameTextFieldLine: UIView = {
                  let view = UIView()
                  view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                  return view
           }()
       //-----------------------------------------------------------------------------------------------
    
          lazy var titlesurnameLabel : UILabel = {
                let label = UILabel()
                let title = "นามสกุล:"
                let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
          }()
    
    
           let surnameTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "นามสกุล",attributes: [NSAttributedString.Key.font :  UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
               return textField
           }()
           let surnameTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
           }()
       //-----------------------------------------------------------------------------------------------
          lazy var titletelLabel : UILabel = {
                let label = UILabel()
                let title = "เบอร์โทรศัพท์:"
                let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
          }()
    
           let phoneTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์", attributes: [NSAttributedString.Key.font :  UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
            return textField
           }()
           let phoneTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
           }()
          
       //-----------------------------------------------------------------------------------------------
            lazy var titledateLabel : UILabel = {
                   let label = UILabel()
                   let title = "วันเกิด:"
                   let attributedText = NSMutableAttributedString(string: title,
               attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                   label.attributedText = attributedText
                   label.numberOfLines = 0
                   return label
            }()
    
           let dateTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "วันเกิด", attributes: [NSAttributedString.Key.font :  UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
               return textField
           }()
           let dateTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
           }()
       
    
    //-----------------------------------------------------------------------------------------------
        lazy var titlegenderLabel : UILabel = {
            let label = UILabel()
            let title = "เพศ:"
            let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
        }()
    
        let genTextField: UITextField = {
            let textField = UITextField()
                  textField.attributedPlaceholder = NSAttributedString(string: "เพศ", attributes: [NSAttributedString.Key.font :  UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
            return textField
        }()
    
        let genTextFieldTextFieldLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
            return view
        }()
    
    
    //-----------------------------------------------------------------------------------------------
    
        lazy var titlecultLabel : UILabel = {
            let label = UILabel()
            let title = "ศาสนา:"
            let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
        }()
    
        let cultTextField: UITextField = {
                      let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "ศาสนา", attributes: [NSAttributedString.Key.font :  UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
        return textField
    }()
    
    let cultTextFieldTextFieldLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
        return view
    }()
    
    //-----------------------------------------------------------------------------------------------
    lazy var titleaddressLabel : UILabel = {
        let label = UILabel()
        let title = "ศูนย์ที่อยู่ปัจจุบัน:"
        let attributedText = NSMutableAttributedString(string: title,
        attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
                    
    let addressTextField: UITextField = {
    let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "ศูนย์ที่อยู่อาศัย", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
        return textField
    }()
    
    let addressTextFieldTextFieldLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
        return view
    }()
          
    @objc func dateChanged(datePicker: UIDatePicker) {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy/MM/dd"
//            dateTextField.text = dateFormatter.string(from: datePicker.date)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "th")
            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func pushData(){

            if nameTextField.text?.count ?? 0 > 0 && surnameTextField.text?.count ?? 0 > 0 && phoneTextField.text?.count ?? 0 > 0 && dateTextField.text?.count ?? 0 > 0 && cultTextField.text?.count ?? 0 > 0 && cultTextField.text?.count ?? 0 > 0 && addressTextField.text?.count ?? 0 > 0 && genTextField.text?.count ?? 0 > 0 {
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
            }else{
                let alert = UIAlertController(title: "ข้อมูลไม่ครบถ้วน", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }

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
//       datePicker = UIDatePicker()
//       datePicker?.datePickerMode = .date
//       dateTextField.inputView = datePicker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.locale = Locale(identifier: "th")
        dateTextField.inputView = datePicker
        
        
       datePicker?.addTarget(self, action: #selector(RegisterViewController.dateChanged(datePicker: )), for: .valueChanged)
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.viewTapped(gestureRecognizer:)))
        
            phoneTextField.text = NumberPhoneLabelText

            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            navigationItem.title = "ข้อมูลส่วนตัว"

                  let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
                  navigationController?.navigationBar.titleTextAttributes = textAttributes
        
           let stacView = UIStackView(arrangedSubviews: [titleLabel,titlenameLabel,nameTextField,titlesurnameLabel,surnameTextField,titletelLabel,phoneTextField,titledateLabel,dateTextField,titlegenderLabel,genTextField,titlecultLabel,cultTextField,titleaddressLabel,addressTextField])
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
            viewScroll.addSubview(btnBack)
            viewScroll.addSubview(stepView)
            viewScroll.addSubview(BGView)
            viewScroll.addSubview(imgView)
            viewScroll.addSubview(uploadImage)
//            viewScroll.addSubview(titleLabel)
            viewScroll.addSubview(stacView)
            viewScroll.addSubview(nextButton)
            viewScroll.addSubview(nameTextFieldLine)
            viewScroll.addSubview(surnameTextFieldLine)
            viewScroll.addSubview(phoneTextFieldLine)
            viewScroll.addSubview(dateTextFieldLine)
            viewScroll.addSubview(genTextFieldTextFieldLine)
            viewScroll.addSubview(cultTextFieldTextFieldLine)
            viewScroll.addSubview(addressTextFieldTextFieldLine)
    
           
       viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                           
       btnBack.anchor(viewScroll.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 25, rightConstant: 0, widthConstant: 20, heightConstant: 20)
              
        stepView.anchor(btnBack.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX - 0, heightConstant: 110)
        
        imgView.anchor(BGView.topAnchor, left: nil, right: nil, bottom: nil, topConstant: -60, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
            imgView.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        uploadImage.anchor(imgView.topAnchor, left: nil, right: imgView.rightAnchor, bottom: nil, topConstant: 75, bottomConstant: 0, leftConstant: 0, rightConstant: -15, widthConstant: 70, heightConstant: 70)

       
        BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nextButton.topAnchor, topConstant: 100, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: 1050)

        stacView.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 130, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 0)
 
        nameTextFieldLine.anchor(nameTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        surnameTextFieldLine.anchor(surnameTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        phoneTextFieldLine.anchor(phoneTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        dateTextFieldLine.anchor(dateTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        genTextFieldTextFieldLine.anchor(genTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        cultTextFieldTextFieldLine.anchor(cultTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        addressTextFieldTextFieldLine.anchor(addressTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 60)
           // Do any additional setup after loading the view.
       }

}
