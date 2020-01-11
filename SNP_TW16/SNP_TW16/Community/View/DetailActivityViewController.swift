//
//  DetailActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 20/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
class DetailActivityViewController: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupViewCell()
    }
    
    let screenSizeX: CGFloat = UIScreen.main.bounds.width
    let screenSizeY: CGFloat = UIScreen.main.bounds.height
    
     let pageView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    let profile: UIImageView = {
        let image = UIImageView()
         image.image = UIImage(named: "tiko")
         image.contentMode = .scaleAspectFill
        return image
     }()
     
     let username : UILabel = {
        let name = UILabel()
        name.text = "Pongsakorn"
         name.font = UIFont.PoppinsBold(size: 18)
        return name
     }()
     
     let date : UILabel = {
           let timer = UILabel()
           timer.text = "12 ตุลาคม 2562 เวลา 15: 20"
           timer.font = UIFont.PoppinsMedium(size: 14)
           timer.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
           return timer
     }()
    
    
    let comment:UILabel = {
               let comment = UILabel()
               comment.text = "สวัสดีวันจันทร์แสนสดใส "
               comment.font = UIFont.PoppinsMedium(size: 18)
               comment.textColor = UIColor.black
               return comment
    }()
    
    
    let imagePost: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "tenor")
        image.contentMode = .scaleAspectFill
       return image
    }()
    
    let iconImageLike: UIButton = {
              let imagelike = UIImage(named: "like") as UIImage?
              let image = UIButton()
              image.setImage(imagelike, for: .normal)
              image.contentMode = .scaleAspectFill
              image.layer.masksToBounds = true
              return image
      }()
      
      let numCount: UILabel = {
              let label = UILabel()
              label.text = "0"
              label.textColor = UIColor.blackAlpha(alpha: 0.5)
              label.font = UIFont.PoppinsRegular(size: 18)
              label.numberOfLines = 0
              return label
      }()
    
//    var getname: String = ""
//    var gettime: String = ""
//    var gettitle: String = ""
//    var getimage: String = ""
//    var getProfile: String = ""
//    var getLike: String = ""
//
//    let screenSizeX: CGFloat = UIScreen.main.bounds.width
//       let screenSizeY: CGFloat = UIScreen.main.bounds.height
//
//    var viewScroll: UIScrollView = {
//                 let view = UIScrollView()
//                 return view
//    }()
//
//    let BGView: UIView = {
//                  let view = UIView()
//                  view.backgroundColor = .white
//                  view.layer.cornerRadius = 20
//                  return view
//              }()
//
//    let username : UILabel = {
//        let name = UILabel()
//        name.text = "WOW"
//        return name
//    }()
//
//    let timer : UILabel = {
//           let time = UILabel()
//           time.text = "WOW"
//           return time
//       }()
//
//    let titlename : UILabel = {
//        let title = UILabel()
//        title.text = "WOW"
//        return title
//    }()
//
//    let stepView2: UIImageView = {
//           let image = UIImageView()
//                image.contentMode = .scaleAspectFill
//                image.layer.masksToBounds = true
////                image.layer.cornerRadius = 5
//        image.layer.cornerRadius = 20/2
//           return image
//    }()
//
//    let stepView3: UILabel = {
//           let view = UILabel()
//            view.text = "username"
//            view.textColor = UIColor.black
//            view.font = UIFont.PoppinsBold(size: 20)
//           return view
//    }()
//
//    let stepView4: UILabel = {
//             let view = UILabel()
//                view.textColor = UIColor.blackAlpha(alpha: 0.5)
//                view.font = UIFont.PoppinsRegular(size: 14)
//             view.text = "timer"
//             return view
//      }()
//
//    let stepView5: UILabel = {
//               let view = UILabel()
//                view.text = "comment"
//               return view
//    }()
//
//    let stepView6: UIImageView = {
//                 let image = UIImageView()
//                    image.contentMode = .scaleAspectFill
//                    image.layer.masksToBounds = true
//                    image.layer.cornerRadius = 70/2
//                 return image
//      }()
//
//    let stepView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 20
//        return view
//    }()
//    let imgView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 50
//        return view
//    }()
//
//
//    let nextButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = .blue
//        button.layer.cornerRadius = 20
//        button.setTitle("Next", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//
//        return button
//    }()
//
//
//
//    let bgIcon : UIView = {
//       let bg = UIView()
////        bg.backgroundColor = .red
//       return bg
//    }()
//
//    let iconImageLike: UIButton = {
//           let imagelike = UIImage(named: "like") as UIImage?
//           let image = UIButton()
//           image.setImage(imagelike, for: .normal)
//           image.contentMode = .scaleAspectFill
//           image.layer.masksToBounds = true
//           return image
//       }()
//
//    let numCount: UILabel = {
//               let label = UILabel()
//               label.text = "0"
//               label.textColor = UIColor.blackAlpha(alpha: 0.5)
//               label.font = UIFont.PoppinsRegular(size: 22)
//               label.numberOfLines = 0
//               return label
//    }()
//
//    let line: UIView = {
//            let line = UIView()
//            line.backgroundColor = UIColor.blackAlpha(alpha: 0.3)
//            return line
//      }()
    
    func setupViewCell(){
        addSubview(pageView)
        addSubview(profile)
        addSubview(username)
        addSubview(date)
        addSubview(imagePost)
        addSubview(comment)
        addSubview(iconImageLike)
        addSubview(numCount)
        
        pageView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom:bottomAnchor, topConstant: 30, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: screenSizeY - 380)
        
        
        profile.anchor(pageView.topAnchor, left: pageView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
             
        username.anchor(pageView.topAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 0, widthConstant: 0, heightConstant: 20)
             
        date.anchor(username.bottomAnchor, left: profile.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 100, rightConstant: 0, widthConstant: 0, heightConstant: 20)
             
        
        comment.anchor(date.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 40)
  
        imagePost.anchor(comment.bottomAnchor, left: pageView.leftAnchor, right: pageView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        
        iconImageLike.anchor(imagePost.bottomAnchor, left: pageView.leftAnchor, right: nil, bottom: nil, topConstant: 30, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 30, heightConstant: 30)
               
        numCount.anchor(imagePost.bottomAnchor, left: iconImageLike.leftAnchor, right: nil, bottom: nil, topConstant: 35, bottomConstant: 10, leftConstant: 40, rightConstant: 10, widthConstant: 20, heightConstant: 20)
                    
        
        
//        super.viewDidLoad()
//        self.navigationController?.title = "โพสต์"
//        Alamofire.request(getimage).responseImage { response in
//                   if let image = response.result.value{
//                       self.stepView6.image = image
//                   }
//        }
//
//
//        Alamofire.request(getProfile).responseImage { response in
//                   if let image = response.result.value{
//                       self.stepView2.image = image
//                   }
//        }

//              stepView3.text! = getname
//              stepView5.text! = gettitle
//              stepView4.text! = gettime
//              numCount.text! = getLike
//
////              view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
//              nextButton.isHidden = true
//              BGView.isHidden = true
////              view.addSubview(viewScroll)
//
//              viewScroll.addSubview(stepView)
//              viewScroll.addSubview(stepView2)
//              viewScroll.addSubview(stepView3)
//              viewScroll.addSubview(stepView4)
//              viewScroll.addSubview(stepView5)
//              viewScroll.addSubview(stepView6)
//              viewScroll.addSubview(bgIcon)
//              viewScroll.addSubview(iconImageLike)
//              viewScroll.addSubview(numCount)
//              viewScroll.addSubview(line)
//
//              viewScroll.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: bottomAnchor, topConstant: 30, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//
//              stepView.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 40, heightConstant: 750)
//
//              stepView2.anchor(viewScroll.topAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: stepView5.topAnchor, topConstant: 0, bottomConstant: 20, leftConstant: 40, rightConstant: 250, widthConstant: screenSizeX, heightConstant: 200)
//
//              stepView3.anchor(viewScroll.topAnchor, left: stepView2.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 120, rightConstant: 40, widthConstant: screenSizeX - 40, heightConstant: 30)
//
//              stepView4.anchor(stepView3.bottomAnchor, left: stepView2.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 120, rightConstant: 40, widthConstant: screenSizeX - 40, heightConstant: 30)
//
//
//              stepView5.anchor(stepView4.bottomAnchor, left: stepView2.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 10, rightConstant: 50, widthConstant: screenSizeX - 20, heightConstant: 40)
//
//
//        stepView6.anchor(stepView5.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX - 20, heightConstant: 200)
//
//        bgIcon.anchor(stepView6.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: screenSizeX, heightConstant: 40)
//
//
//        iconImageLike.anchor(bgIcon.topAnchor, left: bgIcon.leftAnchor, right: numCount.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 280, widthConstant: screenSizeX, heightConstant: 35)
//
//        numCount.anchor(bgIcon.topAnchor, left: iconImageLike.leftAnchor, right: bgIcon.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 50, rightConstant: 0, widthConstant: screenSizeX, heightConstant: 35)
//
//        line.anchor(bgIcon.bottomAnchor, left: viewScroll.leftAnchor, right: viewScroll.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 25, rightConstant: 25, widthConstant: screenSizeX, heightConstant: 1.5)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
