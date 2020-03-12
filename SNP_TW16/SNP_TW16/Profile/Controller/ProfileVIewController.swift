//
//  ProfileVIewController.swift
//  SNP_TW16
//
//  Created by Guide on 2/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import MultiDegreeLikeButton
class ProfileVIewController: UIViewController,UINavigationControllerDelegate{
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    let URL_GET_PROFILE = "\(AppDelegate.link)alder_iosapp/v1/showProfile.php"
//    let URL_GET_PROFILE = "http://172.20.10.5/alder_iosapp/v1/showProfile.php"
    lazy var defaultValues = UserDefaults.standard
    lazy var getIduser = String()
    lazy var ImageProfiles = String()
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          reloadData()
//          navigationController?.navigationBar.isHidden = true
    }

    lazy var viewScroll: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    lazy var stepView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var bgImageProfile:UIView = {
        let background = UIView()
        return background
    }()
    
    lazy var imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Intersection 4")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var bgImageView : UIImageView = {
           let image = UIImageView()
           return image
    }()
    
    lazy var BGView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            return view
    }()
    
    lazy var profileImageView : UIImageView = {
             let image = UIImageView()
                   image.backgroundColor = UIColor.white
                   image.layer.cornerRadius = 160/2
                   image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                   image.layer.shadowOpacity = 0.1
                   image.layer.shadowOffset = CGSize(width: 0, height: 0)
                   image.layer.shadowRadius = 10
                   image.layer.shouldRasterize = true
             return image
    }()
    
    lazy var ImageProfile : UIImageView = {
               let image = UIImageView()
                     image.backgroundColor = UIColor.black
                     image.layer.cornerRadius = 142/2
                     image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                     image.layer.shadowOpacity = 0.1
                     image.layer.shadowOffset = CGSize(width: 0, height: 0)
                     image.layer.shadowRadius = 10
                     image.image = UIImage(named: "tiko")
                     image.contentMode = .scaleAspectFill
                     image.layer.masksToBounds = true
                     image.layer.shouldRasterize = true
               return image
    }()
    
   lazy var editProfile : UIButton = {
              let submit = UIButton(type: UIButton.ButtonType.system)
              submit.setTitle("แก้ไขข้อมูลส่วนตัว", for: .normal)
              submit.setTitleColor(UIColor.rgb(red: 167, green: 169, blue: 172),for: .normal)
              submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
              submit.addTarget(self, action: #selector(editUser), for: .touchUpInside)
              return submit
    }()
    
    @objc func editUser(){
        let EditVuew = editProfileView()
        navigationController?.pushViewController(EditVuew, animated: true)
    }
    
    lazy var nameHeader : UILabel = {
        let label = UILabel()
        let title = "รัตน์มณี"
      let style = NSMutableParagraphStyle()
       style.alignment = NSTextAlignment.center
       let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var surnameHeader : UILabel = {
          let label = UILabel()
          let title = "รัตน์มณี"
        let style = NSMutableParagraphStyle()
         style.alignment = NSTextAlignment.center
         let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.attributedText = attributedText
          label.numberOfLines = 0
          return label
      }()
    
    lazy var viewNursing : UIView = {
           let view = UIView()
           return view
    }()
    
    lazy var viewIconNursing : UIView = {
              let view = UIView()
              return view
    }()
    
 
            
    
    lazy var nursingHome : UILabel = {
        let label = UILabel()
        let title = "Chersery Home"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()

 
    
    lazy var iconNursingHome : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "locatePlace")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var line: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
            return view
    }() //-----------------------------------------------------------------------------------------------
    
    lazy var birthday : UILabel = {
        let label = UILabel()
        let title = "28 กุมภาพันธ์ 2500"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()

    
    
    lazy var iconbirthday : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "birthdayCake")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    
    lazy var tel : UILabel = {
        let label = UILabel()
        let title = "089 - 446 - 3444"
        let style = NSMutableParagraphStyle()
              style.alignment = NSTextAlignment.center
              let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        return label
    }()

    
    
    lazy var icontel : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "24Hourss")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var viewAlige : UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
    }()
    
    lazy var dataUser  : UIView = {
           let image = UIImageView()
           image.backgroundColor = UIColor.white
           image.layer.cornerRadius = 10
           image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
           image.layer.shadowOpacity = 0.1
           image.layer.shadowOffset = CGSize(width: 0, height: 0)
           image.layer.shadowRadius = 10
           image.layer.shouldRasterize = true
           return image
    }()
    
    
    lazy var iconPost : UIImageView = {
          let image = UIImageView()
          image.image = UIImage(named: "surface")
          image.contentMode = .scaleAspectFit
          image.layer.masksToBounds = true
          return image
    }()
      
    
    lazy var postUser : UIButton = {
         let image = UIButton(type: UIButton.ButtonType.system)
         image.backgroundColor = UIColor.white
         image.layer.cornerRadius = 10
         image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
         image.layer.shadowOpacity = 0.1
         image.layer.shadowOffset = CGSize(width: 0, height: 0)
         image.layer.shadowRadius = 10
         image.layer.shouldRasterize = true
         image.setTitle("กระทู้ของฉัน", for: .normal)
         image.contentVerticalAlignment = .bottom
         image.setTitleColor(UIColor.black,for: .normal)
         image.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
         image.addTarget(self, action: #selector(listUserPost), for: .touchUpInside)
         return image
    }()
    
    
    @objc func listUserPost(){
        showPostView()
    }
    
    
    func showPostView(){
        let PostView = listPostUserTableView()
        navigationController?.pushViewController(PostView, animated: true)
    }
    
    @objc func listUserActivity(){
        showActivityView()
    }
    
    
    func showActivityView(){
            let ActivityView = InviteActivityViewController()
            navigationController?.pushViewController(ActivityView, animated: true)
    }
    
    lazy var iconActivity : UIImageView = {
             let image = UIImageView()
             image.image = UIImage(named: "history")
             image.layer.masksToBounds = true
             image.contentMode = .scaleAspectFit
             return image
    }()
         
    
    lazy var activityUser : UIButton = {
            let image = UIButton(type: UIButton.ButtonType.system)
            image.backgroundColor = UIColor.white
            image.layer.cornerRadius = 10
            image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            image.layer.shadowOpacity = 0.1
            image.layer.shadowOffset = CGSize(width: 0, height: 0)
            image.layer.shadowRadius = 10
            image.layer.shouldRasterize = true
            image.setTitle("กิจกรรมของฉัน", for: .normal)
            image.contentVerticalAlignment = .bottom
            image.setTitleColor(UIColor.black,for: .normal)
            image.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            image.addTarget(self, action: #selector(listUserActivity), for: .touchUpInside)
            return image
    }()
    
    func reloadData(){
        let parameters: Parameters = ["userId":getIduser]
              let url = URL_GET_PROFILE + "?id=\(getIduser)"
              Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                        print(resData)
                        if let user = resData.result.value as! [String: Any]? {
                            print(user)
                                if let yield = user["username"] as? String{
                                    self?.nameHeader.text = yield
                                    self?.nameHeader.font = UIFont.PoppinsBold(size: 18)
                                }
                            
                                if let yield = user["surname"] as? String{
                                    self?.surnameHeader.text = yield
                                    self?.surnameHeader.font = UIFont.PoppinsBold(size: 18)
                                }
                   
                                if let yield = user["address"] as? String{
                                    self?.nursingHome.text = yield
                                }
                            
                                if let yield = user["birthday"] as? String{
                                     self?.birthday.text = yield
                                }

                                if let yield = user["tel"] as? Int{
                                     self?.tel.text = "\(0)" + "\(yield)"
                                }
                            
                                if let yield = user["photo"] as? String{
                                        Alamofire.request("\(AppDelegate.link)alder_iosapp/" + yield).responseImage { response in
                                        if let image = response.result.value {
                                            self?.ImageProfile.image = image
                                              }
                                      }
                               }
                       }
                
              }
    }
    


               @objc func handelSetting(){
                        print("5555")
                let notificaionView = NotificationTableView()
                navigationController?.pushViewController(notificaionView, animated: true)
             }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Alder"
     
        let settings = UIBarButtonItem(image: UIImage(named: "bell"), style: .plain, target: self, action: #selector(handelSetting))
        settings.width = 0.5
        settings.tintColor = UIColor.rgb(red: 253, green: 173, blue: 82)
        navigationItem.rightBarButtonItem = settings
        let stacView = UIStackView(arrangedSubviews:[nameHeader,surnameHeader])
        stacView.distribution = .fillEqually
        stacView.spacing = 0
        stacView.axis = .horizontal
        
        let stacView2 = UIStackView(arrangedSubviews:[activityUser,postUser])
        stacView2.distribution = .fillEqually
        stacView2.spacing = 20
        stacView2.axis = .horizontal
        
        view.backgroundColor = UIColor.rgb(red: 247, green: 250, blue: 255)
        view.addSubview(viewScroll)
        viewScroll.addSubview(stepView)
        viewScroll.addSubview(imageView)
        viewScroll.addSubview(BGView)
        viewScroll.addSubview(bgImageProfile)
        viewScroll.addSubview(profileImageView)
        viewScroll.addSubview(ImageProfile)
        viewScroll.addSubview(editProfile)
        viewScroll.addSubview(dataUser)
        viewScroll.addSubview(stacView)
        viewScroll.addSubview(iconNursingHome)
        viewScroll.addSubview(nursingHome)
        viewScroll.addSubview(line)
        viewScroll.addSubview(tel)
        viewScroll.addSubview(icontel)
        viewScroll.addSubview(stacView2)
        viewScroll.addSubview(birthday)
        viewScroll.addSubview(iconbirthday)
        viewScroll.addSubview(iconPost)
        viewScroll.addSubview(iconActivity)

        viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        imageView.anchor(view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 500)
        
        BGView.anchor(stepView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant:0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
                
        bgImageProfile.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: editProfile.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 150)
        
        profileImageView.anchor(bgImageProfile.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        profileImageView.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        ImageProfile.anchor(profileImageView.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        ImageProfile.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true
        
        editProfile.anchor(bgImageProfile.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 100, rightConstant: 100, widthConstant: screenSizeX, heightConstant: 100)

        dataUser.anchor(editProfile.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 280)

        stacView.anchor(dataUser.topAnchor, left: dataUser.leftAnchor, right: dataUser.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 80)
        
        iconNursingHome.anchor(stacView.bottomAnchor, left: nil, right: nursingHome.leftAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        nursingHome.anchor(stacView.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: -15, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        nursingHome.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        
        line.anchor(nursingHome.bottomAnchor, left: dataUser.leftAnchor, right: dataUser.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 0, rightConstant: 0 , widthConstant: 0, heightConstant: 1)

        iconbirthday.anchor(line.bottomAnchor, left: nil, right: birthday.leftAnchor, bottom: nil, topConstant: 35, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 20, heightConstant: 20)

        birthday.anchor(line.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 24, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        birthday.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true


        icontel.anchor(birthday.bottomAnchor, left: nil, right: tel.leftAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 20, heightConstant: 20)

        tel.anchor(birthday.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 4, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        tel.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true
        
    
        stacView2.anchor(dataUser.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 35, bottomConstant: 30, leftConstant: 15, rightConstant: 15, widthConstant: screenSizeX, heightConstant: 120)

        iconActivity.anchor(activityUser.topAnchor, left: activityUser.leftAnchor, right:activityUser.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: iconActivity.frame.size.width , heightConstant: iconActivity.frame.size.height )
        
        iconPost.anchor(postUser.topAnchor, left: postUser.leftAnchor, right:postUser.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 75, rightConstant: 75, widthConstant: iconPost.frame.size.width, heightConstant: iconPost.frame.size.height)


        if let name = defaultValues.string(forKey: "userId") {
                getIduser = name
                print(getIduser)
        }
            
    }
    
}
