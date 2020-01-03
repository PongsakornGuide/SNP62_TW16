//
//  communViewController.swift
//  SNP_TW16
//
//  Created by Guide on 10/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
class CommunViewController: UITableViewController{
    let datalist1 = ["firstCell1" , "firstCell2" , "firstCell3" , "firstCell4"]
    var User_Name = String()
    var User_ID = String()
    var pagety = [PageView]()
    var activity = [Activity]()
    let URL_GET_DATA = "http://localhost/alder_iosapp/v1/show.php"
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    
    
    @objc func handelSetting(){
        let CreateView = CreateViewController()
        navigationController?.pushViewController(CreateView, animated: true)
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else{
            return activity.count
        }
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ActivityPageViewController
            return cell
        
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! AcivityListTableViewCell

                                let act:Activity
                                act = activity[indexPath.row]
                                cell.id_user = "\(act.id_Ad)"
                                cell.userFullname.text = act.username
                                cell.messageTextLabel.text = act.titlePost
                                cell.timeTextLabel.text = act.time
                                cell.numCount.text = act.like
                                cell.numCom.text = act.comment


                                Alamofire.request("http://localhost/alder_iosapp/" + (act.imagePost ?? "0")!).responseImage { response in
                                    if let image = response.result.value{
                                        cell.postImage.image = image
                                    }
                                }

                                Alamofire.request("http://localhost/alder_iosapp/" + (act.imageProfile ?? "0")!).responseImage { response in
                                         if let image2 = response.result.value {
                                               cell.profileImage.image = image2
                                        }
                                }
                                   return cell
        }

    }
//
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//              let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AcivityListTableViewCell
//              let DvC = DetailActivityViewController()
//              let act:Activity
//              act = activity[indexPath.row]
//              DvC.getname = act.username ?? "NULL"
//              DvC.gettime = act.time ?? "NULL"
//              DvC.gettitle = act.titlePost ?? "NULL"
//              DvC.getLike = act.like ?? "NULL"
//              DvC.getimage = "http://localhost/alder_iosapp/\(act.imagePost!)"
//              DvC.getProfile = "http://localhost/alder_iosapp/\(act.imageProfile!)"
//
//            self.navigationController?.pushViewController(DvC, animated: true)
//        }
    
       override func viewDidLoad() {
                 super.viewDidLoad()
        navigationItem.title = "Community"
               navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.PoppinsRegular(size: 20), NSAttributedString.Key.foregroundColor: UIColor.emerald]
                  navigationController?.navigationBar.prefersLargeTitles = true
                  navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.PoppinsMedium(size: 35), NSAttributedString.Key.foregroundColor: UIColor.emerald]

                let settings = UIBarButtonItem(image: UIImage(named: "threepoint"), style: .plain, target: self, action: #selector(handelSetting))
                settings.tintColor = UIColor.blackAlpha(alpha: 0.7)
                navigationItem.rightBarButtonItem = settings
              
        
                tableView.register(ActivityPageViewController.self, forCellReuseIdentifier: cellId1)
                tableView.tableFooterView = UIView()
                tableView.rowHeight = UITableView.automaticDimension
                tableView.estimatedRowHeight = 50
        
        
                tableView.register(AcivityListTableViewCell.self, forCellReuseIdentifier: cellId)
                tableView.tableFooterView = UIView()
                tableView.rowHeight = UITableView.automaticDimension
                tableView.estimatedRowHeight = 50
        
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
                       Alamofire.request(URL_GET_DATA).responseJSON { response in
                                if let json = response.result.value {
                                    let comArray : NSArray = json as! NSArray
                //                    print(response)
                                for i in 0..<comArray.count {
                                    self.activity.append(Activity(
                                        
                                        id_Ad: (comArray[i] as AnyObject).value(forKey:"id") as? Int ?? 0,
                                        imageProfile: (comArray[i] as AnyObject).value(forKey:"photo") as? String ?? "0",
                                        username: ((comArray[i] as AnyObject).value(forKey:"username") as? String) ?? "0",
                                        time: (comArray[i] as AnyObject).value(forKey:"created_at") as? String ?? "0",
                                        titlePost: (comArray[i] as AnyObject).value(forKey:"caption") as? String ?? "0",
                                        imagePost: (comArray[i] as AnyObject).value(forKey:"img") as? String ?? "0" ,
                                        like: (comArray[i] as AnyObject).value(forKey:"like") as? String ?? "0",
                                        comment: (comArray[i] as AnyObject).value(forKey:"comment")  as? String ?? "0"
                                    ))
                                }
                                self.tableView.reloadData()
                                }
                 }
        
                let defaultValues = UserDefaults.standard
                       if let name = defaultValues.string(forKey: "userId") {
                             //setting the name to label
                            User_ID = name
                       }else {
                     //send back to login view controller
                  }
                     if let name = defaultValues.string(forKey: "userName") {
                                 //setting the name to label
                                User_Name = name
                                print(User_Name)
                           }else {
                         //send back to login view controller
                      }

       }
    
    
}
