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
class ProfileVIewController: UIViewController{
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
    let URL_GET_PROFILE = "http://localhost/alder_iosapp/v1/showProfile.php"
//    let URL_GET_PROFILE = "http://172.20.10.5/alder_iosapp/v1/showProfile.php"
    let defaultValues = UserDefaults.standard
    var getIduser = String()
    var ImageProfiles = String()
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
//          getImage()
          reloadData()
        
    }

    var viewScroll: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let stepView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let bgImageProfile:UIView = {
        let background = UIView()
        return background
    }()
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Intersection 4")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    let bgImageView : UIImageView = {
           let image = UIImageView()
           return image
    }()
    
    let BGView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            return view
    }()
    
    let profileImageView : UIImageView = {
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
    
    let ImageProfile : UIImageView = {
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
   let editProfile : UIButton = {
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
    
    let viewName : UIView = {
        let view = UIView()
        return view
    }()
    
    let nameHeader : UILabel = {
        let label = UILabel()
        let title = "รัตน์มณี"
      let style = NSMutableParagraphStyle()
       style.alignment = NSTextAlignment.center
       let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    let surnameHeader : UILabel = {
          let label = UILabel()
          let title = "รัตน์มณี"
        let style = NSMutableParagraphStyle()
         style.alignment = NSTextAlignment.center
         let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            label.attributedText = attributedText
          label.numberOfLines = 0
          return label
      }()
    
    let viewNursing : UIView = {
           let view = UIView()
//           view.backgroundColor = .green
           return view
    }()
    
    let viewIconNursing : UIView = {
              let view = UIView()
//              view.backgroundColor = .blue
              return view
       }()
    
 
            
    
    let nursingHome : UILabel = {
        let label = UILabel()
        let title = "Chersery Home"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()

 
    
    let iconNursingHome : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "locatePlace")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    let line: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
            return view
    }() //-----------------------------------------------------------------------------------------------
    
    let birthday : UILabel = {
        let label = UILabel()
        let title = "28 กุมภาพันธ์ 2500"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()

    
    
    let iconbirthday : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "birthdayCake")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    
    let tel : UILabel = {
        let label = UILabel()
        let title = "089 - 446 - 3444"
        let style = NSMutableParagraphStyle()
              style.alignment = NSTextAlignment.center
              let attributedText = NSMutableAttributedString(string: title,attributes: [ NSAttributedString.Key.paragraphStyle : style,NSAttributedString.Key.font : UIFont.PoppinsMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        return label
    }()

    
    
    let icontel : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "24Hourss")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    let viewAlige : UIView = {
                  let view = UIView()
        view.backgroundColor = .red
                  return view
    }()
    
    let dataUser  : UIView = {
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
    
    
    let iconPost : UIImageView = {
          let image = UIImageView()
          image.image = UIImage(named: "surface")
          image.contentMode = .scaleAspectFit
          image.layer.masksToBounds = true
//          image.contentMode = .scaleAspectFit
       
          return image
    }()
      
    
    let postUser : UIButton = {
         let image = UIButton(type: UIButton.ButtonType.system)
         image.backgroundColor = UIColor.white
         image.layer.cornerRadius = 10
         image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
         image.layer.shadowOpacity = 0.1
         image.layer.shadowOffset = CGSize(width: 0, height: 0)
         image.layer.shadowRadius = 10
         image.layer.shouldRasterize = true
         image.setTitle("โพสต์ของฉัน", for: .normal)
         image.contentVerticalAlignment = .bottom
         image.setTitleColor(UIColor.black,for: .normal)
         image.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
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
            let AcitivityView = listFavoriteUserTableView()
            navigationController?.pushViewController(AcitivityView, animated: true)
    }
    
    let iconActivity : UIImageView = {
             let image = UIImageView()
             image.image = UIImage(named: "history")
             image.layer.masksToBounds = true
             image.contentMode = .scaleAspectFit
             return image
    }()
         
    
    let activityUser : UIButton = {
            let image = UIButton(type: UIButton.ButtonType.system)
            image.backgroundColor = UIColor.white
            image.layer.cornerRadius = 10
            image.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
            image.layer.shadowOpacity = 0.1
            image.layer.shadowOffset = CGSize(width: 0, height: 0)
            image.layer.shadowRadius = 10
            image.layer.shouldRasterize = true
            image.setTitle("ประวัติกิจกรรม", for: .normal)
            image.contentVerticalAlignment = .bottom
            image.setTitleColor(UIColor.black,for: .normal)
            image.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            image.addTarget(self, action: #selector(listUserActivity), for: .touchUpInside)
            return image
    }()
    
//    Alamofire.request("http://172.20.10.5/alder_iosapp/" + (ImageProfiles ?? "0")!).responseImage { response in
//    func getImage(){
//              if let name3 = defaultValues.string(forKey: "ImageUser") {
//                ImageProfiles = name3
//                print(ImageProfiles)
//                Alamofire.request("http://localhost/alder_iosapp/" + (ImageProfiles)).responseImage { response in
//                                    if let image = response.result.value {
//                                    self.ImageProfile.image = image
//                            }
//                        }
//                 }else{
//                    //send back to login view controller
//                 }
//    }
    
    func reloadData(){
        let parameters: Parameters = ["userId":getIduser]
              let url = URL_GET_PROFILE + "?id=\(getIduser)"
              Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                        print(resData)
                        if let user = resData.result.value as! [String: Any]? {
                                if let yield = user["username"] as? String{
                                    self?.nameHeader.text = yield
                                    self?.nameHeader.font = UIFont.PoppinsBold(size: 20)
                                }
                                if let yield = user["surname"] as? String{
                                    self?.surnameHeader.text = yield
                                    self?.surnameHeader.font = UIFont.PoppinsBold(size: 20)
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
                                        Alamofire.request("http://localhost/alder_iosapp/" + yield).responseImage { response in
                                        if let image = response.result.value {
                                            self?.ImageProfile.image = image
                                              }
                                      }
                               }
                       }
                
              }
    }
    


               
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heartButton = MultiDegreeLikeButton(imageStyle: .heart)
            heartButton.completionWithLikeDegree = { _, degree in
            heartButton.translatesAutoresizingMaskIntoConstraints = true

        }
        
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
        viewScroll.addSubview(viewName)
        viewScroll.addSubview(nameHeader)
        viewScroll.addSubview(surnameHeader)
        
        viewScroll.addSubview(postUser)
        viewScroll.addSubview(activityUser)
        viewScroll.addSubview(iconNursingHome)
        viewScroll.addSubview(nursingHome)
        
        viewScroll.addSubview(line)
        viewScroll.addSubview(birthday)
        viewScroll.addSubview(iconbirthday)
        viewScroll.addSubview(tel)
        viewScroll.addSubview(icontel)
        
        viewScroll.addSubview(iconPost)
        viewScroll.addSubview(iconActivity)
        viewScroll.addSubview(heartButton)
        navigationController?.navigationBar.isHidden = true
        
        viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        imageView.anchor(view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 500)
        
        BGView.anchor(stepView.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant:0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
                
        
        
        bgImageProfile.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: editProfile.topAnchor, topConstant: 50, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 150)
        
        profileImageView.anchor(bgImageProfile.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        profileImageView.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true

        ImageProfile.anchor(profileImageView.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 5, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        ImageProfile.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true
        
        editProfile.anchor(bgImageProfile.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 100, rightConstant: 100, widthConstant: screenSizeX, heightConstant: 100)


        dataUser.anchor(editProfile.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: screenSizeX, heightConstant: 280)

        viewName.anchor(dataUser.topAnchor, left: dataUser.leftAnchor, right: dataUser.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        nameHeader.anchor(viewName.topAnchor, left: viewName.leftAnchor, right: surnameHeader.leftAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 50)


        surnameHeader.anchor(viewName.topAnchor, left: nameHeader.rightAnchor, right: viewName.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 50)


        iconNursingHome.anchor(surnameHeader.bottomAnchor, left: nursingHome.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: -15, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        nursingHome.anchor(nameHeader.bottomAnchor, left:nil, right: nil, bottom: nil, topConstant: 3, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        nursingHome.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true
        
        
        line.anchor(nursingHome.bottomAnchor, left: dataUser.leftAnchor, right: dataUser.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 10, leftConstant: 0, rightConstant: 0 , widthConstant: 0, heightConstant: 1)

        iconbirthday.anchor(line.bottomAnchor, left: birthday.leftAnchor, right: nil, bottom: nil, topConstant: 28, bottomConstant: 0, leftConstant: -25, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        birthday.anchor(line.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 14, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        birthday.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true
        
        icontel.anchor(birthday.bottomAnchor, left: tel.leftAnchor, right: nil, bottom: dataUser.bottomAnchor, topConstant: 25, bottomConstant: 20, leftConstant: -25, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        tel.anchor(birthday.bottomAnchor, left: nil, right: nil, bottom: dataUser.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        tel.centerXAnchor.constraint(equalTo: BGView.centerXAnchor).isActive = true
        
        postUser.anchor(dataUser.bottomAnchor, left: viewName.leftAnchor, right: nil, bottom: BGView.bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 0, rightConstant: 10, widthConstant: 170, heightConstant: 120)

        iconPost.anchor(postUser.topAnchor, left: postUser.leftAnchor, right:postUser.rightAnchor, bottom: nil, topConstant: -10, bottomConstant: 0, leftConstant: 65, rightConstant: 65, widthConstant: iconActivity.frame.size.width, heightConstant: iconActivity.frame.size.height)


        activityUser.anchor(dataUser.bottomAnchor, left: nil, right: viewName.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 0, rightConstant: 0, widthConstant: 170, heightConstant: 120)

        iconActivity.anchor(activityUser.topAnchor, left: activityUser.leftAnchor, right:activityUser.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: iconActivity.frame.size.width , heightConstant: iconActivity.frame.size.height )
        
        heartButton.anchor(iconActivity.bottomAnchor, left: nil, right: viewName.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    
        if let name = defaultValues.string(forKey: "userId") {
                getIduser = name
                print(getIduser)
        }
            
    }
    
}
