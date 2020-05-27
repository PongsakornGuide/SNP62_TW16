//
//  DecideViewController.swift
//  SNP_TW16
//
//  Created by Guide on 26/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import UserNotifications
import SDWebImage
//UIViewController ,UITableViewDelegate, UITableViewDataSource
class DecideViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate,UNUserNotificationCenterDelegate{
    
    var delegate:UIViewController?
    let URL_USER_DECIDE = "\(AppDelegate.link)alder_iosapp/v1/decide.php"
    let URL_DECIDE = "\(AppDelegate.link)alder_iosapp/v1/showDecide.php"
    lazy var defaultValues = UserDefaults.standard
    lazy var actPost = Int()
    lazy var actUserId = String()
    var textData = String()
    var actData = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    var feel: [emojiUser]?
    
    var feelUser = feeldecideModel.feelofUser()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
        self.tabBarController?.tabBar.isHidden = true
         self.tableview.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
                return 1
          }else if section == 1{
            return feelUser.count
          }else{
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if indexPath.section == 0 {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DecideViewCell
                    self.tableview.separatorStyle = .none
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
                    
                    
                }else if indexPath.section == 1{
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! layoutTableViewCell
                    cell.textHeader.text = feelUser[indexPath.row].title
                    cell.bgImage.image = feelUser[indexPath.row].profileImage
                    cell.textHeader.font = UIFont.BaiJamjureeBold(size: 26)
                    cell.textHeader.textColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
                    
        }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! TextFieldTableViewCell
                    self.tableview.separatorStyle = .none
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
        }
    }
    
    func reloadData(){
         Alamofire.request(URL_DECIDE).responseJSON { [weak self](resData) in
                    self?.feel = Mapper<emojiUser>().mapArray(JSONObject: resData.result.value)
                    self?.tableview.reloadData()
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            cell.bgImage.image = UIImage(named: "group1438")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
            if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            cell.bgImage.image = feelUser[indexPath.row].profileImage
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
    func NotificaitonUser(){
             let content = UNMutableNotificationContent()
             content.title = "ยินดีด้วยคุณได้เข้าร่วมกิจกรรมแล้ว"
             content.subtitle = "กิจกกรม :: \(actData) พร้อมแล้วสำหรับคุณ"
             content.badge = 1
             content.sound = UNNotificationSound.default
            
             
             let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
             let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: triger)
             
             UNUserNotificationCenter.current().add(request) { (Error) in
                 print(Error as Any)
             }
    }
    
    
        @objc func actionJoin(){
                    guard let cell = TextFieldTableViewCell.textView.text else { return }
                    let selectedIndex = tableview.indexPathsForSelectedRows
                    let index = selectedIndex?.compactMap{ "\($0.row+1)" }
                    var selectedChoice = index?.joined(separator: ",") ?? ""
                    print(selectedChoice)
                        let parameters: Parameters = ["user_id":"\(self.actUserId)","post_timeline_id":"\(self.actPost)","feel_id[]":selectedChoice,"more":cell]
                            Alamofire.request(self.URL_USER_DECIDE, method: .post,parameters: parameters).responseJSON { response in
                        if let delegate = self.delegate{
                            self.NotificaitonUser()
                            self.navigationController?.popViewController(animated: true)
                        }
                           TextFieldTableViewCell.textView.text = ""
                }
        }
    
        @objc func cancelError(){
            
        }
    
        @objc func psuhCheckBox(){
                    guard let cell = TextFieldTableViewCell.textView.text else { return }
                            let selectedIndex = tableview.indexPathsForSelectedRows
                            let index = selectedIndex?.compactMap{ "\($0.row+1)" }
                            var selectedChoice = index?.joined(separator: ",") ?? ""
                    if selectedChoice != ""{
                                let popOverVC = AlertCompleteJoinViewController()
                                self.addChild(popOverVC)
                                popOverVC.view.frame = self.view.frame
                                self.view.addSubview(popOverVC.view)
                                popOverVC.didMove(toParent: self)
                    }else{
                       let popOverVC = AlertCancelInput()
                       self.addChild(popOverVC)
                       popOverVC.view.frame = self.view.frame
                       self.view.addSubview(popOverVC.view)
                       popOverVC.didMove(toParent: self)
                    }
        }
    
        @objc func keyboardWillHide(notification: NSNotification) {
                         if self.view.frame.origin.y != 0 {
                             self.view.frame.origin.y = 0
                         }
        }

        @objc func keyboardWillShow(notification: NSNotification) {
                   if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                       if self.view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyboardSize.height
                            //keyboardSize.height
                       }
                   }
      }
    
      override func viewDidLoad() {
        super.viewDidLoad()
        print(actData)
        
        navigationItem.title = "\(actData)"

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
                         navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.backgroundColor = .white
        tableview.delegate = self
        view.addSubview(tableview)
        
        tableview.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,  right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor ,topConstant: 0,  bottomConstant: 0,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        tableview.register(DecideViewCell.self, forCellReuseIdentifier: cellId)
        tableview.register(layoutTableViewCell.self, forCellReuseIdentifier: cellId1)
        tableview.register(TextFieldTableViewCell.self, forCellReuseIdentifier: cellId2)
        tableview.tableFooterView = UIView()
        tableview.rowHeight = UITableView.automaticDimension
        tableview.allowsMultipleSelection = true

        
          if let name2 = defaultValues.string(forKey: "userId") {
             actUserId = name2
          }else{

          }

    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
}
