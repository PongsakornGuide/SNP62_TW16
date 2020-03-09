//
//  DiseaseTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DiseaseTableViewCell: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
    
    let diseasePickerView = UIPickerView()
    var disease = ["1","2","3","4"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return disease.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
           return disease[row]
   
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                diseaseNameTextField.text = disease[row]
    }
    
    lazy var BGView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var titleLabel : UILabel = {
                let label = UILabel()
                let title = "โรคประจำตัว"
                let style = NSMutableParagraphStyle()
                style.alignment = NSTextAlignment.center
                let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.PoppinsBold(size: 26),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
   }()
    
   lazy var diseaseNameTextField: UITextField = {
                         let textField = UITextField()
                         textField.attributedPlaceholder = NSAttributedString(string: "โรคประจำตัว", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
                         textField.textColor = .black
                         textField.font = UIFont.boldSystemFont(ofSize: 15)
                         return textField
                     }()
    lazy var diseaseTextFieldLine: UIView = {
                            let view = UIView()
                            view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
                            return view
                     }()
       
                 //-----------------------------------------------------------------------------------------------
    lazy var diseaseDetailTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "รายละเอียดอื่นๆ",attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.blackAlpha(alpha: 0.5)])
             textField.textColor = .black
             textField.font = UIFont.boldSystemFont(ofSize: 15)
             return textField
                     }()
    lazy var diseaseDetailTextFieldLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.blackAlpha(alpha: 0.5)
            return view
    }() //-----------------------------------------------------------------------------------------------
        
            
              
    func setLayout(){
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        addSubview(BGView)
        addSubview(titleLabel)
        addSubview(diseaseNameTextField)
        addSubview(diseaseTextFieldLine)
        addSubview(diseaseDetailTextField)
        addSubview(diseaseDetailTextFieldLine)
        diseasePickerView.delegate = self
        diseasePickerView.dataSource = self
        diseaseNameTextField.inputView = diseasePickerView
        
        
        BGView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 30, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 350)

        titleLabel.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        diseaseNameTextField.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 100)
        
        diseaseTextFieldLine.anchor(diseaseNameTextField.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 10, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)

        
        diseaseDetailTextField.anchor(diseaseTextFieldLine.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 100)
        
        diseaseDetailTextFieldLine.anchor(diseaseDetailTextField.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 0, bottomConstant: 40, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)

    }
    
}
