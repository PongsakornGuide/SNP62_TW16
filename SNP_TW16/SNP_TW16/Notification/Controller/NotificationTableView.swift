
//
//  NotificationTableView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 11/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class NotificationTableView: UITableViewController,UNUserNotificationCenterDelegate {
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var countNotification: [countlistNotification]?
    var notification: [listNotification]?
//    var detail: [ActivityDetail]?
    lazy var user_id = String()
    lazy var defaultValues = UserDefaults.standard
    let URL_GET_COUNT_NOTIFICATION = "\(AppDelegate.link)alder_iosapp/v1/countNotification.php"
    let URL_GET_NOTIFICATION = "\(AppDelegate.link)alder_iosapp/v1/notificationUser.php"
    let URL_CHECK_INVITE = "\(AppDelegate.link)alder_iosapp/v1/inviteActivity.php"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestData()
        getCountNotificationUser()
        getNotificationUser()
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return countNotification?.count ?? 0
        }else{
            return notification?.count ?? 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if indexPath.section == 0 {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! NotificationTitle

              let countList = countNotification?[indexPath.row]
                cell.textHeader.text = "\(countList?.id ?? 0) รายการ"
                tableView.separatorStyle = .none
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
               return cell

       }else{
             let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! NotificationColumn

             let listNoti = notification?[indexPath.row]
             
            cell.textLabelTitle.text = "กิจกรรม : \(listNoti?.testtitle ?? "x")"
            cell.textLabelName.text = "ตอนนี้ \(listNoti?.title ?? "x") \nขอให้สนุกกับกิจกรรมในเร็วๆนี้"


        
            let mouthStart = DateFormatter()
            mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = mouthStart.date(from: listNoti?.create ?? "x")
            mouthStart.dateFormat = "h"
            let mouthStringStart = mouthStart.string(from: date ?? Date())
            cell.timeLabel.text = "\(mouthStringStart) ชั่วโมงที่แล้ว"

             tableView.separatorStyle = .none
             cell.selectionStyle = .none
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
             return cell
              }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
//            print("5555")
        }else{
            let contentActivity = NotificationContent()
             let deatilActvity = notification?[indexPath.row]
//            actId
            contentActivity.titleLabel.text = deatilActvity?.actId
            contentActivity.textHeader.text = deatilActvity?.type
            contentActivity.nameLabel.text = "โดย: \(deatilActvity?.caption ?? "x")"
            contentActivity.timeLabel.text = "วันเริ่มกิจกรรม: \(deatilActvity?.created ?? "x")"
            contentActivity.contentLabel.text = deatilActvity?.content
            contentActivity.startDate.text = deatilActvity?.created
            contentActivity.timerAct.text = "\(deatilActvity?.startTime ?? "x") - "
            contentActivity.endtimerAct.text = deatilActvity?.endtime
            contentActivity.postId = deatilActvity?.dataId ?? 0
            let parameters: Parameters = ["id": deatilActvity?.dataId]
                        let url = URL_CHECK_INVITE + "?id=\(deatilActvity?.dataId ?? 0)"
                            print(url)
                            Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                                               if let user = resData.result.value as! [String: Any]? {
                                                   if let yield = user["invaite"] as? Int {
                                                    print("5555")
                                                    contentActivity.joinAct.text = "ผู้เข้าร่วม \(yield ?? 0) คน"
                                        }
                        }
            }
            navigationController?.pushViewController(contentActivity, animated: true)
        }
    }

    func getNotificationUser(){
                let parameters: Parameters = ["id":user_id]
                let url = URL_GET_NOTIFICATION + "?id=\(user_id)"
                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                   self?.notification = Mapper<listNotification>().mapArray(JSONObject: dataRes.result.value)
                   self?.tableView.reloadData()
                }
    }

    func getCountNotificationUser(){
                let parameters: Parameters = ["id":user_id]
                let url = URL_GET_COUNT_NOTIFICATION + "?id=\(user_id)"
                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                    self?.countNotification = Mapper<countlistNotification>().mapArray(JSONObject: dataRes.result.value)
                   self?.tableView.reloadData()
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
                self.tableView.reloadData()
            }
        }


     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableView.register(NotificationTitle.self, forCellReuseIdentifier: cellId)
        tableView.register(NotificationColumn.self, forCellReuseIdentifier: cellId1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50

        if #available(iOS 12.1 , *) {
                 tableView.refreshControl = refresher
             }else{
                 tableView.addSubview(refresher)
        }


        if let userId = defaultValues.string(forKey: "userId") {
           user_id = userId
           print("user id :: \(user_id)")
           }else{
           //send back to login view controller
        }
        getCountNotificationUser()
        getNotificationUser()

    }
}
