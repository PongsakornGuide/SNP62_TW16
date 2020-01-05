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
class MainActivityViewController: UITableViewController {
    
    
    let URL_USER_ID = "http://localhost/alder_iosapp/v1/showactivity.php"
    let defaultValues = UserDefaults.standard
    var num1 = String()
    var num2 = String()
    var Labelname = String()
    var imageView = String()
    var typecheck = String()
    var search = [Search]()
    
    
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
                    return 5
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
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
           }
            
 
            
//            if indexPath.section == 0 {
//                               let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! TitleTableViewCell
//                               return cell
//
//                    } else if indexPath.section == 1 {
//                            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
//
//                                let check:Search
//                                check = search[indexPath.row]
//                                cell.titleFullname.text = check.titlename
//                                cell.supportName.text = check.caption
//                                cell.supportTime.text = check.time
//
//                                Alamofire.request("http://localhost/alder_iosapp/" + (check.image ?? "0")!).responseImage { response in
//
//                                    if let image = response.result.value {
//                                            cell.bgActivitity.image = image
//                                    }
//                                }
//
//                                cell.selectionStyle = .none
//                                self.tableView.separatorStyle = .none
//                                return cell
//                    }else{
//                        let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! HeaderActivity
//                        return cell
//                    }
    
        }
//    func customInit(continentIndex: Int,title: String){
//        self.continentIndex = continentIndex
//        self.title = title
//    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }else{
            let DvC = TableCheck()
            self.navigationController?.pushViewController(DvC, animated: true)
                   
        }
    }

    @objc func handelSetting(){
                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                    UserDefaults.standard.synchronize()
                    let loginViewController = LoginViewController()
                    self.navigationController?.pushViewController(loginViewController, animated: true)
                    self.dismiss(animated: false, completion: nil)
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
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        if #available(iOS 12.1 , *) {
                 tableView.refreshControl = refresher
             }else{
                 tableView.addSubview(refresher)
        }
        
          tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: cellId1)
//          tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
          tableView.register(HeaderActivity.self, forCellReuseIdentifier: cellId2)
          tableView.rowHeight = UITableView.automaticDimension
          tableView.estimatedRowHeight = 50
        
        
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
             if let name = defaultValues.string(forKey: "userName") {
                 Labelname = name
//                 nameLabel.text = "\(Labelname)"
                 print(Labelname)
             }

             if let name2 = defaultValues.string(forKey: "userId") {
                           typecheck = name2
                    print("id ===== \(typecheck)")
              }else{
                           //send back to login view controller
             }
        
        let parameters: Parameters = ["userId":typecheck]
        
        Alamofire.request(URL_USER_ID + "?id=\(typecheck)", method: .post,parameters: parameters).responseJSON { response in
            if let json = response.result.value {
                print(response)
                let searchMatch : NSArray = json as! NSArray
                for i in 0..<searchMatch.count
                {self.search.append(Search(
                    
                    titlename: (searchMatch[i] as AnyObject).value(forKey:"title") as? String ?? "Cannot see activity on Alder",
                    caption: (searchMatch[i] as AnyObject).value(forKey:"caption") as? String ?? "Admin : ",
                    image: (searchMatch[i] as AnyObject).value(forKey:"img") as? String ?? "0",
                    time: (searchMatch[i] as AnyObject).value(forKey:"created_at") as? String ?? "Find events soon"
                    
                    ))
                }
                self.tableView.reloadData()
            }
        }
        
        

        let settings = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(handelSetting))
        settings.tintColor = UIColor.blackAlpha(alpha: 0.7)
        navigationItem.rightBarButtonItem = settings
        navigationItem.title = "Alder"
        
        let backButton = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        
        
    
        
        
        
        
//        let parameters: Parameters = ["userId":typecheck]
//        Alamofire.request(URL_USER_ID + "?id=\(typecheck)", method: .post,parameters: parameters).responseJSON { response in
//                               print(response)
//                               print(parameters)
//        }
    }
}
