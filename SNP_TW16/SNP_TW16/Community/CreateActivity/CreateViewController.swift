//
//  CreateViewController.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
class CreateViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate{
//        var activity = [Activity]()
        var username = String()
        var user_id = String()
        var imageViewPro = String()
        let defaultValues = UserDefaults.standard
    
        let URL_USER_CreatePost = "http://localhost/alder_iosapp/v1/create_post.php"
//     let URL_USER_CreatePost = "http://172.20.10.5/alder_iosapp/v1/create_post.php"
        var ImageProfile = UIImage()
    
        override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              self.tabBarController?.tabBar.isHidden = true
        }
    
        let Imagelabel : UIImageView = {
            let view1 = UIImageView()
            view1.image = UIImage(named: "petr")
            view1.layer.masksToBounds = true
            view1.layer.cornerRadius = 80/2
            return view1
        }()
        

        let namelabel : UILabel = {
            let view2 = UILabel()
            view2.text = "คุณสมศรี"
            view2.font = UIFont.PoppinsBold(size: 20)
            return view2
        }()
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
               {
                   imageView.image = image
               }else{

               }
               self.dismiss(animated: true, completion: nil)
           }
    
     let contentTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "เพิ่มข้อความ", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
            textField.font = UIFont.PoppinsRegular(size:18)
            textField.textColor = UIColor.blackAlpha(alpha: 0.7)
            textField.layer.borderColor = UIColor.whiteAlpha(alpha: 0.9).cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 15
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            textField.leftViewMode = UITextField.ViewMode.always
//            textField.keyboardType = UIKeyboardType.numberPad
            return textField
        }()
    
        let imageView : UIImageView = {
                let image = UIImageView()
                image.image = UIImage(named: "input")
                image.layer.cornerRadius = 70/2
                image.contentMode = .scaleAspectFit
                image.layer.masksToBounds = true
                return image
        }()
        
        let btn: UIButton = {
            let btnimg = UIButton()
//            btnimg.backgroundColor = .blue
            btnimg.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
            return btnimg
        }()
    
    
    @objc func uploadImage(){
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }

     let submitButton : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.backgroundColor = UIColor.white
            submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            submit.layer.borderWidth = 2
            submit.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
            submit.layer.cornerRadius = 20
            submit.setTitle("โพสต์", for: .normal)
            submit.setTitleColor(UIColor.white,for: .normal)
            submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            submit.addTarget(self, action: #selector(postContent), for: .touchUpInside)
            return submit
        }()
    
    
    @objc func postContent(){
        guard let image = imageView.image else { return }
        let parameters: Parameters = ["user_app_id":user_id,"caption":contentTextField.text!]
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
           }, to: URL_USER_CreatePost ,method: .post ,headers: header) { (res) in
               switch res{
               case .success(let request, _, _): 
               request.responseJSON(completionHandler: { (resJson) in
                   print(resJson.value ?? "0")
                   self.navigationController?.popViewController(animated: true)
               })
               case .failure(_):
                   print("fail")
               }
         }
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
    
    ////hide keyborad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//          let backButton = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
//         navigationItem.leftBarButtonItem = backButton
//        view.addSubview(btnBack)
        
        if let name = defaultValues.string(forKey: "userName") {
            username = name
            namelabel.text = username
            print(username)
        }
        
        if let name2 = defaultValues.string(forKey: "userId") {
                      user_id = name2
            print(user_id)
         }else{
                      //send back to login view controller
        }
        
        if let name3 = defaultValues.string(forKey: "ImageUser") {
                       imageViewPro = name3
            
//            ("http://localhost/alder_iosapp/" + (headerActivity?.img ?? "0")!)
            Alamofire.request("http://localhost/alder_iosapp/" + (imageViewPro ?? "0")!).responseImage { response in
                        if let image = response.result.value {
                        self.Imagelabel.image = image
                }
            }
        }else{
                                      //send back to login view controller
            
        }
        
        view.addSubview(Imagelabel)
        view.addSubview(namelabel)
        view.addSubview(contentTextField)
        view.addSubview(imageView)
        view.addSubview(btn)
        view.addSubview(submitButton)
        
        view.backgroundColor = .white
        
        Imagelabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: namelabel.leftAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 35, widthConstant: 80, heightConstant: 80)
               
        namelabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: Imagelabel.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 115, rightConstant: 40, widthConstant: 220, heightConstant: 50)

        contentTextField.anchor(Imagelabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 300, heightConstant: 40)
               
        imageView.anchor(contentTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 200)
        
        btn.anchor(imageView.topAnchor, left: imageView.leftAnchor, right: imageView.rightAnchor, bottom: imageView.bottomAnchor, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        submitButton.anchor(imageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 100, rightConstant: 100, widthConstant: 200, heightConstant: 70)
    }
}
