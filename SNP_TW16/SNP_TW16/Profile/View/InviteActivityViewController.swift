//
//  InviteActivityViewController.swift
//  SNP_TW16
//
//  Created by Guide on 15/2/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import TwicketSegmentedControl
class InviteActivityViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate {

    var ActivityStart: [ActivityDetail]?
    var ActivityList : [ActivityDetail]?
    lazy var IdPost = Int()
    lazy var buttonView = UIButton()
    lazy var buttonView2 = UIButton()
    lazy var IdPostFormDecilde = String()
    let URL_GET_POST = "\(AppDelegate.link)alder_iosapp/v1/userActivityEnd.php"
    let URL_GET_POST_ACTIVITY_START = "\(AppDelegate.link)alder_iosapp/v1/userActivityStart.php"
    
    let URL_GET_CHECK_DECIDE = "\(AppDelegate.link)alder_iosapp/v1/checkDecide.php"
    
    lazy var user_id = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    lazy var defaultValues = UserDefaults.standard
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRelative()
        getData()
        self.tabBarController?.tabBar.isHidden = false
        self.tableView.reloadData()
    }
    
    lazy var titleHeader : UILabel = {
        let label = UILabel()
        let title = "กิจกรรมที่เข้าร่วม"
        let attributedText = NSMutableAttributedString(string: title,
                    attributes: [NSAttributedString.Key.font : UIFont.BaiJamjureeBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedText
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 247 ,green: 250, blue: 255)
        return label
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
//        return 5
        if(self.segmentedControl.selectedSegmentIndex == 0){
            return ActivityStart?.count ?? 0
        }else{
            return ActivityList?.count ?? 0
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.segmentedControl.selectedSegmentIndex == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! SearchTableViewCell
                        let listActivity = ActivityStart?[indexPath.row]
            
                        cell.titleFullname.text = listActivity?.actId
                        cell.supportName.text = "โดย \(listActivity?.caption ?? "x")"
                        let mouthStart = DateFormatter()
                        mouthStart.dateFormat = "yyyy-mm-dd"
                        let mouthStringStartt = mouthStart.date(from: listActivity?.created ?? "x")
                        mouthStart.dateFormat = "dd MMMM yyyy"
                        let mouthStringStart = mouthStart.string(from: mouthStringStartt ?? Date())
                        cell.supportTime.text = mouthStringStart
                        
                        let profileImagePath = ("\(AppDelegate.link)alder_iosapp/" + (listActivity?.imagePost ?? "0")!)
                                if let postImageURL = URL(string: profileImagePath) {
                                cell.bgActivitity.sd_setImage(with: postImageURL, completed: nil)
                        }
            
                        cell.CheckPoint.isHidden = true
                        cell.decidePass.isHidden = true
                        self.tableView.separatorStyle = .none
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            
                        return cell
            
        }else{
            
              let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
                       let listActivity = ActivityList?[indexPath.row]
                       cell.bgActivitityBg.isHidden = false
                       cell.titleFullnameEnd.isHidden = false
                       cell.titleFullname.text = listActivity?.actId
                       cell.supportName.text = "โดย \(listActivity?.caption ?? "x")"
                       let mouthStart = DateFormatter()
                       mouthStart.dateFormat = "yyyy-mm-dd"
                       let mouthStringStartt = mouthStart.date(from: listActivity?.created ?? "x")
                       mouthStart.dateFormat = "dd MMMM yyyy"
                       let mouthStringStart = mouthStart.string(from: mouthStringStartt ?? Date())
                       cell.supportTime.text = mouthStringStart
            
                       let profileImagePath = ("\(AppDelegate.link)alder_iosapp/" + (listActivity?.imagePost ?? "0")!)
                            if let postImageURL = URL(string: profileImagePath) {
                            cell.bgActivitity.sd_setImage(with: postImageURL, completed: nil)
//
                              
                        }
                                    
                        IdPost =  listActivity?.dataId ?? 0
            
                        cell.CheckPoint.titleLabel?.tag = listActivity?.dataId ?? 0
            
            
                        let parameters: Parameters = ["user_id":user_id,"post_timeline_id":IdPost]
                        Alamofire.request(URL_GET_CHECK_DECIDE, method: .post,parameters: parameters).responseJSON { response in
                            self.IdPost =  listActivity?.dataId ?? 0
                            self.buttonView = cell.CheckPoint
                            self.buttonView2 = cell.decidePass
                            guard let json = response.value as? [String:Bool], let status = json["error"] else {
                            return }
                            if !status {
                                    self.buttonView.isHidden = true
                                    self.buttonView2.isHidden = false
                            }else{
                                                            
                            }
                    }
                    self.tableView.separatorStyle = .none
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
        }

    }
    
    
    
    @objc func ClickUser(_sender:UIButton){
        IdPostFormDecilde = "\(_sender.titleLabel?.tag ?? 0)"
        let passData = DecideAfterViewController()
        passData.delegate = self
        passData.post_timeline = IdPostFormDecilde
        passData.IdUser = user_id
        print(IdPost)
        print(user_id)
        self.navigationController?.pushViewController(passData, animated: true)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    if self.segmentedControl.selectedSegmentIndex == 0{
                        let vc = ContentActivityViewController()
                        vc.activityData = ActivityStart?[indexPath.row]
                        self.navigationController?.pushViewController(vc, animated: true)

                    }else{
//                        let vc = ContentActivityViewController()
//                        vc.activityData = ActivityList?[indexPath.row]
//                        self.navigationController?.pushViewController(vc, animated: true)
                    }
    }
    
    func getData(){
              let parameters: Parameters = ["userId":user_id]
              let url = URL_GET_POST_ACTIVITY_START + "?id=\(user_id)"
              Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                 self?.ActivityStart = Mapper<ActivityDetail>().mapArray(JSONObject: dataRes.result.value)
                 self?.tableView.reloadData()
              }
    }
    
    func getRelative(){
             let parameters: Parameters = ["userId":user_id]
             let url = URL_GET_POST + "?id=\(user_id)"
             Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                  self?.ActivityList = Mapper<ActivityDetail>().mapArray(JSONObject: dataRes.result.value)
                  self?.tableView.reloadData()
             }
    }
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["กิจกรรมที่เข้าร่วม", "กิจกรรมที่เข้าร่วมแล้ว"])
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
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowToDisplay2 = ActivityStart
            lineImage2.backgroundColor = UIColor.white
            lineImage.backgroundColor = UIColor.rgb(red: 33, green: 120, blue: 174)
            break
        default:
            rowToDisplay = ActivityList
            lineImage.backgroundColor = UIColor.white
            lineImage2.backgroundColor = UIColor.rgb(red: 33, green: 120, blue: 174)
            break
        }
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    //master array
    lazy var rowToDisplay = ActivityList
    
    lazy var rowToDisplay2 = ActivityStart
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "กิจกรรมของฉัน"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
                       navigationController?.navigationBar.titleTextAttributes = textAttributes
               
        
        if let name2 = defaultValues.string(forKey: "userId") {
            user_id = name2

        }else{
            //send back to login view controller
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
//        view.backgroundColor = .white
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
        

        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId1)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        stackView.axis = .vertical
        stackView2.axis = .vertical
        
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(titleHeader)
        view.addSubview(stacView3)
       
        
        titleHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 80)
        
        stackView.anchor(titleHeader.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: stackView2.topAnchor, topConstant: 0, bottomConstant: 10, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 45)
        
    
        stacView3.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: stackView.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 6)
        
        stackView2.anchor(stackView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
