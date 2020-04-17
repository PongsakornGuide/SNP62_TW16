//
//  TitleTableVIiewCellTest.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class TitleTableVIiewCellTest:UITableViewCell,UITextFieldDelegate,UINavigationControllerDelegate {
        let screenSizeX: CGFloat = UIScreen.main.bounds.width
        let screenSizeY: CGFloat = UIScreen.main.bounds.height
     
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
        let bgView : UIView = {
              let view = UIView()
              return view
        }()
    
       
       let btnBack : UIButton = {
              let btn = UIButton()
              btn.tintColor = UIColor.black
              btn.setImage(UIImage(named: "left-arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
              btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(TestCheckBoxTableView.performSegueToReturnBack), for: .touchUpInside)
              return btn
       }()
          
    
    
        let stepView: UIImageView = {
              let view = UIImageView()
              view.image = UIImage(named: "Step3")
              view.layer.cornerRadius = 30/2
              return view
        }()
    
        
    
        lazy var viewbg:UIView = {
            let view = UIView()
            return view
        }()

       func setLayout(){
           addSubview(bgView)
           addSubview(btnBack)
           addSubview(viewbg)
           addSubview(stepView)
           backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
            bgView.anchor(safeAreaLayoutGuide.topAnchor, left:safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
            btnBack.anchor(bgView.topAnchor, left: bgView.leftAnchor, right: nil, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 20, heightConstant: 20)

            viewbg.anchor(btnBack.bottomAnchor, left: bgView.leftAnchor, right: bgView.rightAnchor, bottom: bgView.bottomAnchor, topConstant: 30, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        
            stepView.anchor(viewbg.topAnchor, left: viewbg.leftAnchor, right: viewbg.rightAnchor, bottom: viewbg.bottomAnchor   , topConstant: 0, bottomConstant: 20, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 110)
        
       }
}
