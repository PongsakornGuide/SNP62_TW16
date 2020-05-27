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
class TestCheckBoxTableView: UIViewController ,UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate {
    
    let URL_USER_REGISTER = "\(AppDelegate.link)alder_iosapp/v1/user_activity.php"
    let URL_SHOW_ACTIVITY = "\(AppDelegate.link)alder_iosapp/v1/showTitleActivity.php"
    var activityList: [ListDetailActivity]?
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    private var cellId3 = "Cell3"
    private var cellId4 = "Cell4"
    lazy var text = String()
    lazy var disease_user_id = String()
    lazy var activity_user_id = String()
    lazy var username_user = String()
    lazy var phone_number_user = String()
    lazy var defaultValues = UserDefaults.standard
    var favouriteUser = favouriteModelView.favouriteofUser()
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          getActivty()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
      
    func numberOfSections(in tableView: UITableView) -> Int {
          return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
              return 1
          }else if section == 1 {
              return 1
          }else if section == 2 {
              return 1
          }else if section == 3 {
              return favouriteUser.count
          }else{
              return 1
         }
    }
    
    @objc func performSegueToReturnBack()  {
                if let nav = self.navigationController {
                    nav.popToRootViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           if indexPath.section == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! TitleTableVIiewCellTest
               self.tableview.separatorStyle = .none
               cell.selectionStyle = .none
               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell
           }else  if indexPath.section == 1 {
                         let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DiseaseTableViewCell
                         self.tableview.separatorStyle = .none
                         cell.selectionStyle = .none
                         cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                         return cell
           }else  if indexPath.section == 2{
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId4,for: indexPath) as! TitleFavoriteView
               self.tableview.separatorStyle = .none
               cell.selectionStyle = .none
               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell
            
            
           }else  if indexPath.section == 3{
              let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! CheckBoxTableViewCell
              cell.textHeader.text = favouriteUser[indexPath.row].title
              cell.textHeader.font = UIFont.BaiJamjureeBold(size: 25)
              cell.bgImage.image = favouriteUser[indexPath.row].profileImage
              cell.selectionStyle = .none
              cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
           }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId3,for: indexPath) as! ConfirmTableViewCell
                self.tableview.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
           }
          
    }

    func getActivty(){
             Alamofire.request(URL_SHOW_ACTIVITY).responseJSON { [weak self](resData) in
                        self?.activityList = Mapper<ListDetailActivity>().mapArray(JSONObject: resData.result.value)
                        self?.tableview.reloadData()
                }
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CheckBoxTableViewCell{
            cell.bgImage.image = UIImage(named: "group1438")

        }
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath) as? CheckBoxTableViewCell{
            cell.bgImage.image = favouriteUser[indexPath.row].profileImage
        }
    }
    
//  @objc func actionRegister(){
//        print("5555")
//  }
    
    @objc func pushCheckBox(){
        guard let cell = DiseaseTableViewCell.diseaseDetailTextField.text else { return }
          let selectedIndex = tableview.indexPathsForSelectedRows
          let index = selectedIndex?.compactMap{ " \( 1 + $0.row)" }
          var selectedChoice = index?.joined(separator: ",") ?? ""
          print(selectedChoice)
          print(cell)
          print(activity_user_id)
          print(DiseaseTableViewCell.diseaseNameTextField.tag)
          print(disease_user_id)
          print(phone_number_user)
          print(activity_user_id)
        
        
        if activity_user_id != "" && DiseaseTableViewCell.diseaseNameTextField.tag > 0 && disease_user_id != "" && phone_number_user != "" && cell != "" && selectedChoice != "" {

            let parameters: Parameters = ["activity_user_apps":activity_user_id,"activity_name":selectedChoice,"disease_id":DiseaseTableViewCell.diseaseNameTextField.tag,"disease_detail" : cell,"disease_user_apps":disease_user_id,"tel":phone_number_user]
            print(parameters)
            
            Alamofire.request(URL_USER_REGISTER, method: .post,parameters: parameters).responseJSON { response in
            print(response)
                                if let result = response.result.value {
                                                let jsonData = result as! NSDictionary
                                                if(!(jsonData.value(forKey: "error") as! Bool )){
                                                    let alertController = UIAlertController(title: "สมัครสมาชิกเรียบร้อย", message: "ยินดีต้อนรับเข้าสู่ Alder", preferredStyle: .alert)

                                                    let action1 = UIAlertAction(title: "เข้าสู่ระบบ", style: .default) { (action:UIAlertAction) in
                                                         self.view.window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            //                                             self.view.window?.rootViewController = LoginViewController()
                                                         self.view.window?.makeKeyAndVisible()
            //                                            let View = LoginViewController()
            //                                            self.navigationController?.pushViewController(View, animated: true)
                                                    }

                                                    alertController.addAction(action1)
                                                    self.present(alertController, animated: true, completion: nil)
                                         }
                                }
            }
            
        }else{
            let alert = UIAlertController(title: "ข้อมูลไม่ครบถ้วน", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        //        selectedChoice != ""
//        && disease_user_id != "" && phone_number_user != ""
//        activity_user_id != ""
//        if  DiseaseTableViewCell.diseaseNameTextField.tag > 0 {
//            print("555")
//        }else{
//            print("666")
//        }
//        if activity_user_id.count > 0 && DiseaseTableViewCell.diseaseNameTextField.tag > 0 && disease_user_id.count > 0 && phone_number_user.count > 0 {
//
//             guard let cell = DiseaseTableViewCell.diseaseDetailTextField.text else { return }
//                    let selectedIndex = tableView.indexPathsForSelectedRows
//                    let index = selectedIndex?.compactMap{ " \( 1 + $0.row)" }
//                    var selectedChoice = index?.joined(separator: ",") ?? ""
//                    print(selectedChoice)
//
//
//                    let parameters: Parameters = ["activity_user_apps":activity_user_id,"activity_name":selectedChoice,"disease_id":DiseaseTableViewCell.diseaseNameTextField.tag,"disease_detail" : cell,"disease_user_apps":disease_user_id,"tel":phone_number_user]
//                    print(parameters)
//
//
//
//                    Alamofire.request(URL_USER_REGISTER, method: .post,parameters: parameters).responseJSON { response in
//                            print(response)
//                                    if let result = response.result.value {
//                                    let jsonData = result as! NSDictionary
//                                    if(!(jsonData.value(forKey: "error") as! Bool )){
//                                        let alertController = UIAlertController(title: "สมัครสมาชิกเรียบร้อย", message: "ยินดีต้อนรับเข้าสู่ Alder", preferredStyle: .alert)
//
//                                        let action1 = UIAlertAction(title: "เข้าสู่ระบบ", style: .default) { (action:UIAlertAction) in
//                                             self.view.window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
////                                             self.view.window?.rootViewController = LoginViewController()
//                                             self.view.window?.makeKeyAndVisible()
////                                            let View = LoginViewController()
////                                            self.navigationController?.pushViewController(View, animated: true)
//                                        }
//
//                                        alertController.addAction(action1)
//                                        self.present(alertController, animated: true, completion: nil)
//                             }
//                        }
//                    }
//
//        }else{
//            let alert = UIAlertController(title: "ข้อมูลไม่ครบถ้วน", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//
//        }
//
//    }
        

        
    }
    
    lazy var tableview : UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.showsVerticalScrollIndicator = false
        tableview.backgroundColor = .none
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        view.addSubview(tableview)
              
        tableview.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,  right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor ,topConstant: 0,  bottomConstant: 0,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

  
              
              
        
        print(disease_user_id)
        print(activity_user_id)
        print(username_user)
        print(phone_number_user)
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableview.tableFooterView = UIView()
        tableview.allowsMultipleSelection = true
        tableview.register(TitleTableVIiewCellTest.self, forCellReuseIdentifier: cellId)
        tableview.register(DiseaseTableViewCell.self, forCellReuseIdentifier: cellId1)
        tableview.register(CheckBoxTableViewCell.self, forCellReuseIdentifier: cellId2)
        tableview.register(ConfirmTableViewCell.self, forCellReuseIdentifier: cellId3)
        tableview.register(TitleFavoriteView.self, forCellReuseIdentifier: cellId4)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 50

    }
    
    
    
}
