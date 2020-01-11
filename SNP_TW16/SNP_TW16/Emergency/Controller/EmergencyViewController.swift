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
    private var cellId2 = "Cell2"
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
             
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              if section == 0 {
                  return 1
              }else if section == 1{
                  return 4
              }else{
                  return 1
              }
    }
//    heightForHeaderInSection

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! EmergencyView
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            } else if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DetailEmergencyView
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! AddTelView
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
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
    
    @objc func check(){
        print("แอดเบอร์")
    }
    
    @objc func open(){
        print("ปุ่มโทร")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 12.1 , *) {
            tableView.refreshControl = refresher
        }else{
            tableView.addSubview(refresher)
        }
        
        
        tableView.register(EmergencyView.self, forCellReuseIdentifier: cellId)
        tableView.register(DetailEmergencyView.self, forCellReuseIdentifier: cellId1)
        tableView.register(AddTelView.self, forCellReuseIdentifier: cellId2)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
        
        animateTable()
    }
}
