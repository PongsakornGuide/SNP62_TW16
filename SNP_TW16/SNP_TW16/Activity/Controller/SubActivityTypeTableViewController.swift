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
                    cell.textHeader.textColor = .white
                    cell.textHeader.font = UIFont.BaiJamjureeBold(size: 30)
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                                    return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
            
                    let activity = activityList?[indexPath.row]
                    cell.titleFullname.text = activity?.actId
                    cell.supportName.text = activity?.caption
            
                    let mouthStart = DateFormatter()
                    mouthStart.dateFormat = "yyyy-mm-dd"
                    let date = mouthStart.date(from: activity?.created ?? "x")
                    mouthStart.dateFormat = "dd MMMM yyyy"
                    let mouthStringStart = mouthStart.string(from: date ?? Date())
                    cell.supportTime.text = mouthStringStart
            
                    cell.CheckPoint.isHidden = true
                    cell.decidePass.isHidden = true

                    let postImagePath = activity?.imagePost ?? "0"
                                    if let postImageURL = URL(string: postImagePath) {
                                        cell.bgActivitity.sd_setImage(with: postImageURL, completed: nil)
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
