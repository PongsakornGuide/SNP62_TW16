//
//  ProfileVIewController.swift
//  SNP_TW16
//
//  Created by Guide on 2/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
class ProfileVIewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = rowToDisplay[indexPath.row]
        return cell
    }
    
    
    let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["NOTIFICATION","POST","PROFILE"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
    @objc func handleSegmentChange (){
//        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
          rowToDisplay = notification
        case 1:
          rowToDisplay = posttimeline
        default:
          rowToDisplay = profile
        }
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let notification = ["MAMA","BABA","DADA"]
    let posttimeline = ["Mama send comment","Mama send comment","Mama send comment"]
    let profile = ["Pongsakorn","Higeht : 300","Weight 198"]
    
    lazy var rowToDisplay = notification
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "PROFILE"
        
        let stackView = UIStackView(arrangedSubviews:[segmentedControl, tableView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, topConstant: 20, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
    }
    
}
