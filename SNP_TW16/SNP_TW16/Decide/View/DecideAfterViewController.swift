//
//  DecideAfterViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 24/2/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class DecideAfterViewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate{
        
        var delegate:UIViewController?
        let URL_POST_DECIDE_AFTER = "\(AppDelegate.link)alder_iosapp/v1/decideAfter.php"
        lazy var post_timeline = String()
        lazy var IdUser = String()
        lazy var feel = Int()
        lazy var impress = Int()
        let screenSizeX: CGFloat = UIScreen.main.bounds.width
        let screenSizeY: CGFloat = UIScreen.main.bounds.height
        
        override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
                self.tabBarController?.tabBar.isHidden = true
        }
        
        lazy var viewScroll: UIScrollView = {
           let view = UIScrollView()
           return view
        }()
    
        let bgActivitity:UIView = {
             let background = UIView()
             background.backgroundColor = UIColor.white
             return background
         }()
        
        let headerText : UILabel = {
            let header = UILabel()
            let title = "กรุณาทำแบบประเมินหลังเข้าร่วม \nกิจกรรม"
            let attributedText = NSMutableAttributedString(string: title,
                       attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            header.attributedText = attributedText
            header.numberOfLines = 0
            return header
        }()
        
        let titleText : UILabel = {
            let header = UILabel()
            let title = "1. หลังจากเข้าร่วมกิจกรรม ท่านมีความรู้สึกอย่างไร"
            let attributedText = NSMutableAttributedString(string: title,
                       attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            header.attributedText = attributedText
            header.numberOfLines = 4
            return header
        }()
        
        let boreddBtn: UIButton = {
            let Btn =  UIButton()
            Btn.tintColor = UIColor.blackAlpha(alpha: 0.5)
            Btn.setImage(UIImage(named: "nothappy")?.withRenderingMode(.alwaysTemplate), for: .normal)
            Btn.imageView?.contentMode = .scaleAspectFit
            Btn.tag = 1
            Btn.addTarget(self, action: #selector(click), for: .touchUpInside)
            return Btn
        }()
        
        let notbotheredBtn: UIButton = {
            let Btn =  UIButton()
            Btn.tintColor = UIColor.blackAlpha(alpha: 0.5)
            Btn.setImage(UIImage(named: "null")?.withRenderingMode(.alwaysTemplate), for: .normal)
            Btn.imageView?.contentMode = .scaleAspectFit
            Btn.tag = 2
            Btn.addTarget(self, action: #selector(click), for: .touchUpInside)
            return Btn
        }()
            
        let satisfiedBtn: UIButton = {
            let Btn =  UIButton()
            Btn.tintColor = UIColor.blackAlpha(alpha: 0.5)
            Btn.setImage(UIImage(named: "smile")?.withRenderingMode(.alwaysTemplate), for: .normal)
            Btn.imageView?.contentMode = .scaleAspectFit
            Btn.tag = 3
            Btn.addTarget(self, action: #selector(click), for: .touchUpInside)
            return Btn
        }()
     
        let titlenothapply : UILabel = {
               let header = UILabel()
               let title = "ไม่มีความสุข"
               let attributedText = NSMutableAttributedString(string: title,
                          attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
               header.attributedText = attributedText
               header.numberOfLines = 0
               header.textAlignment = .center;
               return header
        }()
    
        let titlenotbothered : UILabel = {
                  let header = UILabel()
                  let title = "เฉยๆ"
                  let attributedText = NSMutableAttributedString(string: title,
                             attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                  header.attributedText = attributedText
                  header.numberOfLines = 0
                  header.textAlignment = .center;
                  return header
        }()
    
        let titlehapply : UILabel = {
                    let header = UILabel()
                    let title = "มีความสุข"
                    let attributedText = NSMutableAttributedString(string: title,
                               attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                    header.attributedText = attributedText
                    header.numberOfLines = 0
                    header.textAlignment = .center;
                    return header
        }()
    
        let line: UIView = {
                    let view = UIView()
                    view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                    return view
        }()
    
    
        let titleLike : UILabel = {
                       let header = UILabel()
                       let title = "ใช่"
                       let attributedText = NSMutableAttributedString(string: title,
                                  attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                       header.attributedText = attributedText
                       header.numberOfLines = 0
                       header.textAlignment = .center;
                       return header
        }()
    
        let titleUnLike : UILabel = {
                          let header = UILabel()
                          let title = "ไม่"
                          let attributedText = NSMutableAttributedString(string: title,
                                     attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 18),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                          header.attributedText = attributedText
                          header.numberOfLines = 0
                          header.textAlignment = .center;
                          return header
        }()
    
        @objc func click(_sender: UIButton){
                     let checkValue = boreddBtn
                     let checkValue2 = notbotheredBtn
                     let checkValue3 = satisfiedBtn
            
                  switch _sender.tag {
                  case 1:
                      checkValue.tintColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                      checkValue2.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                      checkValue3.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                      feel = checkValue.tag
                  case 2:
                      checkValue.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                      checkValue2.tintColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                      checkValue3.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                      feel = checkValue2.tag
                  case 3:
                      checkValue.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                      checkValue2.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                      checkValue3.tintColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                      feel = checkValue3.tag
                  default: break
                  }
        }
        

        @objc func clicklike(_sender: UIButton){
               let checkValue = likeBtn
               let checkValue2 = unlikeBtn
            
            switch _sender.tag {
            case 1:
                checkValue.tintColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                checkValue2.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                impress = checkValue.tag
            case 2:
                checkValue2.tintColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                checkValue.tintColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                impress = checkValue2.tag
            default: break
            }
        }
        

        
        let title2Text : UILabel = {
            let header = UILabel()
            let title = "2. ท่านสนใจที่จะเข้าร่วมกิจกรรมที่จัดขึ้นในครั้งต่อไปอีกหรือไม่"
            let attributedText = NSMutableAttributedString(string: title,
                       attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 20),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
            header.attributedText = attributedText
            header.numberOfLines = 4
            return header
        }()
        
        let likeBtn: UIButton = {
            let Btn =  UIButton()
            Btn.tintColor = UIColor.blackAlpha(alpha: 0.5)
            Btn.setImage(UIImage(named: "yes")?.withRenderingMode(.alwaysTemplate), for: .normal)
            Btn.imageView?.contentMode = .scaleAspectFit
            Btn.tag = 1
            Btn.addTarget(self, action: #selector(clicklike), for: .touchUpInside)
            return Btn
        }()
        
        let unlikeBtn: UIButton = {
            let Btn =  UIButton()
            Btn.tintColor = UIColor.blackAlpha(alpha: 0.5)
            Btn.setImage(UIImage(named: "no")?.withRenderingMode(.alwaysTemplate), for: .normal)
            Btn.imageView?.contentMode = .scaleAspectFit
            Btn.tag = 2
            Btn.addTarget(self, action: #selector(clicklike), for: .touchUpInside)
            return Btn
        }()
        
        let sendBtn : UIButton = {
                  let submit = UIButton(type: UIButton.ButtonType.system)
                  submit.backgroundColor = UIColor.white
                  submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
                  submit.layer.borderWidth = 2
                  submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
                  submit.layer.cornerRadius = 20
                  submit.setTitle("ส่งคำตอบ", for: .normal)
                  submit.setTitleColor(UIColor.white,for: .normal)
                  submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 24)
                  submit.addTarget(self, action: #selector(sendData), for: .touchUpInside)
                  return submit
        }()
        
    
        @objc func actionJoin(){
            let parameters = ["user_id":self.IdUser,"post_timeline_id":self.post_timeline,"assess_id":self.feel,"impress_id":self.impress] as [String : Any]
                         let idposttimeline = self.post_timeline
                         print(parameters)
                         if self.impress == 1 {
                             Alamofire.request(self.URL_POST_DECIDE_AFTER, method: .post,parameters: parameters).responseJSON { response in
                                 if let delegate = self.delegate as? InviteActivityViewController {
                                     delegate.buttonView.isHidden = true
                                     delegate.buttonView2.isHidden = false
                                     self.navigationController?.popViewController(animated: true)
                                 }
                             }
                         }else{
                             Alamofire.request(self.URL_POST_DECIDE_AFTER, method: .post,parameters: parameters).responseJSON { response in
                                 if let delegate = self.delegate as? InviteActivityViewController {
                                     delegate.buttonView.isHidden = true
                                     delegate.buttonView2.isHidden = false
                                     let passData = DecideChoiceViewController()
                                     passData.idpost = idposttimeline
                                     self.navigationController?.pushViewController(passData, animated: true)
                                 }
                             }
                         }
        }
    
        @objc func sendData(){
            let popOverVC = AlertDecideAfterViewController()
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.rgb(red: 247, green: 250, blue: 255)
            navigationItem.title = "กิจกรรม"
            
            let stacView = UIStackView(arrangedSubviews:[boreddBtn,notbotheredBtn,satisfiedBtn])
            stacView.distribution = .fillEqually
            stacView.spacing = 0
            stacView.axis = .horizontal
            
            let stacViewfell = UIStackView(arrangedSubviews:[titlenothapply,titlenotbothered,titlehapply])
            stacViewfell.distribution = .fillEqually
            stacViewfell.spacing = 20
            stacViewfell.axis = .horizontal
            
            
            let stacView2 = UIStackView(arrangedSubviews:[likeBtn,unlikeBtn])
            stacView2.distribution = .fillEqually
            stacView2.spacing = 0
            stacView2.axis = .horizontal
            
            let stackViewclick = UIStackView(arrangedSubviews:[titleLike,titleUnLike])
            stackViewclick.distribution = .fillEqually
            stackViewclick.spacing = 20
            stackViewclick.axis = .horizontal
            
            view.addSubview(viewScroll)
            viewScroll.addSubview(bgActivitity)
            viewScroll.addSubview(headerText)
            viewScroll.addSubview(titleText)
            viewScroll.addSubview(stacView)
            viewScroll.addSubview(stacViewfell)
            viewScroll.addSubview(line)
            viewScroll.addSubview(title2Text)
            viewScroll.addSubview(stacView2)
            viewScroll.addSubview(stackViewclick)
            viewScroll.addSubview(sendBtn)
            
            
            viewScroll.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
            
            bgActivitity.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX, heightConstant: screenSizeY)
                 
            headerText.anchor(bgActivitity.topAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 50)

            titleText.anchor(headerText.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 15, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)

            stacView.anchor(titleText.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 0)

            stacViewfell.anchor(stacView.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 0)

            line.anchor(stacViewfell.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)


            title2Text.anchor(line.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)


            stacView2.anchor(title2Text.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 100)

            stackViewclick.anchor(stacView2.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 0)

            sendBtn.anchor(stackViewclick.bottomAnchor, left: bgActivitity.leftAnchor, right: bgActivitity.rightAnchor, bottom: bgActivitity.bottomAnchor, topConstant: 20, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 70)
        }
        
    
}
