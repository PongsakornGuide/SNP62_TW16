//
//  activityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 10/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
// call UICollectionViewController,UICollectionViewDelegateFlowLayout
class activityViewController : UICollectionViewController,UICollectionViewDelegateFlowLayout {

    private var headerID = "Header"
    
    
    private var searchID = "search Cell"
    private var actID = "act Cell"
    private var newactID = "new act Cell"
    private var listID = "list Cell"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.backgroundColor = .white
        //add header
        collectionView.register(headerCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        //register view class
        collectionView.register(ImageCell2.self, forCellWithReuseIdentifier: searchID)
        collectionView.register(activityCollectionViewCell.self, forCellWithReuseIdentifier: actID)
        collectionView.register(newActivityCollectionViewCell.self, forCellWithReuseIdentifier: newactID)
        collectionView.register(listCollectionViewCell.self, forCellWithReuseIdentifier: listID)
    
            
          navigationItem.title = "Aldre"
                
                navigationController?.navigationBar.isTranslucent = false
                navigationController?.navigationBar.barTintColor = UIColor.whiteAlpha(alpha: 0.9)
                
                navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.PoppinsBold(size: 20),NSAttributedString.Key.foregroundColor: UIColor.emerald]
                
            
                
        
//            let menu = UIBarButtonItem(image: UIImage(named: "gift-box"), style: .plain, target: self, action: #selector(handleMenu))
//            navigationItem.leftBarButtonItem = menu
//            menu.tintColor = .red
            
//            let menu2 = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(handleMenu2))
//                   menu2.tintColor = .red

            let menu3 = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(handleMenu3))
            menu3.tintColor = .red

            navigationItem.rightBarButtonItems = [menu3]
        }

        
//      @objc func handleMenu2(){
//    //        dismiss(animated: true, completion: nil)
//            let text = "Sample Text to share....."
//            let activitiyViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
//            present(activitiyViewController, animated: true, completion: nil)
//        }
    @objc func handleMenu3(){
    //        dismiss(animated: true, completion: nil)
            let AlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)

            AlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

//            AlertController.addAction(UIAlertAction(title: "BlueTooth", style: .default, handler: {(_ )in
//                print("BlueTooth")
//
//            } ))
            AlertController.addAction(UIAlertAction(title: "Register", style: .destructive, handler: {(_ )in
                print("Register")
                            let nextController = HomeViewController()
    
                            self.show(nextController, sender: true)
            } ))
//            AlertController.addAction(UIAlertAction(title: "Comfrim", style: .default, handler: {(_ )in
//                print("Cancel")
//            } ))
            present(AlertController, animated: true, completion: nil)
        }
    

    //4 section
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    //check section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 4 {
            return 10
        } else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width: view.frame.width, height: 0)
        }else if section == 1{
            return CGSize(width: view.frame.width, height: 70)
        }else if section == 2{
            return CGSize(width: view.frame.width, height: 70)
        }else {
            return CGSize(width: view.frame.width, height: 70)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! headerCollectionViewCell
        return header
    }
    
    var items = Items.items()
    var items2 = Items2.items()
    var items3 = Items3.items()
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchID, for: indexPath) as! ImageCell2
                return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: actID, for: indexPath) as!
                activityCollectionViewCell
                cell.items = items
                return cell
            
        }else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newactID, for: indexPath) as! 
                newActivityCollectionViewCell
                cell.items = items2
                return cell
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listID, for: indexPath) as! listCollectionViewCell
            cell.items = items3
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let searchWidth = view.frame.width
            return CGSize(width: searchWidth, height: 250)
        }else if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 220)
        }else if indexPath.section == 2 {
            return CGSize(width: view.frame.width, height: 220)
        }else{
            let itemWidth = (view.frame.width - 60)
            return CGSize(width: itemWidth, height: 220)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 3 {
            return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        }else if section == 1{
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 3 {
            return 20
        }else if section == 1{
            return 20
        }else{
            return 0
        }
    }
    
    
}
