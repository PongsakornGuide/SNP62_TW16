//
//  EmergencyViewController.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class EmergencyViewController: UITableViewController {
    let defaultValues = UserDefaults.standard
    var user_id = String()
    
    
    
    let URL_GET_TEL = "\(AppDelegate.link)alder_iosapp/v1/emergency.php"
    let URL_GET_TEL_RELATIVE = "\(AppDelegate.link)alder_iosapp/v1/showTel.php"
    let URL_GET_TEL_RELATIVE_ADD = "\(AppDelegate.link)alder_iosapp/v1/showTelRelative.php"
    
//    let URL_GET_TEL = "http://172.20.10.5/alder_iosapp/v1/emergency.php"
//    let URL_GET_TEL_RELATIVE = "http://172.20.10.5/alder_iosapp/v1/showTel.php"
//    let URL_GET_TEL_RELATIVE_ADD = "http://172.20.10.5/alder_iosapp/v1/showTelRelative.php"
    
    var relativeList: [listRelative]?
    var emergencyList: [allListTel]?
    var userRelavite: [addRelative]?
    
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    private var cellId3 = "Cell3"
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           getRelative()
           getList()
           getUserRelative()
           self.tableView.reloadData()
       }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
             
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              if section == 0 {
                  return relativeList?.count ?? 0
              }else if section == 1{
                  return emergencyList?.count ?? 0
              }else if section == 2{
                  return userRelavite?.count ?? 0
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
                let Emergency = emergencyList?[indexPath.row]
//                        cell.num.text = "\(Emergency?.emergencyCall ?? 0)"
                        cell.title.text = Emergency?.emergencyName ?? "5555"
                
                
                Alamofire.request((Emergency?.emergencyIcon ?? "0")!).responseImage { response in
                       if let image = response.result.value {
                            cell.ImageView.image = image
                       }
                }
                
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                self.tableView.separatorStyle = .none
                return cell
                
            }else if indexPath.section == 2{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId3,for: indexPath) as! ListRelatuveView
                let ListRelative = userRelavite?[indexPath.row]
//                cell.num.text = "\(ListRelative?.telphone ?? 0)"
                cell.title.text = "\(ListRelative?.username ?? "nil")"
                cell.selectionStyle = .none
                  cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                self.tableView.separatorStyle = .none
                return cell
            }else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! AddTelView
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }
        }
    
    //Func call phone
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
                let callRelative = self.relativeList?[indexPath.row]
            var TelUser = "\(0)\(callRelative?.relativeTel ?? 0)"
              if let url = URL(string: "tel://\(TelUser)"), UIApplication.shared.canOpenURL(url){
                                  if #available(iOS 10, *) {
                                      UIApplication.shared.open(url)
                                  } else {
                                      UIApplication.shared.openURL(url)
                                  }
                        }
        }else if indexPath.section == 1{
                let callEmergency = self.emergencyList?[indexPath.row]

                  if let url = URL(string: "tel://\(callEmergency?.emergencyCall ?? 0)"), UIApplication.shared.canOpenURL(url) {
                            if #available(iOS 10, *) {
                                UIApplication.shared.open(url)
                            } else {
                                UIApplication.shared.openURL(url)
                            }
            }
        }else if indexPath.section == 2{
            let callAddRelative = self.userRelavite?[indexPath.row]
            var TelDecide = "\(0)\(callAddRelative?.telphone ?? 0)"
            if let url = URL(string: "tel://\(TelDecide)"), UIApplication.shared.canOpenURL(url) {
                      if #available(iOS 10, *) {
                          UIApplication.shared.open(url)
                      } else {
                          UIApplication.shared.openURL(url)
                      }
            }
        }else{
            print("section3")
        }
    }
    
    func getRelative(){
        let parameters: Parameters = ["userId":user_id]
        let url = URL_GET_TEL_RELATIVE + "?id=\(user_id)"
        print(url)
        Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
             self?.relativeList = Mapper<listRelative>().mapArray(JSONObject: dataRes.result.value)
             self?.tableView.reloadData()
             print(dataRes)
        }
    }
    
    func getList(){
           Alamofire.request(URL_GET_TEL).responseJSON { [weak self](resData) in
            self?.emergencyList = Mapper<allListTel>().mapArray(JSONObject: resData.result.value)
            self?.tableView.reloadData()
            }
    }
    
    func getUserRelative(){
        let parameters: Parameters = ["userId":user_id]
        let url = URL_GET_TEL_RELATIVE_ADD + "?id=\(user_id)"
        Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](TelData)
            in
            self?.userRelavite = Mapper<addRelative>().mapArray(JSONObject: TelData.result.value)
            self?.tableView.reloadData()
        }
    }
    
    func animateTable(){
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
        let RefreshLine = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: RefreshLine) {
            self.refresher.endRefreshing()
            self.getRelative()
            self.getList()
            self.getUserRelative()
        }
    }
    
    @objc func addTelUserRelative(){
        let createRelative = CreateRelativeTelView()
        navigationController?.pushViewController(createRelative, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isHidden = true
        navigationItem.title = "Alder"
        if #available(iOS 12.1 , *) {
            tableView.refreshControl = refresher
        }else{
            tableView.addSubview(refresher)
        }
        if let user = defaultValues.string(forKey: "userId") {
            user_id = user
            print(user_id)
         }else{
                      //send back to login view controller
        }
        
        tableView.register(EmergencyView.self, forCellReuseIdentifier: cellId)
        tableView.register(DetailEmergencyView.self, forCellReuseIdentifier: cellId1)
        tableView.register(AddTelView.self, forCellReuseIdentifier: cellId2)
        tableView.register(ListRelatuveView.self, forCellReuseIdentifier: cellId3)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        animateTable()
    }
}
