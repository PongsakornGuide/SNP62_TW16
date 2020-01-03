//
//  EmergencyViewController.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class EmergencyViewController: UITableViewController {
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    
    override func numberOfSections(in tableView: UITableView) -> Int {
              return 2
    }
             
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              if section == 0 {
                  return 1
              }else {
                  return 3
              }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! EmergencyView
                cell.selectionStyle = .none
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DetailEmergencyView
                cell.selectionStyle = .none
                return cell
            }
        }
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
        }
        
    }
    
    // refresh
    lazy var refresher: UIRefreshControl = {
         let refreshControl = UIRefreshControl()
         refreshControl.tintColor = .black
         refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
         return refreshControl
    }()
    
    // action refresh
    @objc func requestData(){
        print("requestData for tableView")
        let RefreshLine = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: RefreshLine) {
            self.refresher.endRefreshing()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // refresh
        if #available(iOS 12.1 , *) {
            tableView.refreshControl = refresher
        }else{
            tableView.addSubview(refresher)
        }
        
        
        tableView.register(EmergencyView.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        tableView.register(DetailEmergencyView.self, forCellReuseIdentifier: cellId1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        animateTable()
    }
}
