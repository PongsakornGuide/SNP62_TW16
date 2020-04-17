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
class DecideChoiceViewController: UITableViewController{
    let URL_USER_REGISTER = "\(AppDelegate.link)alder_iosapp/v1/supplementAfter.php"

//    let URL_SHOW_ACTIVITY = "\(AppDelegate.link)alder_iosapp/v1/showTitleActivity.php"
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
          return 3
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
              return 1
          }else if section == 1{
            return choiceUser.count
          }else{
            return 1
          }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           if indexPath.section == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! titleDecideChoiceViwe
               self.tableView.separatorStyle = .none
               cell.selectionStyle = .none
               cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell
           }else if indexPath.section == 1 {
             let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DecideChoiceUserView
            cell.textHeader.text = choiceUser[indexPath.row].title
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

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? DecideChoiceUserView{
            cell.bgImage.image = UIImage(named: "group1567")
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
            if let cell = tableView.cellForRow(at: indexPath) as? DecideChoiceUserView{
                cell.bgImage.image = UIImage(named: "rectangle142")
        }
    }
    
    @objc func actionJoin(){
      let selectedIndex = tableView.indexPathsForSelectedRows
      let index = selectedIndex?.compactMap{ " \( 1 + $0.row)" }
      var selectedChoice = index?.joined(separator: ",") ?? ""
      let parameters: Parameters = ["user_id":idUser ?? 0,"post_timeline_id":idpost ?? 0,"decide_supplement_id":selectedChoice]
      Alamofire.request(URL_USER_REGISTER, method: .post,parameters: parameters).responseJSON { response in
              print(response)
                      if let result = response.result.value {
                      let jsonData = result as! NSDictionary
                      if(!(jsonData.value(forKey: "error") as! Bool )){
                        self.view.window?.rootViewController = tabBarViewController()
                        self.view.window?.makeKeyAndVisible()
               }
          }
      }
    }

    @objc func pushCheckBox(){
        let popOverVC = AlertDecideAfterSection2ViewController()
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name2 = defaultValues.string(forKey: "userId") {
                  idUser = name2
              }else{
        }
        
        view.backgroundColor = UIColor.white
        tableView.allowsMultipleSelection = true
        tableView.register(titleDecideChoiceViwe.self, forCellReuseIdentifier: cellId)
        tableView.register(DecideChoiceUserView.self, forCellReuseIdentifier: cellId1)
        tableView.register(ChoiceCommitView.self, forCellReuseIdentifier: cellId2)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    
    
}
