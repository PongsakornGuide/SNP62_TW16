//
//  PageControlController.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class PageControlController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    private var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(ComViewController.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.isPagingEnabled = true
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ComViewController
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor.emerald
        }else if indexPath.row == 1{
            cell.backgroundColor = UIColor.systemPink
        }else if indexPath.row == 2 {
            cell.backgroundColor = UIColor.gold
        }else{
            cell.backgroundColor = UIColor.cyan
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
