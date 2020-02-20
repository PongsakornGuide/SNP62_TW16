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
class InviteActivityViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var ActivityList: [ListPostUser]?
    var PostList: [allList]?
    let URL_GET_POST = "http://localhost/alder_iosapp/v1/saveActivityUser.php"
    let URL_GET_POST_ACTIVITY = "http://localhost/alder_iosapp/v1/savePostUser.php"
    var user_id = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    let defaultValues = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRelative()
        getData()
        self.tableView.reloadData()
    }
    
    let titleHeader : UILabel = {
                    let label = UILabel()
                    let title = "กิจกรรมที่เข้าร่วม"
                    let attributedText = NSMutableAttributedString(string: title,
                    attributes: [NSAttributedString.Key.font : UIFont.PoppinsBold(size: 32),NSMutableAttributedString.Key.foregroundColor : UIColor.black])
                    label.attributedText = attributedText
                    label.numberOfLines = 0
                    return label
     }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
//        return 5
        if(self.segmentedControl.selectedSegmentIndex == 0){
            return PostList?.count ?? 0
        }else{
            return ActivityList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.segmentedControl.selectedSegmentIndex == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! AcivityListTableViewCell
                           let listActivity = PostList?[indexPath.row]
                                    cell.userFullname.text = listActivity?.username
                                    cell.timeTextLabel.text = listActivity?.createdAt
                                    cell.numCount.text = "\(listActivity?.like ?? 0)"
                                    cell.numCom.text = "\(listActivity?.comment ?? 0)"
                                    cell.messageTextLabel.text = listActivity?.caption
                                    
                                       Alamofire.request("http://localhost/alder_iosapp/" + (listActivity?.img ?? "0")!).responseImage { response in
                                                             if let image = response.result.value{
                                                             cell.postImage.image = image
                                                 }
                                             }
                                             
                                             Alamofire.request("http://localhost/alder_iosapp/" + (listActivity?.photo ?? "0")!).responseImage { response in
                                                             if let image2 = response.result.value {
                                                             cell.profileImage.image = image2
                                                 }
                                             }
                                    
                                    self.tableView.separatorStyle = .none
                                    cell.selectionStyle = .none
                                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                                    return cell
            
        }else{
              let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
                        let listActivity = ActivityList?[indexPath.row]
                        cell.titleFullname.text = listActivity?.titlePost
                        cell.supportName.text = listActivity?.captionPost
                        cell.supportTime.text = listActivity?.createdPost
                        Alamofire.request((listActivity?.imgPost ?? "0")!).responseImage { response in
                                if let image = response.result.value {
                                    cell.bgActivitity.image = image
                                }
                        }
                        
                        self.tableView.separatorStyle = .none
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                        return cell
        }

    }
    
    
    
    func getRelative(){
             let parameters: Parameters = ["userId":user_id]
             let url = URL_GET_POST + "?id=\(user_id)"
             Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                  self?.ActivityList = Mapper<ListPostUser>().mapArray(JSONObject: dataRes.result.value)
                  self?.tableView.reloadData()
                  print(dataRes)
             }
    }
    
    func getData(){
              let parameters: Parameters = ["userId":user_id]
              let url = URL_GET_POST_ACTIVITY + "?id=\(user_id)"
              Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                 self?.PostList = Mapper<allList>().mapArray(JSONObject: dataRes.result.value)
                 self?.tableView.reloadData()
                print(dataRes)
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
            rowToDisplay2 = PostList
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
    
    lazy var rowToDisplay2 = PostList
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.black
        view.backgroundColor = .white
        navigationItem.title = "กิจกรรม"
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        
        let stackView = UIStackView(arrangedSubviews: [
            segmentedControl, tableView
        ])
        
        if let name2 = defaultValues.string(forKey: "userId") {
            user_id = name2
            print("user id :: \(user_id)")
        }else{
            //send back to login view controller
        }
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(AcivityListTableViewCell.self, forCellReuseIdentifier: cellId1)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        view.addSubview(titleHeader)
        
        titleHeader.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 0, leftConstant: 30, rightConstant: 0, widthConstant: 0, heightConstant: 80)
        stackView.anchor(titleHeader.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
