//
//  testbtncheck.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 23/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import FaveButton


func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class testbtncheck: UIViewController, FaveButtonDelegate{

    let heartButton = FaveButton(
        frame: CGRect(x:20, y:20, width: 44, height: 44),
        faveIconNormal: UIImage(named: "heart")
    )

        
    let loveButton = FaveButton(frame: CGRect(x:50, y:50, width: 44, height: 44),faveIconNormal: UIImage(named: "heart"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loveButton.delegate = self
//        heartButton.delegate = self
        view.addSubview(heartButton)
//        view.addSubview(loveButton)
        view.backgroundColor = .white
        heartButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 120, bottomConstant: 0, leftConstant: 150, rightConstant: 150, widthConstant: 50, heightConstant: 50)
        

        

    }
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if(faveButton === heartButton || faveButton === loveButton){
            return colors
        }
        return nil
    }
}


