//
//  homeViewController.swift
//  SNP_TW16
//
//  Created by Guide on 14/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Pastel
class HomeViewController: UIViewController {
 
    
    //Change color on Tab
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    let imageView : UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "marisa-howenstine-nFsOlSE9Mn8-unsplash")
        image.layer.cornerRadius = 5
        image.layer.opacity = 0.4
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    let WelcomeTilteLabel: UILabel = {
        let label = UILabel()
        let title = "Aldre"
        let text = "\n \n Hello World Swift iOS Programmer be happy on your day something Wrote. often used in conjuration with control to describe their intended purpose."
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont(name: "Didot-Bold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.8)])
        
        attributedText.append(NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 1)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    let registerApplication  : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = UIColor.rgb(red: 0, green: 5, blue: 224)
        button.layer.cornerRadius = 30
        button.setTitle("ลงทะเบียนฟรี", for: .normal)
        button.setTitleColor(UIColor.whiteAlpha(alpha: 0.8), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.whiteAlpha(alpha: 0.8)
        button.addTarget(self, action: #selector(handleSignInWithRegister), for: .touchUpInside)
        
        return button
    }()
    
        @objc func handleSignInWithRegister(){
            let CreatePost = MobileOtpViewController()
            navigationController?.pushViewController(CreatePost, animated: true)
        }
    
    let signInApplication  : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.whiteAlpha(alpha: 0)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.setTitle("เข้าสู่ระบบ", for: .normal)
        button.setTitleColor(UIColor.whiteAlpha(alpha: 0.8), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.whiteAlpha(alpha: 0.8)
        return button
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        let title = "By continus Application Support Older"
        let text = "\n © 2019 Older, Inc."
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.8)])
        
        attributedText.append(NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.7)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
        view.insertSubview(imageView, at: 0)
        view.addSubview(footerLabel)
        view.addSubview(registerApplication)
        view.addSubview(signInApplication)
        view.addSubview(WelcomeTilteLabel)
        
//        view.addSubview(activity)
        pastelBackground()
        
        WelcomeTilteLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 200, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 0)
        
        footerLabel.anchor(nil, left: view.leftAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 40, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 0)
      
        registerApplication.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 530, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 60)
        
        signInApplication.anchor(registerApplication.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 60)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func pastelBackground(){
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        //Start Working
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
}

