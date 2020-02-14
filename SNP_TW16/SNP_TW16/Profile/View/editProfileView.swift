//
//  editProfileView.swift
//  SNP_TW16
//
//  Created by Guide on 11/2/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class editProfileView: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    
       override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              reloadData()
            
       }
    
       let URL_GET_EDIT_PROFILE = "http://localhost/alder_iosapp/v1/showProfile.php"
       let URL_POST_EDIT_PROFILE = "http://localhost/alder_iosapp/v1/update.php"
       var getIduser = String()
       let defaultValues = UserDefaults.standard
       var NumberPhoneLabelText = String()
       var imageTy = UIImage()
       private var datePicker : UIDatePicker?
       var picker1 = UIPickerView()
       let screenSizeX: CGFloat = UIScreen.main.bounds.width
       let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
       var viewScroll: UIScrollView = {
           let view = UIScrollView()
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
           button.setTitle("บันทึก", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
           button.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
           return button
       }()

    @objc func editProfile (){
        guard let image = imgView.image else { return }
        let url = URL_POST_EDIT_PROFILE + "?id=\(getIduser)"
        let parameters: Parameters =
            ["id":getIduser ,"username":nameTextField.text ?? "nil","surname":surnameTextField.text ?? "nil","photo":"\(imgView.image)",
             "birthday" ?? "nil":dateTextField.text ?? "00-00-00"]
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
               textField.font = UIFont.boldSystemFont(ofSize: 15)
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
               textField.font = UIFont.boldSystemFont(ofSize: 15)
//                textField.userInteractionEnabled = false
               textField.isUserInteractionEnabled = false
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
               textField.font = UIFont.boldSystemFont(ofSize: 15)
               return textField
           }()
           let dateTextFieldLine: UIView = {
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
                                if let yield = user["username"] as? String{
                                    self?.nameTextField.text = yield
                                    self?.nameTextField.font = UIFont.PoppinsBold(size: 20)
                                }
                                if let yield = user["surname"] as? String{
                                    self?.surnameTextField.text = yield
                                    self?.surnameTextField.font = UIFont.PoppinsBold(size: 20)
                                }
//
                                if let yield = user["tel"] as? Int{
                                    self?.phoneTextField.text = "0\(yield)"
                                    self?.phoneTextField.font = UIFont.PoppinsBold(size: 20)
                                    self?.phoneTextField.textColor = UIColor.rgb(red: 188, green: 188, blue: 188)
                                }
                            
                                if let yield = user["birthday"] as? String{
                                     self?.dateTextField.text = yield
                                    self?.dateTextField.font = UIFont.PoppinsBold(size: 20)
                                }

                                if let yield = user["photo"] as? String{
                                    Alamofire.request("http://localhost/alder_iosapp/" + yield).responseImage { response in
                                        if let image = response.result.value {
                                                self?.imgView.image = image
                                            }
                                    }
                                }
                    }
                
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = defaultValues.string(forKey: "userId") {
                getIduser = name
                print("ID User :: \(getIduser)")
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
        let stacView = UIStackView(arrangedSubviews: [nameTextField,surnameTextField,phoneTextField,dateTextField])
        stacView.distribution = .fillEqually
        stacView.spacing = 0
        stacView.axis = .vertical
        self.nameTextField.delegate = self
        self.surnameTextField.delegate = self
        self.phoneTextField.delegate = self
        self.dateTextField.delegate = self
           
        view.addSubview(viewScroll)
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
    
           
        viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
        imgView.anchor(BGView.topAnchor, left: nil, right: nil, bottom: nil, topConstant: -60, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
            imgView.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        uploadImage.anchor(imgView.topAnchor, left: nil, right: imgView.rightAnchor, bottom: nil, topConstant: 75, bottomConstant: 0, leftConstant: 0, rightConstant: -15, widthConstant: 70, heightConstant: 70)

        BGView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nextButton.topAnchor, topConstant: 100, bottomConstant: 40, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: screenSizeY)

        stacView.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 100, bottomConstant: 50, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 100, heightConstant: 700)

        titleLabel.anchor(BGView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stacView.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        nameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        surnameTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: surnameTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        phoneTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: phoneTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

        dateTextFieldLine.anchor(nil, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: dateTextField.bottomAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 40, rightConstant: 40 , widthConstant: screenSizeX - 140, heightConstant: 1.5)

  
        nextButton.anchor(BGView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 80, rightConstant: 80, widthConstant: screenSizeX - 160, heightConstant: 70)
           // Do any additional setup after loading the view.
       }

}
