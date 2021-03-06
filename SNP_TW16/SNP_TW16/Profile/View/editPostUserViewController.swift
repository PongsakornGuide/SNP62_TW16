//
//  editPostUserViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 12/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class editPostUserViewController: UIViewController ,UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    
        let screenSizeX: CGFloat = UIScreen.main.bounds.width
        let screenSizeY: CGFloat = UIScreen.main.bounds.height

        lazy var username = String()
        lazy var user_id = String()
        lazy var imageViewPro = String()
        lazy var post_id = Int()
        lazy var defaultValues = UserDefaults.standard
        let URL_SHOW_POST = "\(AppDelegate.link)alder_iosapp/v1/showPostUser.php"
        let URL_UPDATE_POST = "\(AppDelegate.link)alder_iosapp/v1/updatePost.php"
        lazy var ImageProfile = UIImage()
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = true
        }
        
        lazy var bgView: UIView = {
            let background = UIView()
            background.backgroundColor = UIColor.white
            background.layer.cornerRadius = 20
            background.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            background.layer.shadowOpacity = 0.1
            background.layer.shadowOffset = CGSize(width: 0, height: 0)
            background.layer.shadowRadius = 10
            background.layer.shouldRasterize = true
            return background
        }()
        
        lazy var Imagelabel : UIImageView = {
            let view1 = UIImageView()
            view1.image = UIImage(named: "petr")
            view1.layer.masksToBounds = true
            view1.layer.cornerRadius = 80/2
            view1.contentMode = .scaleAspectFill
            return view1
        }()
        
         //-----------------------------------------------------------------------------------------------

        lazy var namelabel : UILabel = {
            let view2 = UILabel()
            view2.text = "คุณสมศรี"
            view2.font = UIFont.BaiJamjureeBold(size: 20)
            return view2
        }()
        //-----------------------------------------------------------------------------------------------
            
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                imageView.image = image
            }else{
            }
                self.dismiss(animated: true, completion: nil)
        }
        
        //-----------------------------------------------------------------------------------------------
        
        lazy var contentTextField: UITextField = {
                let textField = UITextField()
                      textField.attributedPlaceholder = NSAttributedString(string: "เพิ่มข้อความ . . .", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                      textField.font = UIFont.BaiJamjureeRegular(size:18)
                      textField.textColor = UIColor.blackAlpha(alpha: 0.7)
                      textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
                      textField.layer.borderWidth = 1
                      textField.layer.cornerRadius = 10
                      textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                      textField.leftViewMode = UITextField.ViewMode.always
        return textField
         }()
        
        //-----------------------------------------------------------------------------------------------
        
        lazy var imageView : UIImageView = {
                    let image = UIImageView()
                    image.image = UIImage(named: "input")
                    image.layer.cornerRadius = 70/2
                    image.contentMode = .scaleAspectFit
                    image.layer.masksToBounds = true
                    return image
        }()
        
        //-----------------------------------------------------------------------------------------------
        
        lazy var btn: UIButton = {
                let btnimg = UIButton()
                btnimg.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
                return btnimg
        }()
        
        //-----------------------------------------------------------------------------------------------
        
        @objc func uploadImage(){
                let image = UIImagePickerController()
                image.delegate = self
                image.sourceType = UIImagePickerController.SourceType.photoLibrary
                image.allowsEditing = false
                self.present(image, animated: true)
        }

        //-----------------------------------------------------------------------------------------------
        
        var submitButton : UIButton = {
                let submit = UIButton(type: UIButton.ButtonType.system)
                submit.backgroundColor = UIColor.white
                submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
                submit.layer.borderWidth = 2
                submit.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                submit.layer.cornerRadius = 20
                submit.setTitle("โพสต์", for: .normal)
                submit.setTitleColor(UIColor.white,for: .normal)
                submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
                submit.addTarget(self, action: #selector(postContent), for: .touchUpInside)
                return submit
            }()
        
        //-----------------------------------------------------------------------------------------------
           
        lazy var alertLabel : UILabel = {
            let label = UILabel()
            label.text = "กรุณากรอกข้อมูลให้ครบถ้วน"
            label.textColor = .red
            label.textAlignment = .center
            label.font = UIFont.BaiJamjureeBold(size: 18)
            return label
          }()
        
        //-----------------------------------------------------------------------------------------------
        
    
    
        func reloadData(){
            let parameters: Parameters = ["id":post_id]
                  let url = URL_SHOW_POST + "?id=\(post_id)"
                  Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                    
                            print(resData)
                            if let user = resData.result.value as! [String: Any]? {
                                    if let yield = user["caption"] as? String{
                                        self?.contentTextField.text = yield
                                        self?.contentTextField.font = UIFont.BaiJamjureeBold(size: 20)
                                    }

 
                                    if let yield = user["img"] as? String{

                                        let profileImagePath = ("\(AppDelegate.link)alder_iosapp/" + yield)
                                                if let postImageURL = URL(string: profileImagePath) {
                                                self?.imageView.sd_setImage(with: postImageURL, completed: nil)
                                        }
                                }
                        }
                }
        }
    
    //-----------------------------------------------------------------------------------------------
//    updatePostUserAct.php?id=1
        @objc func postContent(){
            let checkCaption = contentTextField.text?.count ?? 0 > 1 && imageView.image != nil
            if !checkCaption{
                alertLabel.isHidden = false
            }else{
                        guard let image = imageView.image else { return }
                        let urlforFunc = URL_UPDATE_POST + "?id=\(self.post_id)"
                let parameters: Parameters = ["id":"\(self.post_id)","caption":self.contentTextField.text!,"img":"\(self.imageView.image)"]
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
                           }, to: urlforFunc ,method: .post ,headers: header) { (res) in
                            print(urlforFunc)
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
           
        @objc func keyboardWillHide(notification: NSNotification) {
                        if self.view.frame.origin.y != 0 {
                            self.view.frame.origin.y = 0
                        }
                    }

        @objc func keyboardWillShow(notification: NSNotification) {
                  if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                      if self.view.frame.origin.y == 0 {
                       self.view.frame.origin.y -= keyboardSize.height
                           //keyboardSize.height
                      }
                  }
        }
        
        @objc func performSegueToReturnBack()  {
               if let nav = self.navigationController {
                   nav.popToRootViewController(animated: true)
               } else {
                   self.dismiss(animated: true, completion: nil)
               }
        }
        
        //-----------------------------------------------------------------------------------------------
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              self.view.endEditing(true)
        }
        
        //-----------------------------------------------------------------------------------------------
        
        override func viewDidLoad() {
            super.viewDidLoad()
            reloadData()
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
            
            if let name = defaultValues.string(forKey: "userName") {
                username = name
                namelabel.text = username
            }
//
//        //-----------------------------------------------------------------------------------------------
//
            if let name2 = defaultValues.string(forKey: "userId") {
                          user_id = name2
                print(user_id)
                print(post_id)
            }
//        //-----------------------------------------------------------------------------------------------
//
            if let name3 = defaultValues.string(forKey: "ImageUser") {
                           imageViewPro = name3
                            let profileImagePath = ("\(AppDelegate.link)alder_iosapp/" + (imageViewPro ))
                                    if let postImageURL = URL(string: profileImagePath) {
                                    self.Imagelabel.sd_setImage(with: postImageURL, completed: nil)
                            }
                

            }
            
          //-----------------------------------------------------------------------------------------------

            view.backgroundColor = .white
            alertLabel.isHidden = true
            
            view.addSubview(bgView)
            view.addSubview(Imagelabel)
            view.addSubview(namelabel)
            view.addSubview(contentTextField)
            view.addSubview(imageView)
            view.addSubview(btn)
            view.addSubview(submitButton)
            view.addSubview(alertLabel)
            
           bgView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
            
             Imagelabel.anchor(bgView.topAnchor, left: contentTextField.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 0, rightConstant: 30, widthConstant: 80, heightConstant: 80)
                 
            namelabel.anchor(bgView.topAnchor, left: Imagelabel.rightAnchor, right: nil, bottom: nil, topConstant: 55, bottomConstant: 0, leftConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
            contentTextField.anchor(Imagelabel.bottomAnchor, left: view.leftAnchor, right:  view.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 40)
                  
            contentTextField.widthAnchor.constraint(lessThanOrEqualToConstant: screenSizeX - 40).isActive = true
                  
            imageView.anchor(contentTextField.bottomAnchor, left: contentTextField.leftAnchor, right: contentTextField.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 280)
                  
            btn.anchor(imageView.topAnchor, left: imageView.leftAnchor, right: imageView.rightAnchor, bottom: imageView.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 250)


            submitButton.anchor(btn.bottomAnchor, left: imageView.leftAnchor, right: imageView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)

            alertLabel.anchor(submitButton.bottomAnchor, left: submitButton.leftAnchor, right: submitButton.rightAnchor, bottom: bgView.bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 30)
        }
}
