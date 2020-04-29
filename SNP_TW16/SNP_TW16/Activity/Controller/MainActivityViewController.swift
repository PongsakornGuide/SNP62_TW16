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
import SDWebImage
class MainActivityViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate ,UNUserNotificationCenterDelegate{
    let URL_USER_ID = "\(AppDelegate.link)alder_iosapp/v1/showactivity.php"
    let URL_GET_PROFILE = "\(AppDelegate.link)alder_iosapp/v1/showProfile.php"
    var btnBarBadge : MJBadgeBarButton!
    lazy var defaultValues = UserDefaults.standard
    lazy var num1 = String()
    lazy var num2 = String()
    lazy var Labelname = String()
    lazy var day = String()
    lazy var day2 = String()
    lazy var imageView = String()
    lazy var typecheck = String()
    lazy var brithday = String()
    lazy var brithday2 = String()
    var header: [ActivityType]?
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    private var cellId3 = "Cell3"
    private var cellId4 = "Cell4"
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            reloadData()
            tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                if section == 0 {
                    return 1
                }else if section == 1 {
                    return header?.count ?? 0
                }else if section == 2 {
                    return 1
                }else {
                    return 1
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! TitleTableViewCell
                    cell.selectionStyle = .none
//                    cell.bgImage.image = UIImage(named: "bgMonday")
                    let parameters: Parameters = ["userId":typecheck]
                
                                         let url = URL_GET_PROFILE + "?id=\(typecheck)"
                                         Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                                             print(resData)
                                        
                                    if let user = resData.result.value as! [String: Any]? {

                                    if let yield = user["birthday"] as? String{
                                        self?.brithday = yield
                                        let mouthStart = DateFormatter()
                                        mouthStart.dateFormat = "yyyy-MM-dd"
                                        mouthStart.timeZone = NSTimeZone(abbreviation: "ICT") as TimeZone?
                                        let date = mouthStart.date(from: yield)
                                        mouthStart.dateFormat = "MM-dd"
                                        let mouthStringStart = mouthStart.string(from: date ?? Date())
                                        self?.brithday2  = mouthStringStart
                                    }
                                        let songkran = "04-13"
                                        let songkran1 = "04-14"
                                        let songkran2 = "04-15"
                                        if self?.day2 == self?.brithday2 {
                                        cell.titleHeader.text = "สุขสันต์วันเกิด"
                                        cell.titleHeader.textColor = .white
                                        cell.titleHeader.font = UIFont.BaiJamjureeBold(size:32)
                                        cell.textHeader.text = "\(self?.Labelname ?? "x")"
                                        cell.textHeader.textColor = .white
                                        cell.textHeader.font = UIFont.BaiJamjureeBold(size: 32)
                                        self?.tableView.backgroundView = UIImageView(image: UIImage(named: "BGDAY"))
                                        cell.bgImage.isHidden = true
                                        }else if "\(self?.day2 ?? "x")" == songkran || "\(self?.day2 ?? "x")" == songkran1 || "\(self?.day2 ?? "x")" == songkran2{
                                        cell.titleHeader.text = "สวัสดีวันสงกรานต์!"
                                        cell.titleHeader.textColor = .white
                                        cell.titleHeader.font = UIFont.BaiJamjureeBold(size:32)
                                        cell.textHeader.text = self?.Labelname
                                        cell.textHeader.textColor = .white
                                        cell.textHeader.font = UIFont.BaiJamjureeBold(size: 32)
                                        self?.tableView.backgroundView = UIImageView(image: UIImage(named: "BGDAY1"))
                                        cell.bgImage.isHidden = true
                                        }else{
                                        cell.bgImage.isHidden = false
                                        cell.titleHeader.textColor = .white
                                        cell.titleHeader.font = UIFont.BaiJamjureeBold(size:32)
                                        cell.textHeader.text = self?.Labelname
                                        cell.textHeader.textColor = .white
                                        cell.textHeader.font = UIFont.BaiJamjureeBold(size: 32)
                                        self?.tableView.backgroundView = UIImageView(image: UIImage(named: ""))
                                            
                                        if self?.day == "Sunday"{
                                                cell.titleHeader.text = "สวัสดี วันอาทิตย์"
                                                cell.bgImage.image = UIImage(named: "bgSunday")

                                        }else if self?.day == "Monday"{
                                                
                                                cell.titleHeader.text = "สวัสดี วันจันทร์"
                                                cell.titleHeader.textColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                                                cell.textHeader.textColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                                                cell.bgImage.image = UIImage(named: "bgMonday")
                                        }else if self?.day == "Tuesday"{
                                                cell.titleHeader.text = "สวัสดี อังคาร"
                                                cell.bgImage.image = UIImage(named: "bgTuesday")
                                        }else if self?.day == "Wednesday"{
                                                cell.titleHeader.text = "สวัสดี วันพุธ"
                                                cell.bgImage.image = UIImage(named: "bgWednesday")
                                        }else if self?.day == "Thursday"{
                                                cell.titleHeader.text = "สวัสดี วันพฤหัสบดี"
                                                cell.bgImage.image = UIImage(named: "bgThursday")
                                        }else if self?.day == "Friday"{
                                                cell.titleHeader.text = "สวัสดี วันศุกร์"
                                                cell.bgImage.image = UIImage(named: "bgFriday")
                                        }else{
                                                cell.titleHeader.text = "สวัสดี วันเสาร์"
                                                cell.bgImage.image = UIImage(named: "bgSaturday")
                                        }
                                }
                        }
                }

                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    cell.backgroundColor = nil
                
                
                    return cell
                           
    }else if indexPath.section == 1{
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! HeaderActivity
                    let headerActivity = header?[indexPath.row]
                    cell.titleType.text = headerActivity?.activityTypeName
                
                
                    let postImagePath = headerActivity?.activtiyIcon ?? "0"
                          if let postImageURL = URL(string: postImagePath) {
                        cell.iconImage.sd_setImage(with: postImageURL, completed: nil)
                    }
                
                    
                    tableView.separatorStyle = .none
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                cell.backgroundColor = nil
                    return cell
    }else if indexPath.section == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId3,for: indexPath) as! HeaderReligion
                cell.backgroundColor = nil
                tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
                    
    }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId4,for: indexPath) as! HeaderMusic
                tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.backgroundColor = nil
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        }else if indexPath.section == 1{
            let dvc = SubActivityTypeTableViewController()
            let headerActivity = header?[indexPath.row]
            dvc.typeAct = headerActivity?.activityTypeName ?? "x"
            let activityType = header?[indexPath.row]
            let activityTypeList = activityType?.list
            var activitiesPosts = [ActivityDetail]()
            activityTypeList?.forEach{ activity  in
                activitiesPosts.append(contentsOf: activity.listDetail ?? [])
                }
            dvc.activityList = activitiesPosts
            self.navigationController?.pushViewController(dvc, animated: true)
        }else if indexPath.section == 2{
            
            let dvc =
                TitleStoryTableView()
            self.navigationController?.pushViewController(dvc, animated: true)
            
        }else{
            
            let dvc = TitleMusicTableView()
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
    
    func NotificaitonUser(){
         let content = UNMutableNotificationContent()
         content.title = "สวัสดีคุณ \(Labelname)"
         content.subtitle = "ยินดีต้อนรับเข้าสู่ ​Alder"
         content.body = "พร้อมจะเข้าร่วมกิจกรรมหรือยัง ?"
//         content.body = "พร้อมจะค้นหากิจกรรมกันหรือยัง"
         content.badge = 1
         content.sound = UNNotificationSound.default
         let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
         let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: triger)
         UNUserNotificationCenter.current().add(request) { (Error) in
             print(Error as Any)
         }
    }
    
    @objc func onBagdeButtonClick(){
        let notificaionView = NotificationTableView()
        navigationController?.pushViewController(notificaionView, animated: true)
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableView.dataSource = self
        tableView.delegate = self
        
        let customButton = UIButton(type: UIButton.ButtonType.custom)
          customButton.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
          customButton.addTarget(self, action: #selector(self.onBagdeButtonClick), for: .touchUpInside)
        customButton.setImage(UIImage(named: "bell"), for: .normal)
        
        self.btnBarBadge = MJBadgeBarButton()
        self.btnBarBadge.setup(customButton: customButton)
        self.btnBarBadge.badgeValue = ""
        self.btnBarBadge.badgeOriginX = 20.0
        self.btnBarBadge.badgeOriginY = -4
        self.navigationItem.rightBarButtonItem = self.btnBarBadge
        
        if let name = defaultValues.string(forKey: "userName") {
                Labelname = name
        }
        
        

        if let name2 = defaultValues.string(forKey: "userId") {
                typecheck = name2
            }else{
        }
        
        if let birthdayUser = defaultValues.string(forKey: "birthdayUser") {
                brithday = birthdayUser
        }
//        
//        NotificaitonUser()
        UNUserNotificationCenter.current().delegate = self
        
        let date = Date()
        let format = DateFormatter()
        format.timeZone = NSTimeZone(abbreviation: "ICT") as TimeZone?
        format.dateFormat = "EEEE"
        let formattedDate = format.string(from: date)
        day = formattedDate

        let format2 = DateFormatter()
        format2.timeZone = NSTimeZone(abbreviation: "ICT") as TimeZone?
        format2.dateFormat = "MM-dd"
        let formattedDate2 = format2.string(from: date)
        day2 = formattedDate2
//        Specialday()
//        print(day2)
        
        navigationItem.title = "Alder"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.tableView.reloadData()
        
        
        if #available(iOS 12.1 , *) {
                 tableView.refreshControl = refresher
             }else{
                 tableView.addSubview(refresher)
        }
        
          tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: cellId1)
          tableView.register(HeaderActivity.self, forCellReuseIdentifier: cellId2)
          tableView.register(HeaderReligion.self, forCellReuseIdentifier: cellId3)
          tableView.register(HeaderMusic.self, forCellReuseIdentifier: cellId4)
        
        
          tableView.rowHeight = UITableView.automaticDimension
          tableView.estimatedRowHeight = 50
            let stackView = UIStackView(arrangedSubviews: [
            tableView
             ])
            view.addSubview(stackView)
            stackView.axis = .vertical
        stackView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])

    }
}
