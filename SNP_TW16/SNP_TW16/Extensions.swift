//
//  Extensions.swift
//  Design_ement_ios
//
//  Created by Guide on 13/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit

extension UIView {
    

    //การกำหนด func โดยกำหนดพื้นที่ บน,ล่าง,ซ้าย,ขวา
    func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, topConstant:CGFloat = 0, bottomConstant:CGFloat = 0, leftConstant:CGFloat = 0,
                rightConstant:CGFloat = 0,widthConstant:CGFloat = 0,
                heightConstant:CGFloat = 0){

        _ = anchorPositionReturn(top, left: left, right: right, bottom: bottom , topConstant: topConstant, bottomConstant: bottomConstant, leftConstant: leftConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)

    }
    //การกำหนด func โดยกำหนดพื้นที่ บน,ล่าง,ซ้าย,ขวา
    func anchorPositionReturn(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, topConstant:CGFloat = 0, bottomConstant:CGFloat = 0, leftConstant:CGFloat = 0,
                              rightConstant:CGFloat = 0,widthConstant:CGFloat = 0,
                              heightConstant:CGFloat = 0)->[NSLayoutConstraint]{
        translatesAutoresizingMaskIntoConstraints = false
        //รับค่า
        var anchors = [NSLayoutConstraint]()

        // การกำหนด constraint ในการกำหนด Elements //เช็คว่ามีการประกาศหรือเปล่า
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top,constant: topConstant))
        }

        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left,constant: leftConstant))
        }

        //การหนดค่าด้านขวา ต้องติดลบ
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right,constant: -rightConstant))
        }

        //การหนดค่าด้านล่าง ต้องติดลบ
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom,constant: -bottomConstant))
        }


        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }

        anchors.forEach({$0.isActive = true})
        return anchors
    }

}

extension UIColor {
    // 1 เข้ม // 0 บาง
    
    static func whiteAlpha(alpha: CGFloat) -> UIColor {
        return UIColor(white: 1, alpha: alpha)
    }
    
    static func blackAlpha(alpha: CGFloat) -> UIColor {
        return UIColor(white: 0, alpha: alpha)
    }
    
    static func rgb(red:CGFloat,green:CGFloat,blue:CGFloat)->UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static var jetBlack = UIColor.rgb(red: 255, green: 0, blue: 0)
    static var emerald = UIColor.rgb(red: 0, green: 222, blue: 182)
    static var gold = UIColor.rgb(red: 255, green: 182, blue: 0)
    
}



extension UIFont {
//    static func PoppinsBold(size: CGFloat)->UIFont{
//        return UIFont(name: "Poppins-Bold", size: size)!
//    }
//    
//    static func PoppinsLight(size: CGFloat)->UIFont{
//        return UIFont(name: "Poppins-Light", size: size)!
//    }
//    
//    static func PoppinsMedium(size: CGFloat)->UIFont{
//        return UIFont(name: "Poppins-Medium", size: size)!
//    }
//    
//    
//    static func PoppinsMediumItalic(size: CGFloat)->UIFont{
//        return UIFont(name: "Poppins-MediumItalic", size: size)!
//    }
//    
//    static func PoppinsRegular(size: CGFloat)->UIFont{
//        return UIFont(name: "Poppins-Regular", size: size)!
//    }
    
    //font
   static func BaiJamjureeBold(size: CGFloat)->UIFont{
        return UIFont(name: "BaiJamjuree-Bold", size: size)!
   }
    
    static func BaiJamjureeLight(size: CGFloat)->UIFont{
         return UIFont(name: "BaiJamjuree-Light", size: size)!
    }
    
    
    static func BaiJamjureeMedium(size: CGFloat)->UIFont{
         return UIFont(name: "BaiJamjuree-Medium", size: size)!
    }
    
    static func BaiJamjureeRegular(size: CGFloat)->UIFont{
         return UIFont(name: "BaiJamjuree-Regular", size: size)!
    }

}
