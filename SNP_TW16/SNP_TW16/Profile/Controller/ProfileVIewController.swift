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
import SDWebImage
class ProfileVIewController: UIViewController,UINavigationControllerDelegate{
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    let URL_GET_PROFILE = "\(AppDelegate.link)alder_iosapp/v1/showProfile.php"
    let URL_GET_COUNT_JOIN_ACTIVITY_START = "\(AppDelegate.link)alder_iosapp/v1/countJoinActivityStart.php"
    let URL_GET_COUNT_JOIN_ACTIVITY_END = "\(AppDelegate.link)alder_iosapp/v1/countJoinActivityEnd.php"
    lazy var defaultValues = UserDefaults.standard
    lazy var getIduser = String()
    lazy var ImageProfiles = String()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        reloadData()
        reloadCountDataStart()
        reloadCountDataEnd()
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
        image.image = UIImage(named: "maskGroup48")
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
    
            let attributedString = NSAttributedString(string: NSLocalizedString("แก้ไขข้อมูลส่วนตัว", comment: ""), attributes:[
                NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 18),
                NSAttributedString.Key.foregroundColor : UIColor.gray,
                NSAttributedString.Key.underlineStyle:1.0
                ])
                submit.setAttributedTitle(attributedString, for: .normal)
              submit.setTitleColor(UIColor.rgb(red: 167, green: 169, blue: 172),for: .normal)
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
       let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var surnameHeader : UILabel = {
          let label = UILabel()
          let title = "รัตน์มณี"
        let style = NSMutableParagraphStyle()
         style.alignment = NSTextAlignment.center
         let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
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
        let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
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
        let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
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
              let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
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
         image.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
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
             image.image = UIImage(named: "group1285")
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
            image.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
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
                                    self?.nameHeader.font = UIFont.BaiJamjureeBold(size: 22)
                                }
                            
                                if let yield = user["surname"] as? String{
                                    self?.surnameHeader.text = yield
                                    self?.surnameHeader.font = UIFont.BaiJamjureeBold(size: 22)
                                }
                   
                                if let yield = user["address"] as? String{
                                    self?.nursingHome.text = yield
                                    self?.nursingHome.font = UIFont.BaiJamjureeMedium(size: 20)
                                }
                            
                                if let yield = user["birthday"] as? String{
                                    
                                    let mouthStart = DateFormatter()
                                    mouthStart.dateFormat = "yyyy-MM-dd"
                                    let date = mouthStart.date(from: yield)
                                    mouthStart.dateFormat = "d MMMM yyyy"
                                    let mouthStringStart = mouthStart.string(from: date ?? Date())
                                    self?.birthday.text = "\(mouthStringStart)"
                                    self?.birthday.font = UIFont.BaiJamjureeMedium(size: 20)
                                    
//                                   self?.birthday.text = yield
                                }

                                if let yield = user["tel"] as? Int{
                                     self?.tel.text = "\(0)" + "\(yield)"
                                    self?.tel.font = UIFont.BaiJamjureeMedium(size: 20)
                                }
                            
                                if let yield = user["photo"] as? String{
                                    
                                let postImagePath = ("\(AppDelegate.link)alder_iosapp/" + yield)
                                    if let postImageURL = URL(string: postImagePath) {
                                        self?.ImageProfile.sd_setImage(with: postImageURL, completed: nil)
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
    
    
    

    lazy var pointAcivity: UIView = {
            let image = UIView()
            image.backgroundColor = UIColor.white
            image.layer.cornerRadius = 10
            image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            image.layer.shadowOpacity = 0.1
            image.layer.shadowOffset = CGSize(width: 0, height: 0)
            image.layer.shadowRadius = 10
            image.layer.shouldRasterize = true
            return image
    }()

    
    lazy var titleActivity : UILabel = {
        let label = UILabel()
        let title = "กิจกรรมของฉัน"
      let style = NSMutableParagraphStyle()
       style.alignment = NSTextAlignment.center
       let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 22),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var countActivity : UIButton = {
            let image = UIButton()
            image.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
            image.layer.cornerRadius = 10
            image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            image.layer.shadowOpacity = 0.1
            image.layer.shadowOffset = CGSize(width: 0, height: 0)
            image.layer.shadowRadius = 10
            image.layer.shouldRasterize = true
            image.setTitle("เข้าร่วม", for: .normal)
            image.contentVerticalAlignment = .bottom
            image.setTitleColor(UIColor.white,for: .normal)
            image.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
            image.addTarget(self, action: #selector(listUserActivity), for: .touchUpInside)
            return image
    }()
    
    lazy var notcountActivity : UIButton = {
              let image = UIButton()
              image.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
              image.layer.cornerRadius = 10
              image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
              image.layer.shadowOpacity = 0.1
              image.layer.shadowOffset = CGSize(width: 0, height: 0)
              image.layer.shadowRadius = 10
              image.layer.shouldRasterize = true
              image.setTitle("เสร็จสิ้น", for: .normal)
              image.contentVerticalAlignment = .bottom
              image.setTitleColor(UIColor.white,for: .normal)
              image.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
              image.addTarget(self, action: #selector(listUserActivity), for: .touchUpInside)
              return image
      }()
        
    lazy var numActivty : UILabel = {
        let label = UILabel()
        let title = "0"
      let style = NSMutableParagraphStyle()
       style.alignment = NSTextAlignment.center
       let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 40),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    lazy var endActivty : UILabel = {
          let label = UILabel()
          let title = "0"
        let style = NSMutableParagraphStyle()
         style.alignment = NSTextAlignment.center
         let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 40),NSMutableAttributedString.Key.foregroundColor : UIColor.white])
          label.attributedText = attributedText
          label.numberOfLines = 0
          return label
      }()
    
    
    func reloadCountDataStart(){
             let parameters: Parameters = ["user_id":getIduser]
        print(parameters)
                   let url = URL_GET_COUNT_JOIN_ACTIVITY_START + "?id=\(getIduser)"
        print(url)
                   Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                             if let user = resData.result.value as! [String: Any]? {
                                 if let yield = user["joinActivity"] as? Int{
                                     self?.numActivty.text = "\(yield)"
                                     self?.numActivty.font = UIFont.BaiJamjureeBold(size: 40)
                                     self?.numActivty.textAlignment = .center
                                     self?.numActivty.textColor = .white
                                 }
                         }
                   }
    }
    
    func reloadCountDataEnd(){
              let parameters: Parameters = ["user_id":getIduser]
         print(parameters)
                    let url = URL_GET_COUNT_JOIN_ACTIVITY_END + "?id=\(getIduser)"
         print(url)
                    Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                              if let user = resData.result.value as! [String: Any]? {
                                  if let yield = user["joinActivityEnd"] as? Int{
                                      self?.endActivty.text = "\(yield)"
                                      self?.endActivty.font = UIFont.BaiJamjureeBold(size: 40)
                                      self?.endActivty.textAlignment = .center
                                      self?.endActivty.textColor = .white
                                  }
                          }
                    }
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
        
        
        let stacView3 = UIStackView(arrangedSubviews:[countActivity,notcountActivity])
        stacView3.distribution = .fillEqually
        stacView3.spacing = 20
        stacView3.axis = .horizontal
        
        
    
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
        viewScroll.addSubview(pointAcivity)
        viewScroll.addSubview(birthday)
        viewScroll.addSubview(iconbirthday)
        viewScroll.addSubview(iconPost)
        viewScroll.addSubview(iconActivity)
        viewScroll.addSubview(titleActivity)
        viewScroll.addSubview(stacView3)
        viewScroll.addSubview(numActivty)
         viewScroll.addSubview(endActivty)
        
        
        

        viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        imageView.anchor(view.safeAreaLayoutGuide.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
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
        
        pointAcivity.anchor(dataUser.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: stacView2.topAnchor, topConstant: 15, bottomConstant: 15, leftConstant: 15, rightConstant: 15, widthConstant: screenSizeX, heightConstant: 0)
        
        titleActivity.anchor(pointAcivity.topAnchor, left: pointAcivity.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 15, widthConstant: 0, heightConstant: 20)
        
        stacView3.anchor(titleActivity.bottomAnchor, left: pointAcivity.leftAnchor, right: pointAcivity.rightAnchor, bottom: pointAcivity.bottomAnchor, topConstant: 25, bottomConstant: 25, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 120)
    
        numActivty.anchor(countActivity.topAnchor, left: countActivity.leftAnchor, right:countActivity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 0, rightConstant: 0, widthConstant: iconActivity.frame.size.width , heightConstant: iconActivity.frame.size.height)
        endActivty.anchor(notcountActivity.topAnchor, left: notcountActivity.leftAnchor, right:notcountActivity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 10, leftConstant: 0, rightConstant: 0, widthConstant: iconActivity.frame.size.width , heightConstant: iconActivity.frame.size.height)

        
        stacView2.anchor(stacView3.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 15, bottomConstant: 30, leftConstant: 15, rightConstant: 15, widthConstant: screenSizeX, heightConstant: 120)

        iconActivity.anchor(activityUser.topAnchor, left: activityUser.leftAnchor, right:activityUser.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: iconActivity.frame.size.width , heightConstant: iconActivity.frame.size.height )

        iconPost.anchor(postUser.topAnchor, left: postUser.leftAnchor, right:postUser.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: iconPost.frame.size.width, heightConstant: iconPost.frame.size.height)
        


        if let name = defaultValues.string(forKey: "userId") {
                getIduser = name
                print(getIduser)
        }
            
    }
    
}
