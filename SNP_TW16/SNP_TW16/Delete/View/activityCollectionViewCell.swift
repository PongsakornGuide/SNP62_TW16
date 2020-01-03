//
//  activityCollectionViewCell.swift
//  SNP_TW16
//
//  Created by Guide on 11/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class activityCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    override init(frame: CGRect) {
        super.init(frame: frame)
              setupViewCell()
        
        
    }
    
   
    var items = [Items]()
    
    //กำหนด size
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private var cellId = "Cell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCell
        cell.items = items[indexPath.row]
        return cell
     }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let itemWidth = ( frame.width - 90 ) / 2
        return CGSize(width: itemWidth, height: 250)
    }
    
    
    func setupViewCell(){
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        
         collectionView.anchor(topAnchor, left: leftAnchor, right: rightAnchor , bottom: bottomAnchor, topConstant: -10, bottomConstant: -10,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 30, bottom: -10, right: -10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
