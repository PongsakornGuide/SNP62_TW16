
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
              let mouthStart = DateFormatter()
              mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
              let date = mouthStart.date(from: listNoti?.create ?? "x")
              mouthStart.dateFormat = "MMM d, h:mm a"
              let mouthStringStart = mouthStart.string(from: date ?? Date())
              cell.timeLabel.text = "\(mouthStringStart) น."
            
              tableView.separatorStyle = .none
              cell.selectionStyle = .none
              cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
              return cell
       }else{
             let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! NotificationColumnPost
             let listPost = notificationPost?[indexPath.row]
             cell.username.text = "คุณ : \(listPost?.username ?? "x")"
             cell.username.textColor = UIColor.rgb(red: 33, green: 64, blue: 154)
             cell.username.font = UIFont.BaiJamjureeBold(size: 20)
             cell.textLabelTitle.text = "ได้แสดงความคิดในโพส \(listPost?.caption ?? "x") ของคุณ"
             let mouthStart = DateFormatter()
             mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
             let date = mouthStart.date(from: listPost?.createdAt ?? "x")
             mouthStart.dateFormat = "HH:mm"
             let mouthStringStart = mouthStart.string(from: date ?? Date())
             cell.timeLabel.text = "\(mouthStringStart) น."
             cell.timeLabel.font = UIFont.BaiJamjureeBold(size: 18)

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
            contentActivity.timeLabel.text = "วันเริ่มกิจกรรม: \(deatilActvity?.created ?? "x")"
            contentActivity.contentLabel.text = deatilActvity?.content
            contentActivity.startDateAct.text = deatilActvity?.created
            contentActivity.timerAct.text = "\(deatilActvity?.startTime ?? "x") - "
            contentActivity.endtimerAct.text = deatilActvity?.endtime
            contentActivity.postId = deatilActvity?.dataId ?? 0

            //fomatterDate
            let mouthStart = DateFormatter()
            mouthStart.dateFormat = "yyyy-mm-dd"
            let mouthStringStartt = mouthStart.date(from: deatilActvity?.created ?? "x")
            mouthStart.dateFormat = "dd MMMM yyyy"
            let mouthStringStart = mouthStart.string(from: mouthStringStartt ?? Date())
            contentActivity.startDateAct.text = mouthStringStart
            contentActivity.timeLabel.text = "วันเริ่มกิจกรรม: \(mouthStringStart)"

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
                 

                 control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.BaiJamjureeBold(size: 16),NSAttributedString.Key.backgroundColor: UIColor.white], for: .normal)
         //        control.backgroundColor = UIColor.white
                 
                 
                 control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                 NSAttributedString.Key.font: UIFont.BaiJamjureeBold(size: 16),NSAttributedString.Key.backgroundColor: UIColor.white], for: .selected)
                 
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
        getNotificationPostUser()
        getNotificationUser()
        if #available(iOS 12.1 , *) {
                 tableView.refreshControl = refresher
             }else{
                 tableView.addSubview(refresher)
        }
        
//      getCountNotificationUser()
        
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
