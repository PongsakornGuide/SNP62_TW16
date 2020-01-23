//
//  ConfirmViewController.swift
//  SNP_TW16
//
//  Created by Guide on 17/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ConfirmViewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate {
                     let screenSizeX: CGFloat = UIScreen.main.bounds.width
                     let screenSizeY: CGFloat = UIScreen.main.bounds.height
                     
                     var viewScroll: UIScrollView = {
                         let view = UIScrollView()
                         return view
                     }()
            
                     let stepView: UIImageView = {
                         let view = UIImageView()
                         view.image = UIImage(named: "maeMuUnu")
                         return view
                     }()
            
                  let BGView: UIView = {
                      let view = UIView()
                      view.backgroundColor = .white
                      view.layer.cornerRadius = 20
                      return view
                  }()
            
                  let titleLabel : UILabel = {
                       let title = UILabel()
                       title.text = "โปรดเลือกสาเหตุเพื่อให้เราเข้าใจถึงสิ่งที่เกิดในการจัดกิจกรรมครั้งนี้"
                        title.lineBreakMode = .byWordWrapping
                        title.numberOfLines = 5
                        title.font = UIFont.PoppinsBold(size: 28)
                       return title
                  }()
                 

                let line: UIView = {
                    let view = UIView()
                    view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 252)
                    return view
                }()
                 

            let bgcheck : UIView = {
               let bg = UIView()
//                bg.backgroundColor = .red
               return bg
            }()
            
            let btncheck : Checkbox = {
                let tickBox = Checkbox()
                tickBox.borderStyle = .square
                tickBox.checkmarkStyle = .tick
                tickBox.checkmarkSize = 0.7
                tickBox.valueChanged = { (value) in
                         print("tickBox value change: \(value)")
                }
                return tickBox
            }()
            
            let titleCheck : UILabel = {
                let title = UILabel()
                title.text = "ผู้ดูแลมีการดูแลที่ไม่ทั่วถึง"
                title.lineBreakMode = .byWordWrapping
                title.numberOfLines = 5
                title.font = UIFont.PoppinsMedium(size: 20)
                title.tintColor = UIColor.black
                return title
            }()
        //-----------------------------------------------------------------------------------------------
        
        let bgcheck2 : UIView = {
                let bg = UIView()
//                 bg.backgroundColor = .red
                return bg
             }()
             
             let btncheck2 : Checkbox = {
                 let tickBox = Checkbox()
                 tickBox.borderStyle = .square
                 tickBox.checkmarkStyle = .tick
                 tickBox.checkmarkSize = 0.7
                 tickBox.valueChanged = { (value) in
                          print("tickBox value change: \(value)")
                 }
                 return tickBox
             }()
             
             let titleCheck2 : UILabel = {
                 let title = UILabel()
                 title.text = "กิจกรรมที่จัดขึ้นมีความน่าสนใจน้อยกว่าที่ควร"
                 title.lineBreakMode = .byWordWrapping
                 title.numberOfLines = 5
                 title.font = UIFont.PoppinsMedium(size: 20)
                 title.tintColor = UIColor.black
                 return title
             }()
         //-----------------------------------------------------------------------------------------------
         
            let bgcheck3 : UIView = {
                 let bg = UIView()
//                  bg.backgroundColor = .red
                 return bg
              }()
              
              let btncheck3 : Checkbox = {
                  let tickBox = Checkbox()
                  tickBox.borderStyle = .square
                  tickBox.checkmarkStyle = .tick
                  tickBox.checkmarkSize = 0.7
                  tickBox.valueChanged = { (value) in
                           print("tickBox value change: \(value)")
                  }
                  return tickBox
              }()
              
              let titleCheck3 : UILabel = {
                  let title = UILabel()
                  title.text = "สภาพแวดล้อมในกิจกรรมไม่เอื้ออำนวย"
                  title.lineBreakMode = .byWordWrapping
                  title.numberOfLines = 5
                  title.font = UIFont.PoppinsMedium(size: 20)
                  title.tintColor = UIColor.black
                  return title
              }()
        
    
            let bgcheck4 : UIView = {
                 let bg = UIView()
//                 bg.backgroundColor = .red
                 return bg
              }()
              
              let btncheck4 : Checkbox = {
                  let tickBox = Checkbox()
                  tickBox.borderStyle = .square
                  tickBox.checkmarkStyle = .tick
                  tickBox.checkmarkSize = 0.7
                  tickBox.valueChanged = { (value) in
                           print("tickBox value change: \(value)")
                  }
                  return tickBox
              }()
              
              let titleCheck4 : UILabel = {
                  let title = UILabel()
                  title.text = "อื่นๆ"
                  title.lineBreakMode = .byWordWrapping
                  title.numberOfLines = 5
                  title.font = UIFont.PoppinsMedium(size: 20)
                  title.tintColor = UIColor.black
                  return title
              }()


            
        
        
        let nextButton: UIButton = {
                         let button = UIButton(type: .system)
                         button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                         button.layer.cornerRadius = 20
                         button.setTitle("ส่งคำตอบ", for: .normal)
                         button.setTitleColor(.white, for: .normal)
                         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                         button.addTarget(self, action: #selector(activity_active), for: .touchUpInside)
                         return button
       }()

                @objc func activity_active(){
                    let alert = UIAlertController(title: "ส่งแบบประเมินสำเร็จ!", message: "ขอบคุณที่เข้าร่วมกิจกรรมกับเรา", preferredStyle: UIAlertController.Style.alert)
                        // add the actions (buttons)
                    alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                }
            
                     override func viewDidLoad() {
                         super.viewDidLoad()
                         view.backgroundColor = UIColor.white
                         navigationItem.title = "กิจกรรม"
                         view.addSubview(viewScroll)
                    
                        viewScroll.addSubview(stepView)
                        viewScroll.addSubview(BGView)
                        viewScroll.addSubview(titleLabel)
                        viewScroll.addSubview(line)
                        viewScroll.addSubview(bgcheck)
                        viewScroll.addSubview(btncheck)
                        viewScroll.addSubview(titleCheck)
                        
                        viewScroll.addSubview(bgcheck2)
                        viewScroll.addSubview(btncheck2)
                        viewScroll.addSubview(titleCheck2)
                        
                        viewScroll.addSubview(bgcheck3)
                        viewScroll.addSubview(btncheck3)
                        viewScroll.addSubview(titleCheck3)

                        viewScroll.addSubview(bgcheck4)
                        viewScroll.addSubview(btncheck4)
                        viewScroll.addSubview(titleCheck4)
                        
                        
                        viewScroll.addSubview(nextButton)
                      
                      viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                      
                      stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 200)
                         
                      BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
                        
                      titleLabel.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 150)
                        

                        line.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 1.1)
                        
                        
                        bgcheck.anchor(line.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 80)
                        
                        btncheck.anchor(bgcheck.topAnchor, left: bgcheck.leftAnchor, right: bgcheck.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                        titleCheck.anchor(bgcheck.topAnchor, left: btncheck.leftAnchor, right: bgcheck.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 80)
                        
                        //
                        
                        bgcheck2.anchor(bgcheck.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 80)
                        
                        btncheck2.anchor(bgcheck2.topAnchor, left: bgcheck2.leftAnchor, right: bgcheck2.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                        titleCheck2.anchor(bgcheck2.topAnchor, left: bgcheck2.leftAnchor, right: bgcheck2.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 80)
                        //
                        
                        bgcheck3.anchor(bgcheck2.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 80)
                        
                        btncheck3.anchor(bgcheck3.topAnchor, left: bgcheck3.leftAnchor, right: bgcheck3.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                        titleCheck3.anchor(bgcheck3.topAnchor, left: bgcheck3.leftAnchor, right: bgcheck3.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 80)
                        
                        
                        bgcheck4.anchor(bgcheck3.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 80)
                                          
                        btncheck4.anchor(bgcheck4.topAnchor, left: bgcheck4.leftAnchor, right: bgcheck3.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                        titleCheck4.anchor(bgcheck4.topAnchor, left: bgcheck4.leftAnchor, right: bgcheck4.rightAnchor, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
                                          
                        
                        nextButton.anchor(titleCheck4.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 100, rightConstant: 100, widthConstant: screenSizeX, heightConstant: 70)

                        
                    }

}
