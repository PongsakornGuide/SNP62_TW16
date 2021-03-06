//
//  DiseaseTableViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class DiseaseTableViewCell: UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    //-----------------------------------------------------------------------------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
    //-----------------------------------------------------------------------------------------------
    let diseasePickerView = UIPickerView()
    var disease = ["ความดันโลหิตสูง","โรคเบาหวาน","โรคอักเสบ/ข้อเสื่อม","ภาวะหูตึง","ต้อกระจก","โรคหลอกเลือดหัวใจตีบ","อัมพาต","กล้ามเนื้อหัวใจตาย","ภาวะซึมเศร้า","ภาวะสมองเสื่อม"]
    
    var disease1 = [1,2,3,4,5,6,7,8,9,10]
    //-----------------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    //-----------------------------------------------------------------------------------------------
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //-----------------------------------------------------------------------------------------------
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return disease.count
    }
    //-----------------------------------------------------------------------------------------------
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
           return disease[row]
   
    }
    //-----------------------------------------------------------------------------------------------
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DiseaseTableViewCell.diseaseNameTextField.text = disease[row]
        DiseaseTableViewCell.diseaseNameTextField.tag = disease1[row]
    }
    //-----------------------------------------------------------------------------------------------
    lazy var BGView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    //-----------------------------------------------------------------------------------------------
    lazy var titleLabel : UILabel = {
                let label = UILabel()
                let title = "โรคประจำตัว"
                let style = NSMutableParagraphStyle()
                style.alignment = NSTextAlignment.center
                let attributedText = NSMutableAttributedString(string: title,
            attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 26),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 47, green: 58, blue: 243)])
                label.attributedText = attributedText
                label.numberOfLines = 0
                return label
   }()
   //-----------------------------------------------------------------------------------------------
    lazy var titlediseaseNameLabel : UILabel = {
                          let label = UILabel()
                          let title = "โรค:"
                          let attributedText = NSMutableAttributedString(string: title,
                                                    attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                          label.attributedText = attributedText
                          label.numberOfLines = 0
                          return label
   }()
    
   //-----------------------------------------------------------------------------------------------
   static var diseaseNameTextField: UITextField = {
                         let textField = UITextField()
                         textField.attributedPlaceholder = NSAttributedString(string: "โรคประจำตัว", attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
                         return textField
                     }()
   lazy var diseaseTextFieldLine: UIView = {
                            let view = UIView()
                            view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
                            return view
                     }()
       
   //-----------------------------------------------------------------------------------------------
   lazy var titlediseaseDetailLabel : UILabel = {
                           let label = UILabel()
                           let title = "รายละเอียดอื่นๆ:"
                           let attributedText = NSMutableAttributedString(string: title,
                                                     attributes: [ NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15),NSMutableAttributedString.Key.foregroundColor : UIColor.rgb(red: 167, green: 169, blue: 172)])
                           label.attributedText = attributedText
                           label.numberOfLines = 0
                           return label
    }()
    //-----------------------------------------------------------------------------------------------
    static var diseaseDetailTextField: UITextField = {
            let textField = UITextField()
            textField.attributedPlaceholder = NSAttributedString(string: "รายละเอียดอื่นๆ",attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeMedium(size: 15), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 167, green: 169, blue: 172)])
            return textField
                     }()
    lazy var diseaseDetailTextFieldLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
            return view
    }()
    //-----------------------------------------------------------------------------------------------
    func setLayout(){
        backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        addSubview(BGView)
        addSubview(titleLabel)
        addSubview(titlediseaseNameLabel)
        addSubview(DiseaseTableViewCell.diseaseNameTextField)
        addSubview(diseaseTextFieldLine)
        addSubview(titlediseaseDetailLabel)
        addSubview(DiseaseTableViewCell.diseaseDetailTextField)
        addSubview(diseaseDetailTextFieldLine)
        diseasePickerView.delegate = self
        diseasePickerView.dataSource = self
        DiseaseTableViewCell.diseaseNameTextField.inputView = diseasePickerView
        
        
        BGView.anchor(safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 30, bottomConstant: 30, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        titleLabel.anchor(BGView.topAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        titlediseaseNameLabel.anchor(titleLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        DiseaseTableViewCell.diseaseNameTextField.anchor(titlediseaseNameLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        
        diseaseTextFieldLine.anchor(DiseaseTableViewCell.diseaseNameTextField.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 0, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)
        
        
        titlediseaseDetailLabel.anchor(diseaseTextFieldLine.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 40, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        

        DiseaseTableViewCell.diseaseDetailTextField.anchor(titlediseaseDetailLabel.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: nil, topConstant: 30, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)

        diseaseDetailTextFieldLine.anchor(DiseaseTableViewCell.diseaseDetailTextField.bottomAnchor, left: BGView.leftAnchor, right: BGView.rightAnchor, bottom: BGView.bottomAnchor, topConstant: 10, bottomConstant: 40, leftConstant: 20, rightConstant: 20 , widthConstant: 0, heightConstant: 1.5)

    }
    
}
