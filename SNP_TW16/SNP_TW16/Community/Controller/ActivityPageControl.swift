////
////  ActivityPageControl.swift
////  SNP_TW16
////
////  Created by Guide on 31/12/2562 BE.
////  Copyright © 2562 guide. All rights reserved.
////
//
//import UIKit
//class ActivityPageControl: UICollectionViewController,  UICollectionViewDelegateFlowLayout {
//    
//    private var actCellid = "Cell"
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = .red
//        collectionView.register(ActivityPageViewController.self, forCellWithReuseIdentifier: actCellid)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: actCellid, for: indexPath) as! ActivityPageViewController
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//}
