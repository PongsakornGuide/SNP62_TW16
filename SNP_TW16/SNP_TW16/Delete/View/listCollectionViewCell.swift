//
//  listCollectionViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 11/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class listCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    override init(frame: CGRect) {
        super.init(frame: frame)
              setupViewCell()
    }
    
       

    var items = [Items3]()
    //กำหนด size
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
//
//        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
//
    private var cellId = "Cell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
     //จุด1
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCell4
        cell.items = items[indexPath.row]
        return cell
     }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let itemWidth = ( frame.width - 5 )
        return CGSize(width: itemWidth, height: 290)
    }
    
    //จุด2
    func setupViewCell(){
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell4.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        
         collectionView.anchor(topAnchor, left: leftAnchor, right: rightAnchor , bottom: bottomAnchor, topConstant: -10, bottomConstant: -10,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
