//
//  DecideChoiceViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 31/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class DecideChoiceViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate,UNUserNotificationCenterDelegate {
    let URL_USER_REGISTER = "\(AppDelegate.link)alder_iosapp/v1/supplementAfter.php"
    var activityList: [ListDetailActivity]?
    
    var idpost:String?
    var idUser:String?
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    
    lazy var defaultValues = UserDefaults.standard
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
      
    var choiceUser = Choice.choiceofUser()
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 3
    }
    


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
              return 1
          }else if section == 1{
            return choiceUser.count
          }else{
            return 1
          }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           if indexPath.section == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! titleDecideChoiceViwe
               self.tableview.separatorStyle = .none
               cell.selectionStyle = .none
               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell
           }else if indexPath.section == 1 {
             let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DecideChoiceUserView
            cell.textHeader.text = choiceUser[indexPath.row].title
            cell.textHeader.font = UIFont.BaiJamjureeMedium(size: 20)
            
            cell.textHeader.tag = choiceUser.index(after: indexPath.row)
            print(cell.textHeader.tag)
            cell.bgImage.image = choiceUser[indexPath.row].profileImage
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! ChoiceCommitView
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
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
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? DecideChoiceUserView{
            cell.bgImage.image = UIImage(named: "group1567")
            if cell.textHeader.tag == 1{
            }else if cell.textHeader.tag == 2{
            }else if cell.textHeader.tag == 3{
            }else{
                TextFieldTableViewCell.textView.isHidden = false
            }
        }
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
            if let cell = tableView.cellForRow(at: indexPath) as? DecideChoiceUserView{
                cell.bgImage.image = UIImage(named: "rectangle142")
                if cell.textHeader.tag == 1{
                       }else if cell.textHeader.tag == 2{
                       }else if cell.textHeader.tag == 3{
                       }else{
                        TextFieldTableViewCell.textView.isHidden = true
                        TextFieldTableViewCell.textView.text = ""
                }
                
        }
    }
   
    @objc func actionJoin(){
    guard let cell = TextFieldTableViewCell.textView.text else { return }
      let selectedIndex = tableview.indexPathsForSelectedRows
      let index = selectedIndex?.compactMap{ " \( 1 + $0.row)" }
      var selectedChoice = index?.joined(separator: ",") ?? ""
      let parameters: Parameters = ["user_id":idUser ?? 0,"post_timeline_id":idpost ?? 0,"decide_supplement_id":selectedChoice,"titleComment": cell]
      print(parameters)
      Alamofire.request(URL_USER_REGISTER, method: .post,parameters: parameters).responseJSON { response in
              print(response)
                      if let result = response.result.value {
                      let jsonData = result as! NSDictionary
                      if(!(jsonData.value(forKey: "error") as! Bool )){
                        self.view.window?.rootViewController = tabBarViewController()
                        self.view.window?.makeKeyAndVisible()
                        TextFieldTableViewCell.textView.text = ""
               }
          }
      }
    }

    @objc func cancelError(){
        
    }
    
    @objc func pushCheckBox(){
        guard let cell = TextFieldTableViewCell.textView.text else { return }
        let selectedIndex = tableview.indexPathsForSelectedRows
        let index = selectedIndex?.compactMap{ " \( 1 + $0.row)" }
        var selectedChoice = index?.joined(separator: ",") ?? ""
        if selectedChoice != ""{
            let popOverVC = AlertDecideAfterSection2ViewController()
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }else{
            let popOverVC = AlertDecideSupplement()
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name2 = defaultValues.string(forKey: "userId") {
                  idUser = name2
              }else{
        }
        
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableview.delegate = self
        view.addSubview(tableview)
        tableview.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,  right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor ,topConstant: 0,  bottomConstant: 0,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        tableview.allowsMultipleSelection = true
        tableview.register(titleDecideChoiceViwe.self, forCellReuseIdentifier: cellId)
        tableview.register(DecideChoiceUserView.self, forCellReuseIdentifier: cellId1)
        tableview.register(ChoiceCommitView.self, forCellReuseIdentifier: cellId2)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 50
    }
    
    
    
}
