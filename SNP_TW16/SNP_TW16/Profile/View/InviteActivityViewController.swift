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
class InviteActivityViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate {

    var ActivityStart: [ActivityDetail]?
    var ActivityList : [ActivityDetail]?
    lazy var IdPost = Int()
    lazy var buttonView = UIButton()
    lazy var buttonView2 = UIButton()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.segmentedControl.selectedSegmentIndex == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! SearchTableViewCell
                        let listActivity = ActivityStart?[indexPath.row]
                        cell.titleFullname.text = listActivity?.actId
                        cell.supportName.text = listActivity?.caption
                        cell.supportTime.text = listActivity?.created
                        
                        Alamofire.request((listActivity?.imagePost ?? "0")!).responseImage { response in
                                         if let image = response.result.value {
                                             cell.bgActivitity.image = image
                                         }
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
                        cell.titleFullname.text = listActivity?.actId
                        cell.supportName.text = listActivity?.caption
                        cell.supportTime.text = listActivity?.created
            
                        Alamofire.request((listActivity?.imagePost ?? "0")!).responseImage { response in
                                if let image = response.result.value {
                                    cell.bgActivitity.image = image
                                    
                                }
                        }
                        
                        self.tableView.separatorStyle = .none
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                        IdPost =  listActivity?.dataId ?? 0
            
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
             return cell
        }

    }
    

    
    
    @objc func ClickUser(){
        let passData = DecideAfterViewController()
        passData.delegate = self
        passData.post_timeline = IdPost
        passData.IdUser = user_id
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
        let control = UISegmentedControl(items: ["กำลังจะมาถึง", "ที่ผ่านไปแล้ว"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return control
    }()
    
    
    @objc fileprivate func handleSegmentChange(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowToDisplay2 = ActivityStart
            break
        default:
            rowToDisplay = ActivityList
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
        if let name2 = defaultValues.string(forKey: "userId") {
            user_id = name2

        }else{
            //send back to login view controller
        }
        
        tableView.dataSource = self
        tableView.delegate = self
//        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [
            segmentedControl, tableView
        ])
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId1)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        view.addSubview(titleHeader)
        
        titleHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 80)
        stackView.anchor(titleHeader.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
