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
    let URL_USER_ID = "http://localhost/alder_iosapp/v1/showactivity.php"
    let defaultValues = UserDefaults.standard
    var num1 = String()
    var num2 = String()
    var Labelname = String()
    var imageView = String()
    var typecheck = String()
    var header: [ActivityType]?
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            reloadData()
            self.tableView.reloadData()
 
        }
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                if section == 0 {
                    return 1
                }else{
                    return header?.count ?? 0
                }
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! TitleTableViewCell
            cell.selectionStyle = .none
            
            cell.textHeader.text = "คุณ \(Labelname)"
                
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
                   
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! HeaderActivity
            let headerActivity = header?[indexPath.row]
            cell.titleType.text = headerActivity?.activityTypeName
            Alamofire.request((headerActivity?.activtiyIcon ?? "0")!).responseImage { response in
            if let image = response.result.value {
                cell.iconImage.image = image
            }
              }
            self.tableView.separatorStyle = .none
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
           }
        }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {

        }else{
            let dvc = SubActivityTypeTableViewController()
            let activityType = header?[indexPath.row]
            let activityTypeList = activityType?.list
            var activitiesPosts = [ActivityDetail]()
            activityTypeList?.forEach{ activity  in
                activitiesPosts.append(contentsOf: activity.listDetail ?? [])
                }
            dvc.activityList = activitiesPosts
            self.navigationController?.pushViewController(dvc, animated: true)
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
              self.reloadData()
              self.tableView.reloadData()
          }
      }
    
    func reloadData(){
        let parameters: Parameters = ["userId":typecheck]
              let url = URL_USER_ID + "?id=\(typecheck)"
              Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                  guard let json = resData.value as? NSDictionary else { return }
                  var header: [ActivityType] = []
                  for key in json.allKeys {
                      guard let item = json[key] as? [String:Any], let map = Mapper<ActivityType>().map(JSON: item) else { return }
                      header.append(map)
                  }
                  self?.header = header
                  self?.tableView.reloadData()
              }
    }
           
         @objc func handelSetting(){
                         UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                         UserDefaults.standard.synchronize()
                         let loginViewController = LoginViewController()
                         self.navigationController?.pushViewController(loginViewController, animated: true)
                         self.dismiss(animated: false, completion: nil)
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertController = UIAlertController(title: "ยินดีต้อนรับสู่ Alder", message: "กิจกรรมของเรา รอท่านมาร่วมสนุก :)", preferredStyle: .alert)
                                          
        let action1 = UIAlertAction(title: "ยืนยัน", style: .default) { (action:UIAlertAction) in
        }
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
        
        self.tableView.reloadData()
        let settings = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(handelSetting))
            settings.tintColor = UIColor.blackAlpha(alpha: 0.7)
            navigationItem.rightBarButtonItem = settings
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
            print(typecheck)
            }else{
        }
    }
}
