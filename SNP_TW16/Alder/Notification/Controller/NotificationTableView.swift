
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
class NotificationTableView: UIViewController,UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate {
    
    //cell
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    
    var idpost = Int()
    var idpostUser = Int()
    //variable
    var countNotification: [countlistNotification]?
    var notification: [listNotification]?
//    var notificationPost: [listNotificationPost]?
    var notificationPost: [allList]?
    lazy var user_id = String()
    lazy var defaultValues = UserDefaults.standard
    
    //URL
    let URL_GET_COUNT_NOTIFICATION = "\(AppDelegate.link)alder_iosapp/v1/countNotification.php"
    let URL_GET_NOTIFICATION = "\(AppDelegate.link)alder_iosapp/v1/notificationUser.php"
    let URL_GET_NOTIFICATION_POST = "\(AppDelegate.link)alder_iosapp/v1/notificationPostUser.php"
    let URL_CHECK_INVITE = "\(AppDelegate.link)alder_iosapp/v1/inviteActivity.php"

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        getNotificationPostUser()
        getNotificationUser()
        requestData()
        self.tabBarController?.tabBar.isHidden = false
        tableView.reloadData()
    }
    
    lazy var textHeader : UILabel = {
        let label = UILabel()
        let title = "การแจ้งเตือน"
        let attributedTexts = NSMutableAttributedString(string: title,
        attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 34),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedTexts
        label.numberOfLines = 0
        return label
    }()
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.segmentedControl.selectedSegmentIndex == 0){
            return notification?.count ?? 0
        }else{
            return notificationPost?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(self.segmentedControl.selectedSegmentIndex == 0){
              let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! NotificationColumn
              let listNoti = notification?[indexPath.row]
              cell.textLabelTitle.text = "กิจกรรม : \(listNoti?.testtitle ?? "x")"
              cell.textLabelTitle.textColor = UIColor.rgb(red: 33, green: 64, blue: 154)
              cell.textLabelTitle.font = UIFont.BaiJamjureeBold(size: 20)
            
              cell.textLabelName.text = "ตอนนี้ \(listNoti?.title ?? "x") \nขอให้สนุกกับกิจกรรมในเร็วๆนี้"
              cell.textLabelName.font = UIFont.BaiJamjureeMedium(size: 18)
              let mouthStart = DateFormatter()
              mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
              let date = mouthStart.date(from: listNoti?.create ?? "x")
              mouthStart.dateFormat = "d, h:mm a"
              let mouthStringStart = mouthStart.string(from: date ?? Date())
              cell.timeLabel1.text = "\(mouthStringStart)"
              cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
              cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)

            
                mouthStart.dateFormat = "MMMM"
                let mouthStringStart2 = mouthStart.string(from: date ?? Date())
                if mouthStringStart2 == "January"{
                    cell.timeLabel.text = "มกราคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "February"{
                    cell.timeLabel.text = "กุมภาพันธ์"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "March"{
                    cell.timeLabel.text = "มีนาคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "April"{
                    cell.timeLabel.text = "เมษายน"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "May"{
                    cell.timeLabel.text = "พฤษภาคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "June"{
                    cell.timeLabel.text = "มิถุนายน"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "July"{
                    cell.timeLabel.text = "กรกฎาคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "August"{
                    cell.timeLabel.text = "สิงหาคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "September"{
                    cell.timeLabel.text = "กันยายน"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "October"{
                    cell.timeLabel.text = "ตุลาคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else if mouthStringStart2 == "November"{
                    cell.timeLabel.text = "พฤศจิกายน"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }else{
                    cell.timeLabel.text = "ธันวาคม"
                    cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
                    cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
                }
            
              tableView.separatorStyle = .none
              cell.selectionStyle = .none
              cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
              return cell
       }else{
             let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! NotificationColumnPost
             let listPost = notificationPost?[indexPath.row]
             cell.username.text = "คุณ : \(listPost?.username ?? "ไม่มีข้อมูล")"
             cell.username.textColor = UIColor.rgb(red: 33, green: 64, blue: 154)
             cell.username.font = UIFont.BaiJamjureeBold(size: 20)
             cell.textLabelTitle.text = "ได้แสดงความคิดในโพส \(listPost?.caption ?? "ไม่มีข้อมูล") ของคุณ"
             cell.textLabelTitle.font = UIFont.BaiJamjureeMedium(size: 18)
            
            
             let mouthStart = DateFormatter()
             mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
             let date = mouthStart.date(from: listPost?.createdAt ?? "ไม่มีข้อมูล")
             mouthStart.dateFormat = "d, h:mm a"
             let mouthStringStart = mouthStart.string(from: date ?? Date())
             cell.timeLabel.text = "\(mouthStringStart)"
             cell.timeLabel.font = UIFont.BaiJamjureeLight(size: 16)
             cell.timeLabel.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)

            
            mouthStart.dateFormat = "MMMM"
            let mouthStringStart2 = mouthStart.string(from: date ?? Date())
            if mouthStringStart2 == "January"{
                cell.timeLabel1.text = "มกราคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "February"{
                cell.timeLabel1.text = "กุมภาพันธ์"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "March"{
                cell.timeLabel1.text = "มีนาคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "April"{
                cell.timeLabel1.text = "เมษายน"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "May"{
                cell.timeLabel1.text = "พฤษภาคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "June"{
                cell.timeLabel1.text = "มิถุนายน"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "July"{
                cell.timeLabel1.text = "กรกฎาคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "August"{
                cell.timeLabel1.text = "สิงหาคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "September"{
                cell.timeLabel1.text = "กันยายน"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "October"{
                cell.timeLabel1.text = "ตุลาคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else if mouthStringStart2 == "November"{
                cell.timeLabel1.text = "พฤศจิกายน"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }else{
                cell.timeLabel1.text = "ธันวาคม"
                cell.timeLabel1.font = UIFont.BaiJamjureeLight(size: 16)
                cell.timeLabel1.textColor = UIColor.rgb(red: 167, green: 169, blue: 172)
            }
            
            
             let postImagePath = ("\(AppDelegate.link)alder_iosapp/" + (listPost?.photo ?? "0")!)
                if let postImageURL = URL(string: postImagePath) {
                cell.profileImage.sd_setImage(with: postImageURL, completed: nil)
             }
            
             idpost = listPost?.adposttimeline ?? 0
             idpostUser = listPost?.userPostId ?? 0
             tableView.separatorStyle = .none
             cell.selectionStyle = .none
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
             return cell
            
        }

    }
    
    lazy var lineImage: UIView = {
                 let background = UIView()
         background.backgroundColor = UIColor.rgb(red: 33, green: 120, blue: 174)
                    return background
     }()
     
     lazy var lineImage2: UIView = {
                    let background = UIView()
                       background.backgroundColor = UIColor.white
                       return background
     }()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          if(self.segmentedControl.selectedSegmentIndex == 0){
            let contentActivity = NotificationContent()
            let deatilActvity = notification?[indexPath.row]
            contentActivity.titleLabel.text = deatilActvity?.actId
            contentActivity.textHeader.text = deatilActvity?.type
            contentActivity.nameLabel.text = "โดย: \(deatilActvity?.caption ?? "x")"
            contentActivity.contentLabel.text = deatilActvity?.content
            contentActivity.timerAct.text = "\(deatilActvity?.startTime ?? "x") - "
            contentActivity.endtimerAct.text = deatilActvity?.endtime
            contentActivity.postId = deatilActvity?.dataId ?? 0

//            fomatterDate
//            print(deatilActvity?.created)
            let mouthStart = DateFormatter()
            mouthStart.dateFormat = "yyyy-MM-dd"
            let mouthStringStartt = mouthStart.date(from: deatilActvity?.created ?? "x")
//            print(mouthStringStartt)
            mouthStart.dateFormat = "dd"
            let mouthStringStart = mouthStart.string(from: mouthStringStartt ?? Date())
            contentActivity.startDateAct.text = mouthStringStart
            contentActivity.timeLabel.text = "วันเริ่มกิจกรรม: \(mouthStringStart)"

            
            mouthStart.dateFormat = "yyyy"
            let mouthStringStart1 = mouthStart.string(from: mouthStringStartt ?? Date())
//            contentActivity.timeLabel2.text = mouthStringStart1
//            contentActivity.startDateAct2.text = mouthStringStart1
            var num = Int(mouthStringStart1)
            num = num! + 543
            contentActivity.timeLabel2.text = "\(num ?? 0)"
            contentActivity.startDateAct2.text = "\(num ?? 0)"
            
//            print(deatilActvity?.created)
            mouthStart.dateFormat = "MMMM"
            let mouthStringStart2 = mouthStart.string(from: mouthStringStartt ?? Date())
            if mouthStringStart2 == "January"{
                contentActivity.timeLabel1.text = "มกราคม"
                contentActivity.startDateAct1.text = "มกราคม"
            }else if mouthStringStart2 == "February"{
                contentActivity.timeLabel1.text = "กุมภาพันธ์"
                contentActivity.startDateAct1.text = "กุมภาพันธ์"
            }else if mouthStringStart2 == "March"{
                contentActivity.timeLabel1.text = "มีนาคม"
                contentActivity.startDateAct1.text = "มีนาคม"
            }else if mouthStringStart2 == "April"{
                contentActivity.timeLabel1.text = "เมษายน"
                contentActivity.startDateAct1.text = "เมษายน"
            }else if mouthStringStart2 == "May"{
                contentActivity.timeLabel1.text = "พฤษภาคม"
                contentActivity.startDateAct1.text = "พฤษภาคม"
            }else if mouthStringStart2 == "June"{
                contentActivity.timeLabel1.text = "มิถุนายน"
                contentActivity.startDateAct1.text = "มิถุนายน"
            }else if mouthStringStart2 == "July"{
                contentActivity.timeLabel1.text = "กรกฎาคม"
                contentActivity.startDateAct1.text = "กรกฎาคม"
            }else if mouthStringStart2 == "August"{
                contentActivity.timeLabel1.text = "สิงหาคม"
                contentActivity.startDateAct1.text = "สิงหาคม"
            }else if mouthStringStart2 == "September"{
                contentActivity.timeLabel1.text = "กันยายน"
                contentActivity.startDateAct1.text = "กันยายน"
            }else if mouthStringStart2 == "October"{
                contentActivity.timeLabel1.text = "ตุลาคม"
                contentActivity.startDateAct1.text = "ตุลาคม"
            }else if mouthStringStart2 == "November"{
                contentActivity.timeLabel1.text = "พฤศจิกายน"
                contentActivity.startDateAct1.text = "พฤศจิกายน"
            }else{
                contentActivity.timeLabel1.text = "ธันวาคม"
                contentActivity.startDateAct1.text = "ธันวาคม"
            }
          
            
            //fomatterDate
            let dateFormatterStart = DateFormatter()
            dateFormatterStart.dateFormat = "HH:mm:ss"
            let dateStart = dateFormatterStart.date(from: deatilActvity?.startTime ?? "x")
            dateFormatterStart.dateFormat = "HH:mm"
            let dateString = dateFormatterStart.string(from: dateStart ?? Date())
            contentActivity.timerAct.text = "\(dateString) - "

            //fomatterDate
            let dateFormatterEnd = DateFormatter()
            dateFormatterEnd.dateFormat = "HH:mm:ss"
            let dateEnd = dateFormatterEnd.date(from: deatilActvity?.endtime ?? "x")
            dateFormatterEnd.dateFormat = "HH:mm"
            let dateStringEnd = dateFormatterEnd.string(from: dateEnd ?? Date())
            contentActivity.endtimerAct.text = "\(dateStringEnd)"

            //getImage
            let postImagePath = "\(AppDelegate.link)alder_iosapp/" + (deatilActvity?.imagePost ?? "0")
                if let postImageURL = URL(string: postImagePath) {
                        contentActivity.stepView.sd_setImage(with: postImageURL, completed: nil)
            }

            //Check User Invaite Activity
            let parameters: Parameters = ["id": deatilActvity?.dataId ?? 0]
                        let url = URL_CHECK_INVITE + "?id=\(deatilActvity?.dataId ?? 0)"
                            print(url)
                            Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
                                               if let user = resData.result.value as! [String: Any]? {
                                                   if let yield = user["invaite"] as? Int {
                                                    print("5555")
                                                    contentActivity.joinAct.text = "ผู้เข้าร่วม \(yield ) คน"
                                        }
                        }
            }
            
            navigationController?.pushViewController(contentActivity, animated: true)
          }else{
                print("555")
                let CommentView = PostActivityUserViewController()
                CommentView.idPost = idpost
                CommentView.idPostUser = idpostUser
                navigationController?.pushViewController(CommentView, animated: true)
          }
    }

    func getNotificationUser(){
                let parameters: Parameters = ["id":user_id]
                let url = URL_GET_NOTIFICATION + "?id=\(user_id)"
                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                   self?.notification = Mapper<listNotification>().mapArray(JSONObject: dataRes.result.value)
                }
    }
    
    func getNotificationPostUser(){
                 let parameters: Parameters = ["id":user_id]
                 let url = URL_GET_NOTIFICATION_POST + "?id=\(user_id)"
                 Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                    self?.notificationPost = Mapper<allList>().mapArray(JSONObject: dataRes.result.value)
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
    
    let segmentedControl: UISegmentedControl = {
         let control = UISegmentedControl(items: ["กิจกรรมของฉัน", "โพสต์ของฉัน"])
                 control.selectedSegmentIndex = 0
                 control.backgroundColor = .white
                 control.tintColor = .clear
                 

                 control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.BaiJamjureeBold(size: 16)], for: .normal)
         //        control.backgroundColor = UIColor.white
                 
                 
                 control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                 NSAttributedString.Key.font: UIFont.BaiJamjureeBold(size: 16)], for: .selected)
                 
         control.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
         return control
    }()
     
    @objc fileprivate func handleSegmentChange(){
         switch segmentedControl.selectedSegmentIndex{
         case 0:
             rowToDisplay = notification
             lineImage2.backgroundColor = UIColor.white
             lineImage.backgroundColor = UIColor.rgb(red: 33, green: 120, blue: 174)
             getNotificationUser()
             
             break
         default :
             rowToDisplay2 = notificationPost
             lineImage.backgroundColor = UIColor.white
             lineImage2.backgroundColor = UIColor.rgb(red: 33, green: 120, blue: 174)
             getNotificationPostUser()
             break
//         default:
//             rowToDisplay3 = notification
//             break
         }
         tableView.reloadData()
     }
     
     let tableView = UITableView(frame: .zero, style: .plain)
     //master array
     lazy var rowToDisplay = notification
     lazy var rowToDisplay2 = notificationPost
//     lazy var rowToDisplay3 = notification
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "การแจ้งเตือน"
               let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
               navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        let backButton = UIBarButtonItem()
        backButton.title = "back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        getNotificationPostUser()
        getNotificationUser()
        if #available(iOS 12.1 , *) {
                 tableView.refreshControl = refresher
             }else{
                 tableView.addSubview(refresher)
        }

        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        let stackView = UIStackView(arrangedSubviews: [
            segmentedControl
             ])
             
        let stackView2 = UIStackView(arrangedSubviews: [
            tableView
        ])
        
        let stacView3 = UIStackView(arrangedSubviews:[lineImage,lineImage2])
          stacView3.distribution = .fillEqually
          stacView3.spacing = 0
          stacView3.axis = .horizontal
        
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableView.register(NotificationColumn.self, forCellReuseIdentifier: cellId)
        tableView.register(NotificationColumnPost.self, forCellReuseIdentifier: cellId1)
//        tableView.register(NotificationColumn.self, forCellReuseIdentifier: cellId2)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50

        stackView.axis = .vertical
        stackView2.axis = .vertical
             
//        tableView.backgroundView = UIImageView(image: UIImage(named: "bg"))
        view.addSubview(textHeader)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(stacView3)
        
        textHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 80)
        
        stackView.anchor(textHeader.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: stackView2.topAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 45)
        
        stacView3.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: stackView.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 6)
           
        
        stackView2.anchor(stackView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        if let userId = defaultValues.string(forKey: "userId") {
            user_id = userId
            }else{
            //send back to login view controller
        }

    }
}
    

    
//    func getCountNotificationUser(){
//                let parameters: Parameters = ["id":user_id]
//                let url = URL_GET_COUNT_NOTIFICATION + "?id=\(user_id)"
//
//                Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](resData) in
//                    if let user = resData.result.value as! [String: Any]? {
//                        if let yield = user["countNoti"] as? Int{
//                            self?.textHeader.text = "การแจ้งเตือน \(yield) รายการ"
//                            self?.textHeader.textColor = .black
//                            self?.textHeader.font = UIFont.BaiJamjureeBold(size: 30)
//                        }
//                    }
//
//            }
//    }
