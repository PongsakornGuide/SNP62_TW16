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
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
           
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
            if section == 0 {
                return 1
            }else {
                return search.count
            }
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            if indexPath.section == 0 {
                       let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! TitleTableViewCell
                       return cell
                   
            } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
                        
                        let check:Search
                        check = search[indexPath.row]
                        cell.titleFullname.text = check.titlename
                        cell.supportName.text = check.caption
                        cell.supportTime.text = check.time

                        Alamofire.request("http://localhost/alder_iosapp/" + (check.image ?? "0")!).responseImage { response in

                            if let image = response.result.value {
                                    cell.bgActivitity.image = image
                            }
                        }
                
                        cell.selectionStyle = .none
                        self.tableView.separatorStyle = .none
                        return cell
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
        
          tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: cellId1)
          tableView.rowHeight = UITableView.automaticDimension
          tableView.estimatedRowHeight = 50
        
          tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
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
        
    
//
//        view.addSubview(nameLabel)
//        view.addSubview(helloLabel)
//
//        helloLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 12, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
//
//        nameLabel.anchor(helloLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 8, bottomConstant: 0, leftConstant: 50, rightConstant: 50, widthConstant: 0, heightConstant: 50)
//
//
//        imageView.anchor(view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200
//        )
        
        navigationItem.title = "Alder"
//        navigationController?.navigationBar.isHidden = true
        let backButton = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        
        
    
        
        
        
        
//        let parameters: Parameters = ["userId":typecheck]
//        Alamofire.request(URL_USER_ID + "?id=\(typecheck)", method: .post,parameters: parameters).responseJSON { response in
//                               print(response)
//                               print(parameters)
//        }
    }
}
