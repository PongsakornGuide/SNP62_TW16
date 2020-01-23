////
////  TestController.swift
////  SNP_TW16
////
////  Created by Guide on 18/12/2562 BE.
////  Copyright © 2562 guide. All rights reserved.
////
//
import UIKit
import Alamofire
import ObjectMapper
import UserNotifications
class MainActivityViewController: UITableViewController {
//    var ExerciseList: [Exercise] = []
    let URL_USER_ID = "http://localhost/alder_iosapp/v1/showactivity.php"
    let defaultValues = UserDefaults.standard
    var num1 = String()
    var num2 = String()
    var Labelname = String()
    var imageView = String()
    var typecheck = String()
    var header: [ActivityType]?
    
//    var detail: [AcivityData]?
    
        private var cellId = "Cell"
        private var cellId1 = "Cell1"
        private var cellId2 = "Cell2"
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                if section == 0 {
                    return 1
                }else{
                    return header?.count ?? 0
//                    return test?.count ?? 0
                }
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            if indexPath.section == 0 {
                       let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! TitleTableViewCell
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                       return cell
                   
            }else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! HeaderActivity
                
                              let headerActivity = header?[indexPath.row]
                              cell.titleType.text = headerActivity?.activityTypeName

                    Alamofire.request("http://localhost/alder_iosapp/" + (headerActivity?.imageIcon ?? "0")!).responseImage { response in
                              if let image = response.result.value {
                                  cell.iconImage.image = image
                                  }
                              }
                              self.tableView.separatorStyle = .none
                              cell.selectionStyle = .none
                              cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                              return cell
//
                
//                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! HeaderActivity
//                let headerActivity = test?[indexPath.row]
////                cell.titleType.text = headerActivity?.activityType
//                cell.titleType.text = headerActivity?.activityType
//                Alamofire.request("http://localhost/alder_iosapp/" + (headerActivity?.iconImage ?? "0")!).responseImage { response in
//                if let image = response.result.value {
//                    cell.iconImage.image = image
//                    }
//                }
//
//                self.tableView.separatorStyle = .none
//                cell.selectionStyle = .none
//                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
//                return cell
           }
        }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {

        }else{
            let dvc = SubActivityTypeTableViewController()
            let activityType = header?[indexPath.row]
            dvc.activityList = activityType?.list
            self.navigationController?.pushViewController(dvc, animated: true)
       }
    }

    @objc func handelSetting(){
                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                    UserDefaults.standard.synchronize()
                    let loginViewController = LoginViewController()
                    self.navigationController?.pushViewController(loginViewController, animated: true)
                    self.dismiss(animated: false, completion: nil)
//        let content = UNMutableNotificationContent()
//            content.title = "The 5 seconds are up!"
//            content.subtitle = "they are up now!"
//            content.body = "The 5 seconds are really up!"
//            content.badge = 1
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//            let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
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
        self.tableView.reloadData()
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        if #available(iOS 12.1 , *) {
                 tableView.refreshControl = refresher
             }else{
                 tableView.addSubview(refresher)
        }
        
          tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: cellId1)
          tableView.register(HeaderActivity.self, forCellReuseIdentifier: cellId2)
          tableView.rowHeight = UITableView.automaticDimension
          tableView.estimatedRowHeight = 50
        
        
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
             if let name = defaultValues.string(forKey: "userName") {
                 Labelname = name
                 print(Labelname)
             }

             if let name2 = defaultValues.string(forKey: "userId") {
                           typecheck = name2
              }else{
                           //send back to login view controller
             }

        
        let parameters: Parameters = ["userId":typecheck]
        let url = URL_USER_ID + "?id=\(typecheck)"
        Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
//            self?.header = Mapper<ActivityType>().mapArray(JSONObject: resData.result.value)
//            self?.tableView.reloadData()
//            print(resData)
            guard let json = resData.value as? NSDictionary else { return }
            var header: [ActivityType] = []
            
            for key in json.allKeys {
                guard let item = json[key] as? [String:Any], let map = Mapper<ActivityType>().map(JSON: item) else { return }
                header.append(map)
//                map.list?[0].listDetail
                
            }
            self?.header = header
            self?.tableView.reloadData()
        }
        
        
        let settings = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(handelSetting))
        settings.tintColor = UIColor.blackAlpha(alpha: 0.7)
        navigationItem.rightBarButtonItem = settings
        navigationItem.title = "Alder"
        
        let backButton = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
    }
}
