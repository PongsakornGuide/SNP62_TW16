//
//  AssessVIewController.swift
//  SNP_TW16
//
//  Created by Guide on 11/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
//import SimpleCheckbox
class AssessVIewController: UIViewController,UITextFieldDelegate ,UINavigationControllerDelegate {
    //    let num : Int = 0631921545
    
    
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
        
              let header : UIView = {
                  let view = UIView()
                  view.backgroundColor  = UIColor.rgb(red: 237, green: 188, blue: 29)
                  view.layer.cornerRadius = 20
                  return view
              }()
        
              let textHeader : UILabel = {
                   let title = UILabel()
                   title.text = " สันทนาการ"
                   title.font = UIFont.PoppinsBold(size: 17)
                   title.textColor = UIColor.white
                   return title
              }()
        
        
              let titleLabel : UILabel = {
                   let title = UILabel()
                   title.text = "แซนวิสเพื่อสุขภาพ"
                    title.font = UIFont.PoppinsBold(size: 28)
                   return title
              }()
             
             let nameLabel : UILabel = {
                   let title = UILabel()
                   title.text = "โดย ไกด์ ฐิติวัฒน์"
                   title.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                   title.font = UIFont.PoppinsMedium(size: 16)
                   return title
             }()
        
        
             let timeLabel : UILabel = {
              let title = UILabel()
              title.text = "วันเริ่มกิจกรรม: 14 สิงหาคม 2562"
              title.textColor = UIColor.black
              title.font = UIFont.PoppinsMedium(size: 18)
              return title
             }()
    
            let line: UIView = {
                let view = UIView()
                view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 252)
                return view
            }()
             
             let contentLabel : UILabel = {
                   let title = UILabel()
                    title.lineBreakMode = .byWordWrapping
                    title.numberOfLines = 5
                   title.text = "โปรดเลือกคำตอบก่อนเข้าร่วมกิจกรรม"
                   title.textColor = UIColor.black
                   title.font = UIFont.PoppinsBold(size: 19)
                   return title
             }()
    

          let contenDeatil : UILabel = {
                 let title = UILabel()
                  title.lineBreakMode = .byWordWrapping
                  title.numberOfLines = 5
                 title.text = " 1. ท่านคาดหวังอย่างไรกับกิจกรรมนี้"
                 title.textColor = UIColor.black
                 title.font = UIFont.PoppinsMedium(size: 19)
                 return title
           }()
    
         let alertTilte : UILabel = {
                 let title = UILabel()
                  title.lineBreakMode = .byWordWrapping
                  title.numberOfLines = 5
                 title.text = "*เลือกได้มากกว่า 1 ข้อ"
                 title.textColor = UIColor.red
                 title.font = UIFont.PoppinsMedium(size: 19)
                 return title
           }()
        
    //-----------------------------------------------------------------------------------------------
        let bgcheck : UIView = {
           let bg = UIView()
//            bg.backgroundColor = .red
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
            title.text = "ความสนุก"
            title.font = UIFont.PoppinsMedium(size: 22)
            title.tintColor = UIColor.black
            return title
        }()
    //-----------------------------------------------------------------------------------------------
    
    let bgcheck2 : UIView = {
            let bg = UIView()
//             bg.backgroundColor = .red
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
             title.text = "ผ่อนคลาย"
             title.font = UIFont.PoppinsMedium(size: 22)
             title.tintColor = UIColor.black
             return title
         }()
     //-----------------------------------------------------------------------------------------------
     
    let bgcheck3 : UIView = {
             let bg = UIView()
//              bg.backgroundColor = .red
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
              title.text = "พบปะสังคม"
              title.font = UIFont.PoppinsMedium(size: 22)
              title.tintColor = UIColor.black
              return title
          }()
      //-----------------------------------------------------------------------------------------------
      
     
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
                 title.text = "ร่างกายแข็งแรง"
                 title.font = UIFont.PoppinsMedium(size: 22)
                 title.tintColor = UIColor.black
                 return title
             }()
         //-----------------------------------------------------------------------------------------------
         
        
    
      let bgcheck5 : UIView = {
               let bg = UIView()
//                bg.backgroundColor = .red
               return bg
            }()
            
            let btncheck5 : Checkbox = {
                let tickBox = Checkbox()
                tickBox.borderStyle = .square
                tickBox.checkmarkStyle = .tick
                tickBox.checkmarkSize = 0.7
                tickBox.valueChanged = { (value) in
                         print("tickBox value change: \(value)")
                }
                return tickBox
            }()
            
            let titleCheck5 : UILabel = {
                let title = UILabel()
                title.text = "อื่นๆ"
                title.font = UIFont.PoppinsMedium(size: 22)
                title.tintColor = UIColor.black
                return title
            }()
        //-----------------------------------------------------------------------------------------------
        
       
    
    
    
    let nextButton: UIButton = {
                     let button = UIButton(type: .system)
                     button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
                     button.layer.cornerRadius = 20
                     button.setTitle("เข้าร่วมกิจกรรม", for: .normal)
                     button.setTitleColor(.white, for: .normal)
                     button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                     button.addTarget(self, action: #selector(activity_active), for: .touchUpInside)
                     return button
   }()

            @objc func activity_active(){
////                print("5555")
//                if (btncheck5.valueChanged != nil){
////                    nextButton.isEnabled = true
//                    print("6666")
//                }else{
//                    print("5555")
//                }
                
                let alert = UIAlertController(title: "คุณเข้าร่วมกิจกรรมสำเร็จ", message: "แล้วพบกันในเร็วๆ นี้ :-)", preferredStyle: UIAlertController.Style.alert)
                    // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                
                
                
            }
        

        
                 override func viewDidLoad() {
                     super.viewDidLoad()
                 
                     view.backgroundColor = UIColor.white
                     navigationItem.title = "กิจกรรม"
                     view.addSubview(viewScroll)
                    
//                    nextButton.isEnabled = false
                    
                     viewScroll.addSubview(stepView)
                     viewScroll.addSubview(BGView)
                     viewScroll.addSubview(header)
                     viewScroll.addSubview(textHeader)
                     viewScroll.addSubview(titleLabel)
                     viewScroll.addSubview(nameLabel)
                     viewScroll.addSubview(line)
                     viewScroll.addSubview(timeLabel)
                     viewScroll.addSubview(contentLabel)
                     viewScroll.addSubview(contenDeatil)
                     viewScroll.addSubview(alertTilte)
                    
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
                    
                    viewScroll.addSubview(bgcheck5)
                    viewScroll.addSubview(btncheck5)
                    viewScroll.addSubview(titleCheck5)
                    
                    viewScroll.addSubview(nextButton)
                  
                  viewScroll.anchor(view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                  
                  stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX - 0, heightConstant: 200)
                     
                  BGView.anchor(stepView.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: -20, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: screenSizeX , heightConstant: screenSizeY)
                  
                  header.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 180, widthConstant: screenSizeX, heightConstant: 40)
                    
                    
                  textHeader.anchor(header.topAnchor, left: header.leftAnchor, right: header.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 45, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 0)
                                   
                    
                  titleLabel.anchor(header.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
                    
                  nameLabel.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 20, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 50)
                  
                  timeLabel.anchor(nameLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 20)
                                  
                    
                    line.anchor(timeLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 1.1)
                    
                    
                    contentLabel.anchor(line.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 25, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 20)

                    
                    contenDeatil.anchor(contentLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 20)
                                     
                    alertTilte.anchor(contenDeatil.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 20, leftConstant: 30, rightConstant: 30, widthConstant: screenSizeX, heightConstant: 20)
                    
                    
                    //
                    
                    bgcheck.anchor(alertTilte.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 50)
                    
                    btncheck.anchor(bgcheck.topAnchor, left: bgcheck.leftAnchor, right: bgcheck.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                    titleCheck.anchor(bgcheck.topAnchor, left: btncheck.leftAnchor, right: nil, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 50, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
                    
                    //
                    
                    bgcheck2.anchor(bgcheck.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 50)
                    
                    btncheck2.anchor(bgcheck2.topAnchor, left: bgcheck2.leftAnchor, right: bgcheck2.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                    titleCheck2.anchor(bgcheck2.topAnchor, left: bgcheck2.leftAnchor, right: nil, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
                    //
                    
                    bgcheck3.anchor(bgcheck2.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 50)
                    
                    btncheck3.anchor(bgcheck3.topAnchor, left: bgcheck3.leftAnchor, right: bgcheck3.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                    titleCheck3.anchor(bgcheck3.topAnchor, left: bgcheck3.leftAnchor, right: nil, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
                    
                    //
                    
                    
                    bgcheck4.anchor(bgcheck3.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 50)
                    
                    btncheck4.anchor(bgcheck4.topAnchor, left: bgcheck4.leftAnchor, right: bgcheck4.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                    titleCheck4.anchor(bgcheck4.topAnchor, left: bgcheck4.leftAnchor, right: nil, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
                    //
                    
                    
                    bgcheck5.anchor(bgcheck4.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 50)
                    
                    btncheck5.anchor(bgcheck5.topAnchor, left: bgcheck5.leftAnchor, right: bgcheck5.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 260, widthConstant: screenSizeX, heightConstant: 30)

                    titleCheck5.anchor(bgcheck5.topAnchor, left: bgcheck5.leftAnchor, right: nil, bottom: nil, topConstant: 18, bottomConstant: 0, leftConstant: 90, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 40)
                    
                    
                    
                    nextButton.anchor(bgcheck5.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: viewScroll.bottomAnchor, topConstant: 40, bottomConstant: 30, leftConstant: 100, rightConstant: 100, widthConstant: screenSizeX, heightConstant: 70)

                    
                    
                    
                }

}

