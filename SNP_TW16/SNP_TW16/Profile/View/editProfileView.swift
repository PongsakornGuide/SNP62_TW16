//
//  editProfileView.swift
//  SNP_TW16
//
//  Created by Guide on 11/2/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class editProfileView: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
       override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              reloadData()
              self.tabBarController?.tabBar.isHidden = true
       }
    
       let URL_GET_EDIT_PROFILE = "\(AppDelegate.link)alder_iosapp/v1/showProfile.php"
       let URL_POST_EDIT_PROFILE = "\(AppDelegate.link)alder_iosapp/v1/update.php"
       lazy var getIduser = String()
       lazy var defaultValues = UserDefaults.standard
       lazy var NumberPhoneLabelText = String()
       lazy var imageTy = UIImage()
       private var datePicker : UIDatePicker?
       lazy var picker1 = UIPickerView()
       let screenSizeX: CGFloat = UIScreen.main.bounds.width
       let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
       var viewScroll: UIScrollView = {
           let view = UIScrollView()
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
            view.contentMode = .scaleAspectFit
            view.layer.masksToBounds = true
           return view
       }()
    
    lazy var uploadImage: UIButton = {
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
    

    
    
    lazy var BGView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.layer.cornerRadius = 20
           return view
    }()
    
    lazy var BGView2: UIView = {
              let view = UIView()
              view.backgroundColor = .white
              view.layer.cornerRadius = 20
              return view
    }()
    
    lazy var nextButton: UIButton = {
           let button = UIButton(type: .system)
           button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
           button.layer.cornerRadius = 20
           button.setTitle("บันทึก", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
           button.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
           return button
    }()

    lazy var imageView : UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "maskGroup48")
           image.contentMode = .scaleAspectFill
           image.layer.masksToBounds = true
           return image
       }()
    
    @objc func actionJoin(){
        let popOverVC = AlertEditProfileCompleteViewController()
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @objc func actionComplete(){
        
        let checkData = nameTextField.text?.count ?? 0 > 1 && surnameTextField.text?.count ?? 0 > 1 && dateTextField.text?.count ?? 0 > 1

        if !checkData {
            print("NO")
        }else{
           guard let image = self.imgView.image else { return }
            let url = self.URL_POST_EDIT_PROFILE + "?id=\(self.getIduser)"
            let parameters: Parameters = ["id":self.getIduser ,"username":self.nameTextField.text ?? "nil","surname":self.surnameTextField.text ?? "nil","photo":"\(self.imgView.image)","birthday" ?? "nil":self.dateTextField.text ?? "00-00-00","relative_name":self.nameRelativeTextField.text ?? "nil","relative_phone":self.telRelativeTextField.text ?? "nil","relative_type":self.relativeTextField.text ?? "nil"]
            print(parameters)
            let header: HTTPHeaders = ["Content-type":"multipart/form-data"]
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyyMMddHH:mm:ss"
            let date = Date()
            let dateString = dateFormatter.string(from: date)
                Alamofire.upload(multipartFormData: { (formData) in
                    if let imageData = image.jpegData(compressionQuality: 0.5){
                        formData.append(imageData, withName: "image" ,fileName: dateString,mimeType: "image/jpg")
                    }
                    for (key,value) in parameters {
                        if let stringData = value as? String, let data = stringData.data(using: .utf8) {
                            formData.append(data, withName: key)
                        }
                    }
                }, to: url ,method: .post ,headers: header) { (res) in
                    print(url)
                    switch res{
                        case .success(let request, _, _):
                            request.responseJSON(completionHandler: { (resJson) in
                                print(resJson.value ?? "0")
                                self.navigationController?.popToRootViewController(animated: true)
                            })
                        case .failure(_):
                            print("fail")
                    }
                }

            
        }
        
    }
    
    @objc func editProfile (){
             let popOverVC = AlertEditProfileViewController()
             self.addChild(popOverVC)
             popOverVC.view.frame = self.view.frame
             self.view.addSubview(popOverVC.view)
             popOverVC.didMove(toParent: self)
    }

        lazy var titleLabel : UILabel = {
            let label = UILabel()
            let title = "ข้อมูลส่วนตัว"
            let attributedText = NSMutableAttributedString(string: title,
        attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.attributedText = attributedText
            label.numberOfLines = 0
            return label
        }()
    
    //-----------------------------------------------------------------------------------------------
    
    
        lazy var titleNameLabel : UILabel = {
             let label = UILabel()
             let title = "ชื่อ:"
             let attributedText = NSMutableAttributedString(string: title,
         attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
             label.attributedText = attributedText
             label.numberOfLines = 0
             return label
       }()
    
       lazy var nameTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "ชื่อของคุณ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               return textField
           }()
           lazy var nameTextFieldLine: UIView = {
                  let view = UIView()
                  view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                  return view
           }()
       //-----------------------------------------------------------------------------------------------
        lazy var titleSurnameLabel : UILabel = {
                let label = UILabel()
                let title = "นามสกุล:"
                let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
          }()
           lazy var surnameTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "นามสกุล",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               return textField
           }()
           lazy var surnameTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
           }()
       //-----------------------------------------------------------------------------------------------
        lazy var titleTelLabel : UILabel = {
                  let label = UILabel()
                  let title = "เบอร์โทรศัพท์:"
                  let attributedText = NSMutableAttributedString(string: title,
              attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                  label.attributedText = attributedText
                  label.numberOfLines = 0
                  return label
            }()
           lazy var phoneTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               textField.isUserInteractionEnabled = false
               return textField
           }()
           let phoneTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
           }()
          
       //-----------------------------------------------------------------------------------------------
    
    lazy var titleDateLabel : UILabel = {
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
               textField.attributedPlaceholder = NSAttributedString(string: "ปี / เดือน / วัน", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               return textField
           }()
           let dateTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
    }()

               lazy var useTextField: UITextField = {
                   let textField = UITextField()
                   textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                   textField.textColor = .black
                   textField.isUserInteractionEnabled = false
                   return textField
               }()
     
    
    @objc func dateChanged(datePicker: UIDatePicker) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
            view.endEditing(true)
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
    
    func reloadData(){
        let parameters: Parameters = ["userId":getIduser]
              let url = URL_GET_EDIT_PROFILE + "?id=\(getIduser)"
              Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                        print(resData)
                        if let user = resData.result.value as! [String: Any]? {
                                if let yield = user["username"] as? String {
                                    self?.nameTextField.text = yield
                                    self?.nameTextField.font = UIFont.BaiJamjureeMedium(size: 15)
                                }
                                if let yield = user["surname"] as? String {
                                    self?.surnameTextField.text = yield
                                    self?.surnameTextField.font = UIFont.BaiJamjureeMedium(size: 15)
                                }
//
                                if let yield = user["tel"] as? Int {
                                    self?.phoneTextField.text = "0\(yield)"
                                    self?.phoneTextField.font = UIFont.BaiJamjureeMedium(size: 15)
                                    self?.phoneTextField.textColor = UIColor.rgb(red: 188, green: 188, blue: 188)
                                }
                            
                                if let yield = user["birthday"] as? String{
                                     self?.dateTextField.text = yield
                                     self?.dateTextField.font = UIFont.BaiJamjureeMedium(size: 15)
                                }

                                if let yield = user["photo"] as? String {
                                    let profileImagePath = ("\(AppDelegate.link)alder_iosapp/" + yield)
                                            if let postImageURL = URL(string: profileImagePath) {
                                            self?.imgView.sd_setImage(with: postImageURL, completed: nil)
                                    }
                                }
                            
                                if let yield = user["relative_name"] as? String {
                                    self?.nameRelativeTextField.text = yield
                                    self?.nameRelativeTextField.font = UIFont.BaiJamjureeMedium(size: 15)
                                }
                            //
                                if let yield = user["relative_phone"] as? Int {
                                    self?.telRelativeTextField.text = "0\(yield)"
                                    self?.telRelativeTextField.font = UIFont.BaiJamjureeMedium(size: 15)
//                                    self?.telRelativeTextField.textColor = UIColor.rgb(red: 188, green: 188, blue: 188)
                                }
                                                        
                                if let yield = user["relative_type"] as? String{
                                    self?.relativeTextField.text = yield
                                    self?.relativeTextField.font = UIFont.BaiJamjureeMedium(size: 15)
                                }
                    }
                
            }
    }
    
    //-----------------------------------------------------------------------------------------------
    
    lazy var titleLabel2 : UILabel = {
              let label = UILabel()
              let title = "เบอร์ติดต่อฉุกเฉิน"
              let attributedText = NSMutableAttributedString(string: title,
          attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.red])
              label.attributedText = attributedText
              label.numberOfLines = 0
              return label
    }()
   
    //-----------------------------------------------------------------------------------------------
    
    lazy var titlenameRelativeLabel : UILabel = {
             let label = UILabel()
             let title = "ชื่อญาติ:"
             let attributedText = NSMutableAttributedString(string: title,
         attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
             label.attributedText = attributedText
             label.numberOfLines = 0
             return label
    }()
    
    lazy var nameRelativeTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "ชื่อญาติ", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
            textField.textColor = .black
            return textField
        }()
        lazy var nameRelativeTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
        }()
    //-----------------------------------------------------------------------------------------------
    
    lazy var titletelRelativeLabel : UILabel = {
             let label = UILabel()
             let title = "เบอร์โทรศัพท์:"
             let attributedText = NSMutableAttributedString(string: title,
         attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
             label.attributedText = attributedText
             label.numberOfLines = 0
             return label
    }()
    
        lazy var telRelativeTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "เบอร์โทรศัพท์",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
            textField.textColor = .black
            return textField
        }()
        lazy var telRelativeTextFieldLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
            return view
        }()
    //-----------------------------------------------------------------------------------------------
    
    //-----------------------------------------------------------------------------------------------
    
    lazy var titleRelativeLabel : UILabel = {
             let label = UILabel()
             let title = "ความสัมพันธ์:"
             let attributedText = NSMutableAttributedString(string: title,
         attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
             label.attributedText = attributedText
             label.numberOfLines = 0
             return label
    }()
        lazy var relativeTextField: UITextField = {
               let textField = UITextField()
               textField.attributedPlaceholder = NSAttributedString(string: "ความสัมพันธ์",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
               textField.textColor = .black
               return textField
        }()
        lazy var relativeTextFieldLine: UIView = {
               let view = UIView()
               view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
               return view
        }()
    //-----------------------------------------------------------------------------------------------
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = defaultValues.string(forKey: "userId") {
                getIduser = name
        }
        view.addSubview(btnBack)
        //picker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(editProfileView.dateChanged(datePicker: )), for: .valueChanged)
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(editProfileView.viewTapped(gestureRecognizer:)))
        phoneTextField.text = NumberPhoneLabelText
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        navigationItem.title = "ข้อมูลส่วนตัว"

        let stacView = UIStackView(arrangedSubviews: [titleNameLabel,nameTextField,titleSurnameLabel,surnameTextField,titleTelLabel,phoneTextField,titleDateLabel,dateTextField])
        stacView.distribution = .fillEqually
        stacView.spacing = 0
        stacView.axis = .vertical
        
        let stacView2 = UIStackView(arrangedSubviews: [titlenameRelativeLabel,nameRelativeTextField,titletelRelativeLabel,telRelativeTextField,titleRelativeLabel,relativeTextField])
        stacView2.distribution = .fillEqually
        stacView2.spacing = 0
        stacView2.axis = .vertical
        
        self.nameTextField.delegate = self
        self.surnameTextField.delegate = self
        self.phoneTextField.delegate = self
        self.dateTextField.delegate = self
        
        
        self.nameRelativeTextField.delegate = self
        self.telRelativeTextField.delegate = self
        self.relativeTextField.delegate = self

        view.addSubview(viewScroll)
        viewScroll.addSubview(imageView)
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
        viewScroll.addSubview(BGView2)
        viewScroll.addSubview(stacView2)
        viewScroll.addSubview(titleLabel2)
        viewScroll.addSubview(nameRelativeTextFieldLine)
        viewScroll.addSubview(telRelativeTextFieldLine)
        viewScroll.addSubview(relativeTextFieldLine)
    
        viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
        imageView.anchor(view.safeAreaLayoutGuide.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
               
        
        imgView.anchor(viewScroll.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 60, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
            imgView.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        uploadImage.anchor(imgView.topAnchor, left: nil, right: imgView.rightAnchor, bottom: nil, topConstant: 85, bottomConstant: 0, leftConstant: 0, rightConstant: -15, widthConstant: 70, heightConstant: 70)

        BGView.anchor(imgView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: BGView2.topAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: 0)

        titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 40, bottomConstant: 20, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 20)

        stacView.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView2.topAnchor, topConstant: 40, bottomConstant: 60, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant:400)
        
        nameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        surnameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: surnameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        phoneTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: phoneTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        dateTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: dateTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
       
        BGView2.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: 0)
        
         titleLabel2.anchor(BGView2.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 20)
        
        stacView2.anchor(titleLabel2.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nextButton.topAnchor, topConstant: 10, bottomConstant: 60, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 300)
        
        nameRelativeTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nameRelativeTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        telRelativeTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: telRelativeTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)
        
        relativeTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: relativeTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        nextButton.anchor(BGView2.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 60)
       }

}
