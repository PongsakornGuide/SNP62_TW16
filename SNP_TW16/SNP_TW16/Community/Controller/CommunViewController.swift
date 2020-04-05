
//
//  communViewController.swift
//  SNP_TW16
//
//  Created by Guide on 10/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper
import SDWebImage
import PopupDialog

class CommunViewController: UITableViewController{

    lazy var defaultValues = UserDefaults.standard
    lazy var datalist1 = ["firstCell1" , "firstCell2" , "firstCell3" , "firstCell4"]
    lazy var User_Name = String()
    lazy var User_ID = String()
    lazy var adpostId = Int()
    lazy var adpostId2 = String()
    lazy var commentId = Int()
    var activityList: [allList]?
    
    let URL_GET_DATA = "\(AppDelegate.link)alder_iosapp/v1/show.php"
    let URL_CLICK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/like_Activity.php"
    let URL_CLICK_UNLIKE = "\(AppDelegate.link)alder_iosapp/v1/deleteLike.php"
    
    let URL_CHECK_LIKE = "\(AppDelegate.link)alder_iosapp/v1/checkLike.php"
    let URL_COUNT_LIKE = "\(AppDelegate.link)alder_iosapp/v1/countLike.php"
    let URL_DELETE_POST = "\(AppDelegate.link)alder_iosapp/v1/deletePostUser.php"
    
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    lazy var idcontent = Int()
    lazy var idPostUser = Int()
    lazy var postId = Int()
    lazy var postIdtitle = Int()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getActivty()
        self.tabBarController?.tabBar.isHidden = false
        self.tableView.reloadData()
    }
 
    @objc func handelSetting(){
        let CreateView = CreateViewController()
        navigationController?.pushViewController(CreateView, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else{
            return activityList?.count ?? 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ActivityPageViewController
            tableView.separatorStyle = .none
            return cell
        }else{
            
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! AcivityListTableViewCell
            let headerActivity = activityList?[indexPath.row]
            cell.userFullname.text = headerActivity?.username
            cell.messageTextLabel.text = headerActivity?.caption
            
            
            let mouthStart = DateFormatter()
            mouthStart.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = mouthStart.date(from: headerActivity?.createdAt ?? "x")
            mouthStart.dateFormat = "MMM d, h:mm a"
            let mouthStringStart = mouthStart.string(from: date ?? Date())
            cell.timeTextLabel.text = mouthStringStart
            idPostUser = headerActivity?.userAppId ?? 0
            cell.iconOther.titleLabel?.tag = indexPath.row
            let userId = User_ID
                        
            
            cell.numCount.text = "\(headerActivity?.likeActivity ?? 0)  ถูกใจ"
            cell.numCom.text = "\(headerActivity?.commentsActivity ?? 0)  คอมเม้นต์"
            adpostId = headerActivity?.id ?? 0
            cell.iconOther.tag = headerActivity?.id ?? 0
            
            if cell.iconImageLike.tag == 0{
                
            }else{
                cell.iconImageLike.tintColor = .black
                cell.iconImageLike.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
            }
            
            cell.iconImageLike.titleLabel?.tag = headerActivity?.id ?? 0

            let parametersId: Parameters = ["ad_post_timeline_id":adpostId]
                    let urlComment = URL_COUNT_LIKE + "?id=\(adpostId)"
                    Alamofire.request(urlComment, method: .post,parameters: parametersId).responseJSON { [weak self](resData) in
                                if let user = resData.result.value as! [String: Any]? {
                                        if let commentId = user["likeActivity"] as? Int {
                                                    cell.numCount.text = "\(commentId)  ถูกใจ"
                                        }
                    }
            }
            
            
            let postImagePath = "\(AppDelegate.link)alder_iosapp/" + (headerActivity?.img ?? "0")
            let profileImagePath = "\(AppDelegate.link)alder_iosapp/" + (headerActivity?.photo ?? "0")
            if let postImageURL = URL(string: postImagePath) {
                cell.postImage.sd_setImage(with: postImageURL, completed: nil)
            }
            
            if let profileImageURL = URL(string: profileImagePath){
                cell.profileImage.sd_setImage(with: profileImageURL, completed: nil)
            }

            
            
                
                      
            
            
            
            let parameters: Parameters = ["user_id":User_ID,"ad_post_timeline_id":adpostId]
            Alamofire.request(URL_CHECK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                    guard let json = response.value as? [String:Bool], let status = json["error"] else {
                    return }
                        if !status {
                            cell.iconImageLike.tag = 1
                            cell.iconImageLike.tintColor = UIColor.red
                            cell.iconImageLike.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                    }else{
                }
            }
            
            if userId == "\(idPostUser)"{
                cell.iconOther.isHidden = false
                }else{
                cell.iconOther.isHidden = true
            }
            
            self.tableView.separatorStyle = .none
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
    }

    @objc func moreOther(_sender:UIButton){
         postIdtitle = _sender.tag
         postId = _sender.titleLabel?.tag ?? 0
        
        //Prepare the popup assets
        let title = "THIS IS THE DIALOG TITLE"
        //label.font = UIFont.BaiJamjureeRegular(size: 14)

        let message = "This is the message section of the popup dialog default view"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "ยกเลิก") {
            print("You canceled the car dialog.")
        }

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "แก้ไขข้อมูล") {
            print("What a beauty!")
            let view = editPostUserViewController()
            view.post_id = self.postIdtitle
            self.navigationController?.pushViewController(view, animated: true)
        }

        let buttonThree = DefaultButton(title: "ลบข้อมูล", height: 60) {
            print("Delete")
            _ = self.activityList?[self.postId]
            let parameters: Parameters = ["id":self.postIdtitle,"user_app_id":self.User_ID]
            let url = self.URL_DELETE_POST
            Alamofire.request(url, method: .post,parameters: parameters).responseJSON { response in
                self.activityList?.remove(at: self.postId)
                self.tableView.reloadData()
            }
        }

        popup.addButtons([buttonTwo, buttonThree, buttonOne])

        self.present(popup, animated: true, completion: nil)
    }
    
    
    func getActivty(){
             Alamofire.request(URL_GET_DATA).responseJSON { [weak self](resData) in
                     self?.activityList = Mapper<allList>().mapArray(JSONObject: resData.result.value)
                     self?.tableView.reloadData()
             }
    }
    
    
    @objc func likePost(_sender:UIButton){
        adpostId2 = "\(_sender.titleLabel?.tag ?? 0)"
        switch _sender.tag{
                case 0:
                    requestData()
                    let parameters: Parameters = ["user_id":User_ID,"ad_post_timeline_id":adpostId2]
                    print(parameters)
                                    Alamofire.request(URL_CLICK_LIKE, method: .post,parameters: parameters).responseJSON { response in
                    }
                    _sender.tag = 1
                    _sender.tintColor = UIColor.red
                    _sender.setImage(UIImage(named: "likeAct")?.withRenderingMode(.alwaysTemplate), for: .normal)
                    self.tableView.reloadData()
                case 1:
                    requestData()
                    let parameters: Parameters = ["user_id":User_ID,"ad_post_timeline_id":adpostId2]
                    print(parameters)
                                    Alamofire.request(URL_CLICK_UNLIKE, method: .post,parameters: parameters).responseJSON { response in
                    }
                    _sender.tag = 0
                    _sender.tintColor = .black
                    _sender.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
                    self.tableView.reloadData()
                default: break
                }
         
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            if indexPath.section == 0 {
                
            }else {
                let vc = InputCommentViewController()
                vc.check = activityList?[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
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
                 self.getActivty()
             }
      }
    
      let submitBtn : UIButton = {
              let submit = UIButton(type: .system)
              submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
              submit.layer.borderWidth = 5
              submit.backgroundColor =  UIColor.rgb(red: 33, green: 120, blue: 174)
              submit.layer.cornerRadius = 45
              submit.setTitle("โพสต์", for: .normal)
              submit.setTitleColor(UIColor.white,for: .normal)
              submit.addTarget(self, action: #selector(handelSetting), for: .touchUpInside)
              submit.titleLabel?.font = UIFont.BaiJamjureeBold(size: 22)
              return submit
      }()


    @objc func handelSettingNotification(){
        let notificaionView = NotificationTableView()
        navigationController?.pushViewController(notificaionView, animated: true)
    }
          
       override func viewDidLoad() {
       super.viewDidLoad()
          view.addSubview(submitBtn)
          navigationItem.title = "Alder"
        
        let settings = UIBarButtonItem(image: UIImage(named: "bell"), style: .plain, target: self, action: #selector(handelSettingNotification))
        settings.width = 0.5
        settings.tintColor = UIColor.rgb(red: 253, green: 173, blue: 82)
        navigationItem.rightBarButtonItem = settings
        
          let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
                navigationController?.navigationBar.titleTextAttributes = textAttributes
        
          submitBtn.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: nil, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: -100, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 90, heightConstant: 90)
        
            if #available(iOS 12.1 , *) {
                                tableView.refreshControl = refresher
                            }else{
                                tableView.addSubview(refresher)
            }
        
            tableView.register(ActivityPageViewController.self, forCellReuseIdentifier: cellId1)
            tableView.register(AcivityListTableViewCell.self, forCellReuseIdentifier: cellId)
           
            tableView.tableFooterView = UIView()
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 50
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
         
        
            let defaultValues = UserDefaults.standard
                       if let name = defaultValues.string(forKey: "userId") {
                             //setting the name to label
                            User_ID = name
                       }else {
                     //send back to login view controller
            }
        
            if let name = defaultValues.string(forKey: "userName") {
                                 //setting the name to label
                                User_Name = name
                                print(User_Name)
                           }else {
                    //send back to login view controller
            }

       }
}
