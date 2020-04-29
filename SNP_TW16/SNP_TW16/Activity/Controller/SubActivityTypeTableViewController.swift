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
import SDWebImage
class SubActivityTypeTableViewController: UITableViewController ,UINavigationControllerDelegate{
    
    let URL_USER_ID = "\(AppDelegate.link)alder_iosapp/v1/showactivity.php/"
//    let URL_USER_ID = "http://172.20.10.5/alder_iosapp/v1/showactivity.php/"
    
    let URL_CHECK_INVITE = "\(AppDelegate.link)alder_iosapp/v1/inviteActivity.php"
    
    let URL_LIKE_ACTIVITY = "\(AppDelegate.link)"
    
    let defaultValues = UserDefaults.standard
    lazy var typecheck = String()
    lazy var typeAct = String()
    var activityList : [ActivityDetail]?
    lazy var invait = Int()
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
                    cell.textHeader.text = typeAct
                    cell.textHeader.numberOfLines = 2
                    cell.textHeader.textColor = .black
                    cell.textHeader.font = UIFont.BaiJamjureeBold(size: 30)
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                                    return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
            
                    let activity = activityList?[indexPath.row]
                    cell.titleFullname.text = "\(activity?.actId ?? "x")"
                    cell.supportName.text = "โดย \(activity?.caption ?? "x")"
            
                    //covert startDate
                    let mouthStart = DateFormatter()
                    mouthStart.dateFormat = "yyyy-MM-dd"
                    let date = mouthStart.date(from: activity?.created ?? "x")
                    mouthStart.dateFormat = "MMMM"
                    let mouthStringStart = mouthStart.string(from: date ?? Date())
            
                    
                    if mouthStringStart == "January"{
                        cell.supportTime.text = "มกราคม"
                    }else if mouthStringStart == "February"{
                        cell.supportTime.text = "กุมภาพันธ์"
                    }else if mouthStringStart == "March"{
                        cell.supportTime.text = "มีนาคม"
                    }else if mouthStringStart == "April"{
                        cell.supportTime.text = "เมษายน"
                    }else if mouthStringStart == "May"{
                        cell.supportTime.text = "พฤษภาคม"
                    }else if mouthStringStart == "June"{
                        cell.supportTime.text = "มิถุนายน"
                    }else if mouthStringStart == "July"{
                        cell.supportTime.text = "กรกฎาคม"
                    }else if mouthStringStart == "August"{
                        cell.supportTime.text = "สิงหาคม"
                    }else if mouthStringStart == "September"{
                        cell.supportTime.text = "กันยายน"
                    }else if mouthStringStart == "October"{
                        cell.supportTime.text = "ตุลาคม"
                    }else if mouthStringStart == "November"{
                        cell.supportTime.text = "พฤศจิกายน"
                    }else{
                        cell.supportTime.text = "ธันวาคม"
                    }
            
            

                    mouthStart.dateFormat = "dd"
                    let mouthStringStart1 = mouthStart.string(from: date ?? Date())
                    cell.supportTime1.text = mouthStringStart1
            

                    mouthStart.dateFormat = "yyyy"
                    let mouthStringStart2 = mouthStart.string(from: date ?? Date())
//                    cell.supportTime2.text = mouthStringStart2
//                    (Int(mouthStringStart2 + Int(543) ) ?? 0)
//                    print(mouthStringStart2)
                    var num = Int(mouthStringStart2)
                    num = num! + 543
                    cell.supportTime2.text = "\(num ?? 0)"
            
            
                    
                    cell.CheckPoint.isHidden = true
                    cell.decidePass.isHidden = true            
                    
                    let postImagePath = "\(AppDelegate.link)alder_iosapp/" + (activity?.imagePost ?? "0")
                            if let postImageURL = URL(string: postImagePath) {
                                cell.bgActivitity.sd_setImage(with: postImageURL, completed: nil)
                    }
            
            
            let parameters: Parameters = ["id": activity?.dataId ?? 0]
                    let url = URL_CHECK_INVITE + "?id=\(activity?.dataId ?? 0)"
                    Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                            if let user = resData.result.value as! [String: Any]? {
                                if let yield = user["invaite"] as? Int {
//                                    self?.joinAct.text = "ผู้เข้าร่วม \(yield) / \(self?.activityData?.join ?? 0) คน"
                                    print(yield)
                                    print(activity?.join ?? 0)
                                    
                                    if(yield >= activity?.join ?? 0){
                                        cell.bgActivitityBg.isHidden = false
                                        cell.fullActivity.isHidden = false
                                    }else{
                                        cell.bgActivitityBg.isHidden = true
                                        cell.fullActivity.isHidden = true
                                    }
                                }
                            }
                    }
            
 
                   cell.selectionStyle = .none
                   self.tableView.separatorStyle = .none
                   return cell
                }
    }
    
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
        
        let backButton = UIBarButtonItem()
        backButton.title = "back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        navigationItem.title = "Alder"
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(ActivityHeaderViewCell.self, forCellReuseIdentifier: cellId1)
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
