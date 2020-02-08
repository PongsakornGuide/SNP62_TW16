//
//  RecordViewController.swift
//  SNP_TW16
//
//  Created by Guide on 18/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
class RecordViewController: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate  {
    ////hide keyborad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //URK
        
    
     let URL_CREATE_USER = "http://localhost/alder_iosapp/v1/register.php"
//    let URL_CREATE_USER = "http://172.20.10.5/alder_iosapp/v1/register.php"
    
    // Default
    let defaultValues = UserDefaults.standard
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    //get date
    var NameLabelText = String()
    var SernameLabelText = String()
    var BirthLabelText = String()
    var PhotoLabelText = UIImage()
    var MobileLabelText = String()
    var RegligionLabelText = String()
    var AddressLabelText = String()
    var GenderLabelText = String()
    
           var viewScroll: UIScrollView = {
               let view = UIScrollView()
               return view
           }()
    
           let stepView: UIImageView = {
               let view = UIImageView()
               view.image = UIImage(named: "Step2")
               view.layer.cornerRadius = 20
               return view
           }()
        
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
               button.setTitle("ขั้นตอนต่อ", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
               button.addTarget(self, action: #selector(ClicksveData), for: .touchUpInside)
               return button
           }()
    
    
            @objc func ClicksveData(){
            
                let parameters: Parameters =
                               ["username":NameLabelText,
                                "surname":SernameLabelText,
                                "photo":PhotoLabelText,
                                "birthday":BirthLabelText,
                                "gender":GenderLabelText,
                                "tel":MobileLabelText,
                                "address":AddressLabelText,
                                "religion":RegligionLabelText,
                                "relative_name":relativeNameTextField.text!,
                                "relative_phone":relativePhoneTextField.text!,
                                "relative_type":relativeTypeTextField.text!]
//                print(relativeNameTextField.text)
//                print(relativePhoneTextField.text)
//                print(relativeTypeTextField.text)
                print("5555")

                        let header: HTTPHeaders = ["Content-type":"multipart/form-data"]

                                 let dateFormatter : DateFormatter = DateFormatter()
                                 dateFormatter.dateFormat = "yyyyMMddHH:mm:ss"
                                 let date = Date()
                                 let dateString = dateFormatter.string(from: date)

                             Alamofire.upload(multipartFormData: { (formData) in



                                if let imageData = self.PhotoLabelText.jpegData(compressionQuality: 0.5){
                                     formData.append(imageData, withName: "image" ,fileName: dateString,mimeType: "image/jpg")

                                 }
                                 for (key,value) in parameters {
                                     if let stringData = value as? String, let data = stringData.data(using: .utf8) {
                                         formData.append(data, withName: key)
                                     }
                                 }


                             }, to: URL_CREATE_USER ,method: .post ,headers: header) { (res) in
                                 switch res{
                                 case .success(let request, _, _):
                                 request.responseJSON(completionHandler: { (resJson) in
                                     print(resJson.value ?? "0")
                                    guard let json = resJson.value as? [String:Any]
                                        , let id = json["id"]  , let username = json["username"] , let tel = json["tel"] else { return }
                                    print(id)
                                    print(username)
                                    print(tel)
                                    
                                    let ImpressView = TestCheckBoxTableView()
                                    ImpressView.disease_user_id = "\(id)"
                                    ImpressView.activity_user_id = "\(id)"
                                    ImpressView.username_user = "\(username)"
                                    ImpressView.phone_number_user = "\(tel)"
//                                    let ImpressView = TestCheckBoxTableView()
                                    
                                    self.navigationController?.pushViewController(ImpressView, animated: true)
                                    

                                 })
                                 case .failure(_):
                                     print("fail")
                                    }
                                 }
                
            }
        
        
        let titleLabel : UILabel = {
            let label = UILabel()
            let title = "เบอร์ติดต่อฉุกเฉิน *"
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            let attributedText = NSMutableAttributedString(string: title,
        attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 24),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 255, green: 0, blue: 0)])
        
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
        }()
        //-----------------------------------------------------------------------------------------------
                let relativeNameTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "ชื่อญาติ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                   textField.textColor = .black
                   //textField.addTarget(self, action: #selector(checkOnClick), for: .editingChanged)
                   textField.font = UIFont.boldSystemFont(ofSize: 15)
                   return textField
               }()
               let relativeKTextFieldLine: UIView = {
                      let view = UIView()
                      view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                      return view
               }()
           //-----------------------------------------------------------------------------------------------
               let relativePhoneTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์",attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                   textField.textColor = .black
                   //textField.addTarget(self, action: #selector(handelemailCheckValid), for: .editingChanged)
                   textField.font = UIFont.boldSystemFont(ofSize: 15)
                   textField.keyboardType = .emailAddress
                   return textField
               }()
               let relativePhoneTextFieldLine: UIView = {
                   let view = UIView()
                   view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                   return view
               }()
           //-----------------------------------------------------------------------------------------------
               let relativeTypeTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "สถานะ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                   textField.textColor = .black
                   //textField.addTarget(self, action: #selector(handlepasswordCheckValid), for: .editingChanged)
    //               textField.isSecureTextEntry = true
                   textField.font = UIFont.boldSystemFont(ofSize: 15)
                   return textField
               }()
               let relativeTypeTextFieldLine: UIView = {
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
            print(NameLabelText)
            print(SernameLabelText)
            print(BirthLabelText)
            print(PhotoLabelText)
            print(MobileLabelText)
            print(RegligionLabelText)
            print(AddressLabelText)
            print(GenderLabelText)
        
        
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            view.addSubview(btnBack)

        
        
            let stacView = UIStackView(arrangedSubviews: [relativeNameTextField,relativePhoneTextField,relativeTypeTextField])
                       stacView.distribution = .fillEqually
                       stacView.spacing = 0
                       stacView.axis = .vertical
                    
                       self.relativeNameTextField.delegate = self
                       self.relativePhoneTextField.delegate = self
                       self.relativeTypeTextField.delegate = self
               
                       view.addSubview(viewScroll)
                       viewScroll.addSubview(stepView)
                       viewScroll.addSubview(BGView)
                       viewScroll.addSubview(titleLabel)
                       viewScroll.addSubview(stacView)
                       viewScroll.addSubview(nextButton)
                       viewScroll.addSubview(relativeKTextFieldLine)
                       viewScroll.addSubview(relativePhoneTextFieldLine)
                       viewScroll.addSubview(relativeTypeTextFieldLine)
                       
        
        
                btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
               )
                    viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                       
                   stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX - 0, heightConstant: 115)

                       
                    BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nextButton.topAnchor, topConstant: 50, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: screenSizeY)

                    stacView.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 100, bottomConstant: 50, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 300)
                       //stacView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
                        
                    titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
                    
                    relativeKTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: relativeNameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
                        
                    relativePhoneTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: relativePhoneTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

                    relativeTypeTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: relativeTypeTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

                       
                    nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 70)
                       // Do any additional setup after loading the view.
                   }

    }

