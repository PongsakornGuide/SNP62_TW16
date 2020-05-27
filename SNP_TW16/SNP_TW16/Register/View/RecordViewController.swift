//
//  RecordViewController.swift
//  SNP_TW16
//
//  Created by Guide on 18/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
class RecordViewController: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate ,UIImagePickerControllerDelegate ,UIPickerViewDelegate,UIPickerViewDataSource {
    ////hide keyborad
    lazy var friendPicker = UIPickerView()
    lazy var friend = ["ผู้ปกครอง","ญาติ","ไม่ระบุ"]
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
     }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return friend.count
    }
       
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return friend[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          relativeTypeTextField.text = friend[row]
    }
        
    
    let URL_CREATE_USER = "\(AppDelegate.link)alder_iosapp/v1/register.php"
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
               button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
               button.addTarget(self, action: #selector(ClicksveData), for: .touchUpInside)
               return button
           }()
    
    
            @objc func ClicksveData(){
                if NameLabelText.count > 0 && SernameLabelText.count > 0 && BirthLabelText.count > 0 && GenderLabelText.count > 0 && MobileLabelText.count > 0 && AddressLabelText.count > 0 && RegligionLabelText.count > 0 && relativeNameTextField.text?.count ?? 0 > 0 && relativePhoneTextField.text?.count ?? 0 > 0 && relativeTypeTextField.text?.count ?? 0 > 0  {


                      let parameters: Parameters =
                                                   ["username":NameLabelText,
                                                    "surname":SernameLabelText,
                                                    "photo":PhotoLabelText,
                                                    "birthday":BirthLabelText,
                                                    "gender":GenderLabelText,
                                                    "tel":MobileLabelText,
                                                    "address":AddressLabelText,
                                                    "religion":RegligionLabelText,
                                                    "relative_name":relativeNameTextField.text ?? 0,
                                                    "relative_phone":relativePhoneTextField.text ?? 0,
                                                    "relative_type":relativeTypeTextField.text ?? 0]
                    print(parameters)
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
                                                        let ImpressView = TestCheckBoxTableView()
                                                        ImpressView.disease_user_id = "\(id)"
                                                        ImpressView.activity_user_id = "\(id)"
                                                        ImpressView.username_user = "\(username)"
                                                        ImpressView.phone_number_user = "\(tel)"
                                                        self.navigationController?.pushViewController(ImpressView, animated: true)


                                                     })
                                                     case .failure(_):
                                                         print("fail")
                                                        }
                                                     }

                }else{
                      let alert = UIAlertController(title: "ข้อมูลไม่ครบถ้วน", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
                                  alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
                                  self.present(alert, animated: true, completion: nil)

                }

                
            }
        
        
        let titleLabel : UILabel = {
            let label = UILabel()
            let title = "เบอร์ติดต่อฉุกเฉิน *"
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            let attributedText = NSMutableAttributedString(string: title,
        attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 24),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 255, green: 0, blue: 0)])
        
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
        }()
    

                     
    
    //-----------------------------------------------------------------------------------------------
    
    
                lazy var titlerelativeNameLabel : UILabel = {
                        let label = UILabel()
                        let title = "ชื่อญาติ:"
                        let attributedText = NSMutableAttributedString(string: title,
                                                  attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                        label.attributedText = attributedText
                        label.numberOfLines = 0
                        return label
                }()
    
                let relativeNameTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "ชื่อญาติ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
                   return textField
               }()
               let relativeKTextFieldLine: UIView = {
                      let view = UIView()
                      view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                      return view
               }()
           //-----------------------------------------------------------------------------------------------
    
                lazy var titlerelativePhoneLabel : UILabel = {
                        let label = UILabel()
                        let title = "เบอร์โทรศัพท์:"
                        let attributedText = NSMutableAttributedString(string: title,
                                                  attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                        label.attributedText = attributedText
                        label.numberOfLines = 0
                        return label
                }()
    
               let relativePhoneTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
                   return textField
               }()
               let relativePhoneTextFieldLine: UIView = {
                   let view = UIView()
                   view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                   return view
               }()
           //-----------------------------------------------------------------------------------------------
    
                lazy var titlerelativeTypeLabel : UILabel = {
                           let label = UILabel()
                           let title = "สถานะ:"
                           let attributedText = NSMutableAttributedString(string: title,
                                                     attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                           label.attributedText = attributedText
                           label.numberOfLines = 0
                           return label
               }()
    
               let relativeTypeTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "สถานะ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
                   return textField
               }()
               let relativeTypeTextFieldLine: UIView = {
                   let view = UIView()
                   view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
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
        
        navigationItem.title = "ข้อมูลส่วนตัว"

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
              friendPicker.delegate = self
              friendPicker.dataSource = self
              relativeTypeTextField.inputView = friendPicker
        
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            view.addSubview(btnBack)

        
        
            let stacView = UIStackView(arrangedSubviews: [titlerelativeNameLabel,relativeNameTextField,titlerelativePhoneLabel,relativePhoneTextField,titlerelativeTypeLabel,relativeTypeTextField])
                       stacView.distribution = .fillEqually
                       stacView.spacing = 0
                       stacView.axis = .vertical
                    
                       self.relativeNameTextField.delegate = self
                       self.relativePhoneTextField.delegate = self
                       self.relativeTypeTextField.delegate = self
               
                       view.addSubview(viewScroll)
                       viewScroll.addSubview(btnBack)
                       viewScroll.addSubview(stepView)
                       viewScroll.addSubview(BGView)
                       viewScroll.addSubview(titleLabel)
                       viewScroll.addSubview(stacView)
                       viewScroll.addSubview(nextButton)
                       viewScroll.addSubview(relativeKTextFieldLine)
                       viewScroll.addSubview(relativePhoneTextFieldLine)
                       viewScroll.addSubview(relativeTypeTextFieldLine)
                       
        
        
                  
        
                viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                     
                    btnBack.anchor(viewScroll.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 25, rightConstant: 0, widthConstant: 20, heightConstant: 20
               )
        
                    stepView.anchor(btnBack.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX - 0, heightConstant: 110)


                       
                    BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nextButton.topAnchor, topConstant: 20, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: screenSizeY)

                    stacView.anchor(titleLabel.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 50, bottomConstant: 50, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 400)
                       //stacView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
                        
                    titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
                    
                    relativeKTextFieldLine.anchor(relativeNameTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
                        
                    relativePhoneTextFieldLine.anchor(relativePhoneTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

                    relativeTypeTextFieldLine.anchor(relativeTypeTextField.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

                       
                    nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 60)
                       // Do any additional setup after loading the view.
                   }

    }

