//
//  registerViewController.swift
//  SNP_TW16
//
//  Created by Guide on 14/9/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Pastel

class registerViewController: UIViewController {

    //Change color on Tab
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    let imageView : UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "ryan-moreno-IcAtXrAZx8E-unsplash")
        image.layer.cornerRadius = 5
        image.layer.opacity = 0.5
        image.backgroundColor = UIColor.whiteAlpha(alpha: 0.6)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    
    let headerLabel: UILabel = {
    //กำหนด Attribute
    let label = UILabel()
    let title = "Create Your Free Account"
    let text = "\n \n Already here an account?."
    let style = NSMutableParagraphStyle()
    style.alignment = NSTextAlignment.center
    let attributedText = NSMutableAttributedString(string: title,attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 35),NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedText.append(NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.PoppinsLight(size: 14), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.8)]))
    label.attributedText = attributedText
    label.numberOfLines = 0
    return label
    }()
    
    
    let drawLine : UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.whiteAlpha(alpha: 0.4)
    line.layer.cornerRadius = 35
    return line
    }()

    let fullnameView: UIView = {
        let view = UIView()
        return view
    }()
    
    let fullnameIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"avatar")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.tintColor = UIColor.white
        return image
    }()
    
    let fullnameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.5)])
            textField.font = UIFont.PoppinsRegular(size: 16)
            textField.textColor = UIColor.whiteAlpha(alpha: 0.7)
        textField.addTarget(self, action: #selector(handleFullnameCheckValid), for: .editingChanged)
            return textField
    }()
    
    
    @objc func handleFullnameCheckValid(){
        let isFormValid = fullnameTextField.text?.count ?? 0 > 0
        fullnameCheckValid.isHidden = false
        if isFormValid {
            fullnameCheckValid.tintColor = UIColor.rgb(red: 69, green: 219, blue: 96)
        } else{
            fullnameCheckValid.tintColor = UIColor.rgb(red: 243, green: 48, blue: 73)
        }
    }
    
    
    let fullnameBottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteAlpha(alpha: 0.5)
        return view
    }()
    
    let fullnameCheckValid: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "circle")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    let passwordView: UIView = {
        let view = UIView()
        return view
    }()
    
    let passwordIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"padlock")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.tintColor = UIColor.white
        return image
    }()
    
    let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.5)])
            textField.font = UIFont.PoppinsRegular(size: 16)
            textField.textColor = UIColor.whiteAlpha(alpha: 0.7)
            textField.isSecureTextEntry = true
            textField.addTarget(self, action: #selector(handlePasswordCheckValid), for: .editingChanged)
            return textField
        }()
    
    
    @objc func handlePasswordCheckValid(){
        let isFormValid = passwordTextField.text?.count ?? 0 > 0
        passwordCheckValid.isHidden = false
        if isFormValid {
            passwordCheckValid.tintColor = UIColor.rgb(red: 69, green: 219, blue: 96)
        } else{
            passwordCheckValid.tintColor = UIColor.rgb(red: 243, green: 48, blue: 73)
        }
    }
    
    let passwordBottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteAlpha(alpha: 0.5)
        return view
    }()
    
    let showHidePasswordButton : UIButton = {
         let button = UIButton()
        button.setImage(UIImage(named: "hide")?.withRenderingMode(.alwaysTemplate),  for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor.white
        button.tintColor = UIColor.white
        return button
    }()
    
    let passwordCheckValid: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "circle")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    
    let birthdayView: UIView = {
        let view = UIView()
        return view
    }()
    
    let birthdayIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"gift-box")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.tintColor = UIColor.white
        return image
    }()

    let datePicker = UIDatePicker()
    let txtDatePicker: UITextField = {
        let txt = UITextField()
        txt.attributedPlaceholder = NSAttributedString(string: "Birthday", attributes: [NSAttributedString.Key.font : UIFont.PoppinsRegular(size: 18), NSAttributedString.Key.foregroundColor: UIColor.whiteAlpha(alpha: 0.5)])
        txt.font = UIFont.PoppinsRegular(size: 16)
        txt.textColor = UIColor.whiteAlpha(alpha: 0.7)
        txt.addTarget(self, action: #selector(handleBirthdayCheckValid), for: .allEvents)
        return txt
    }()

    @objc func handleBirthdayCheckValid(){
        let isFormValid = txtDatePicker.text?.count ?? 0 > 0
        birthdayCheckValid.isHidden = false
        if isFormValid {
            birthdayCheckValid.tintColor = UIColor.rgb(red: 69, green: 219, blue: 96)
        } else{
            birthdayCheckValid.tintColor = UIColor.rgb(red: 243, green: 48, blue: 73)
        }
    }

    
    let birthdayBottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteAlpha(alpha: 0.5)
        return view
    }()
    
    let birthdayCheckValid: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "circle")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    let btnConfirm : UIButton = {
        let btnConfirm = UIButton()
        btnConfirm.backgroundColor = UIColor.black
        btnConfirm.layer.borderColor = UIColor.black.cgColor
        btnConfirm.layer.borderWidth = 3
        btnConfirm.layer.cornerRadius = 30
        btnConfirm.setTitle("Create Account", for: .normal)
        btnConfirm.setTitleColor(UIColor.whiteAlpha(alpha: 0.8), for: .normal)
        btnConfirm.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btnConfirm.tintColor = UIColor.white
        btnConfirm.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btnConfirm.layer.shadowOffset = CGSize(width: 0, height: 3)
        btnConfirm.layer.shadowOpacity = 1.0
        btnConfirm.layer.shadowRadius = 10.0

        btnConfirm.setImage(UIImage(named: "correct-symbol")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnConfirm.imageView?.contentMode = .scaleAspectFit
        btnConfirm.imageEdgeInsets = UIEdgeInsets(top: 10, left: -20, bottom: 10, right: 0)

        return btnConfirm
    }()
    

     func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }


    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    //func cancel
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    
    let btnBack : UIButton = {
        let btn = UIButton()
        btn.tintColor = UIColor.black
        btn.setImage(UIImage(named: "left-arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(performSegueToReturnBack), for: .touchUpInside)
        return btn
    }()
    
    @objc func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.navigationController?.popToRootViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // เขียนรวมกัน
        let stackView = UIStackView(arrangedSubviews: [fullnameView,passwordView,birthdayView])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        view.addSubview(imageView)
        view.insertSubview(imageView, at: 0)
        view.addSubview(stackView)
        view.addSubview(headerLabel)
        view.addSubview(drawLine)
        view.addSubview(btnConfirm)
        view.addSubview(showHidePasswordButton)
          view.addSubview(btnBack)
        view.backgroundColor = .white
        
        
        //call func
        showDatePicker()
        pastelBackground()
        fullname()
        password()
        birthday()
        
        btnBack.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20
        )
        
        headerLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant:  100, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 0)

        drawLine.anchor(headerLabel.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20,      rightConstant: 20, widthConstant: 0, heightConstant: 1)

        stackView.anchor(drawLine.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 175)
        
        btnConfirm.anchor(stackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 50, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 60)
        
    }
    
    fileprivate func fullname(){
        //cell
        fullnameView.addSubview(fullnameIcon)
        fullnameView.addSubview(fullnameTextField)
        fullnameView.addSubview(fullnameBottomLine)
        fullnameView.addSubview(fullnameCheckValid)
        
        //check
        fullnameCheckValid.isHidden = true
        
        //textField
        fullnameIcon.anchor(fullnameView.safeAreaLayoutGuide.topAnchor, left: fullnameView.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
        
        fullnameTextField.anchor(fullnameView.topAnchor, left: fullnameIcon.rightAnchor, right: fullnameView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        fullnameBottomLine.anchor(nil, left: fullnameView.leftAnchor, right: fullnameView.rightAnchor, bottom: fullnameView.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        fullnameCheckValid.anchor(fullnameView.topAnchor, left: nil, right: fullnameView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 12, heightConstant: 12)
        
    }
    
    fileprivate func password(){
        //cell
        passwordView.addSubview(passwordIcon)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(passwordBottomLine)
        passwordView.addSubview(passwordCheckValid)
        
        //check
        passwordCheckValid.isHidden = true
        
        //textField
        
        passwordIcon.anchor(passwordView.safeAreaLayoutGuide.topAnchor, left: passwordView.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
        
        passwordTextField.anchor(passwordView.topAnchor, left: passwordIcon.rightAnchor, right: passwordView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        passwordBottomLine.anchor(nil, left: passwordView.leftAnchor, right: passwordView.rightAnchor, bottom: passwordView.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        showHidePasswordButton.anchor(passwordView.topAnchor, left: nil, right: passwordView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
        
         passwordCheckValid.anchor(passwordView.topAnchor, left: nil, right: showHidePasswordButton.leftAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 12, heightConstant: 12)
        
    }
    
    fileprivate func birthday(){
        //cell
        birthdayView.addSubview(birthdayIcon)
        birthdayView.addSubview(txtDatePicker)
        birthdayView.addSubview(birthdayBottomLine)
        birthdayView.addSubview(birthdayCheckValid)
        
        
        //check
        birthdayCheckValid.isHidden = true
        
        //textField
        birthdayIcon.anchor(birthdayView.safeAreaLayoutGuide.topAnchor, left: birthdayView.leftAnchor, right: nil, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
        
        txtDatePicker.anchor(birthdayView.topAnchor, left: birthdayIcon.rightAnchor, right: birthdayView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        birthdayBottomLine.anchor(nil, left: birthdayView.leftAnchor, right: birthdayView.rightAnchor, bottom: birthdayView.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
         birthdayCheckValid.anchor(birthdayView.topAnchor, left: nil, right: birthdayView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 12, heightConstant: 12)
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



//            textField.layer.borderColor = UIColor.white.cgColor
//            textField.layer.cornerRadius = 30
//            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
//            textField.leftViewMode = UITextField.ViewMode.always
//            textField.backgroundColor = UIColor.white
//            textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9).cgColor
//            textField.layer.shadowOffset = CGSize(width: 0, height: 0)
//            textField.layer.shadowOpacity = 0.5
//            textField.layer.shadowRadius = 6.0
//      textField.addTarget(self, action: #selector(handleFullnameCheckValid), for: .editingChanged)
