//
//  TableCheck.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class SubActivityTypeTableViewController: UITableViewController {
    
    let URL_USER_ID = "http://localhost/alder_iosapp/v1/showactivity.php/"
//    let URL_USER_ID = "http://172.20.10.5/alder_iosapp/v1/showactivity.php/"
    
    let URL_CHECK_INVITE = "http://localhost/alder_iosapp/v1/inviteActivity.php"
    
    let defaultValues = UserDefaults.standard
    var typecheck = String()
    var activityList : [ActivityDetail]?
    var invait = Int()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    if section == 0 {
        return 1
    }else{
        return activityList?.count ?? 0
        }
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if indexPath.section == 0 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ActivityHeaderViewCell
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                                    return cell
                 }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
                    let activity = activityList?[indexPath.row]
                    cell.titleFullname.text = activity?.actId
                    cell.supportName.text = activity?.caption
                    cell.supportTime.text = activity?.created
                    
                    
                   Alamofire.request((activity?.imagePost ?? "0")!).responseImage { response in
                   if let image = response.result.value {
                    cell.bgActivitity.image = image
                       }
                   }
                    
                    invait = activity?.dataId ?? 0
//                    print("กิจกรรมลำดับที่ = \(invait)")
                    
                    let parameters: Parameters = ["id": invait]
//                    print(parameters)
                    let url = URL_CHECK_INVITE + "?id=\(invait)"
                     Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                        
//                            print("แล้วมีคนเข้าร่วม = \(resData)")
//                        cell.maxUser.text = "\(resData) / \(activity?.join ?? 0) คน "
                        
                        if let user = resData.result.value as! [String: Any]? {
                          
                            
                            if let yield = user["invaite"] as? Int{
//                                self?.birthday.text = yield
                                print("55555")
                                print(yield)
                                cell.maxUser.text = " \(yield) / \(activity?.join ?? 0) คน"
                            }
                            
                        }
                        
                        
                    }
                    
                    
                  
                   cell.selectionStyle = .none
                   self.tableView.separatorStyle = .none
                   return cell
                }
    }
    
//    func reloadData(){
//        let parameters: Parameters = ["id": activityList?.]
////                let url = URL_CHECK_INVITE + "?id=\(typecheck)"
//                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
//                    print(resData)
////                    guard let json = resData.value as? NSDictionary else { return }
////                    var header: [ActivityType] = []
////                    for key in json.allKeys {
////                        guard let item = json[key] as? [String:Any], let map = Mapper<ActivityType>().map(JSON: item) else { return }
////                        header.append(map)
////                    }
////                    self?.header = header
////                    self?.tableView.reloadData()
//                }
//    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
                   
        }else{
            let vc = ContentActivityViewController()
            vc.activityData = activityList?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        navigationItem.title = "Alder"
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(ActivityHeaderViewCell.self, forCellReuseIdentifier: cellId1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        if let name2 = defaultValues.string(forKey: "userId") {
            typecheck = name2
        }else{
            //send back to login view controller
        }
            

    }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
