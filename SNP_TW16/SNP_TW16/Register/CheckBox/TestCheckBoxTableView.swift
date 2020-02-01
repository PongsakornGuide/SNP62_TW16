//
//  TestCheckBoxTableView.swift
//  SNP_TW16
//
//  Created by Guide on 29/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class TestCheckBoxTableView: UITableViewController{
//"http://localhost/alder_iosapp/v1/add_disease_activity.php"
    
    
//    let URL_USER_REGISTER = "http://localhost/alder_iosapp/v1/user_activity.php"
//    let URL_SHOW_ACTIVITY = "http://localhost/alder_iosapp/v1/showTitleActivity.php"
    
    let URL_USER_REGISTER = "http://172.20.10.5/alder_iosapp/v1/user_activity.php"
    let URL_SHOW_ACTIVITY = "http://172.20.10.5/alder_iosapp/v1/showTitleActivity.php"
    var activityList: [ListDetailActivity]?
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    private var cellId3 = "Cell3"
    private var cellId4 = "Cell4"
    var text = String()
    var disease_user_id = String()
    var activity_user_id = String()
    var username_user = String()
    var phone_number_user = String()
    let defaultValues = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          getActivty()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
      
    override func numberOfSections(in tableView: UITableView) -> Int {
          return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
              return 1
          }else if section == 1 {
              return 1
          }else if section == 2 {
              return 1
          }else if section == 3 {
              return activityList?.count ?? 0
          }else{
              return 1
         }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           if indexPath.section == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! TitleTableVIiewCellTest
               self.tableView.separatorStyle = .none
               cell.selectionStyle = .none
               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell
           }else  if indexPath.section == 1 {
                         let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DiseaseTableViewCell
                         self.tableView.separatorStyle = .none
                         cell.selectionStyle = .none
                         cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                         return cell
           }else  if indexPath.section == 2{
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId4,for: indexPath) as! TitleFavoriteView
               return cell
            
            
           }else  if indexPath.section == 3{
              let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! CheckBoxTableViewCell
                   let headerActivity = activityList?[indexPath.row]
                   cell.textHeader.text = headerActivity?.activityName
           
              Alamofire.request((headerActivity?.activtiyIcon ?? "0")!).responseImage { response in
                           if let image = response.result.value {
                               cell.bgImage.image = image
                           }}
              cell.selectionStyle = .none
              cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
           }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId3,for: indexPath) as! ConfirmTableViewCell
                self.tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
           }
          
    }

    func getActivty(){
             Alamofire.request(URL_SHOW_ACTIVITY).responseJSON { [weak self](resData) in
                        self?.activityList = Mapper<ListDetailActivity>().mapArray(JSONObject: resData.result.value)
                        self?.tableView.reloadData()
                }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if let cell = tableView.cellForRow(at: indexPath) as? CheckBoxTableViewCell{
            cell.bgImage.layer.cornerRadius = 80/2
             cell.bgImage.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
             cell.bgImage.layer.borderWidth = 2
         }
     }
     
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
         if let cell = tableView.cellForRow(at: indexPath) as? CheckBoxTableViewCell{
            cell.bgImage.layer.cornerRadius = 80/2
            cell.bgImage.layer.borderColor = UIColor.white.cgColor
             cell.bgImage.layer.borderWidth = 2
            
         }
     }
    
    @objc func psuhCheckBox(){
        let selectedIndex = tableView.indexPathsForSelectedRows
        let index = selectedIndex?.compactMap{ " \( 1 + $0.row)" }
        var selectedChoice = index?.joined(separator: ",") ?? ""
        print(selectedChoice)
        
        let parameters: Parameters = [
        "activity_user_apps":activity_user_id,
        "activity_name":selectedChoice,
        "disease_id": "1",
        "disease_detail": "test",
        "disease_user_apps":disease_user_id,
        "tel":phone_number_user]
        
       print(parameters)
    Alamofire.request(URL_USER_REGISTER, method: .post,parameters: parameters).responseJSON { response in
                print(response)
        
        
                        if let result = response.result.value {
                        let jsonData = result as! NSDictionary
                        if(!(jsonData.value(forKey: "error") as! Bool )){
                            let alertController = UIAlertController(title: "สมัครสมาชิกเรียบร้อย", message: "ยินดีต้อนรับเข้าสู่ Alder", preferredStyle: .alert)
                                    
                            let action1 = UIAlertAction(title: "เข้าสู่ระบบ", style: .default) { (action:UIAlertAction) in
                                 self.view.window?.rootViewController = LoginViewController()
                                 self.view.window?.makeKeyAndVisible()
                            }

                            alertController.addAction(action1)
                            self.present(alertController, animated: true, completion: nil)
                 }
            }
        }
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(disease_user_id)
        print(activity_user_id)
        print(username_user)
        print(phone_number_user)
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableView.allowsMultipleSelection = true
        tableView.register(TitleTableVIiewCellTest.self, forCellReuseIdentifier: cellId)
        tableView.register(DiseaseTableViewCell.self, forCellReuseIdentifier: cellId1)
        tableView.register(CheckBoxTableViewCell.self, forCellReuseIdentifier: cellId2)
        tableView.register(ConfirmTableViewCell.self, forCellReuseIdentifier: cellId3)
        tableView.register(TitleFavoriteView.self, forCellReuseIdentifier: cellId4)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    
    
}