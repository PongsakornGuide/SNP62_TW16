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
class CommunViewController: UITableViewController{

    let defaultValues = UserDefaults.standard
    let datalist1 = ["firstCell1" , "firstCell2" , "firstCell3" , "firstCell4"]
    var User_Name = String()
    var User_ID = String()
    var cc = UILabel()
    var activityList: [allList]?
    
//    let URL_GET_DATA = "http://localhost/alder_iosapp/v1/show.php"
    let URL_GET_DATA = "http://172.20.10.5/alder_iosapp/v1/show.php"
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var idcontent = Int()


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getActivty()
        self.tabBarController?.tabBar.isHidden = false
//        self.tableView.reloadData()
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
       
    @objc func likePost(){
        print("555")
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ActivityPageViewController
            return cell
        }else{
            
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! AcivityListTableViewCell
            let headerActivity = activityList?[indexPath.row]
            cell.userFullname.text = headerActivity?.username
            cell.messageTextLabel.text = headerActivity?.caption
            cell.timeTextLabel.text = headerActivity?.createdAt
            cell.numCount.text = "\(headerActivity?.like ?? 1)"
            cell.numCom.text = "\(headerActivity?.comment ?? 1)"
            Alamofire.request("http://172.20.10.5/alder_iosapp/" + (headerActivity?.img ?? "0")!).responseImage { response in
                            if let image = response.result.value{
                            cell.postImage.image = image
                }
            }
            
            Alamofire.request("http://172.20.10.5/alder_iosapp/" + (headerActivity?.photo ?? "0")!).responseImage { response in
                            if let image2 = response.result.value {
                            cell.profileImage.image = image2
                }
            }
            
            self.tableView.separatorStyle = .none
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        
        }

    }
  

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            if indexPath.section == 0 {
                
            }else {
                let vc = InsideViewController()
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
    
    
      func getActivty(){
           Alamofire.request(URL_GET_DATA).responseJSON { [weak self](resData) in
                      self?.activityList = Mapper<allList>().mapArray(JSONObject: resData.result.value)
                      self?.tableView.reloadData()
              }
      }
    
      let submitBtn : UIButton = {
              let submit = UIButton(type: .system)
              submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
              submit.layer.borderWidth = 2
              submit.backgroundColor =  UIColor.rgb(red: 33, green: 120, blue: 174)
              submit.layer.cornerRadius = 40
              submit.setTitle("โพสต์", for: .normal)
              submit.setTitleColor(UIColor.white,for: .normal)
              submit.addTarget(self, action: #selector(handelSetting), for: .touchUpInside)
              submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
              return submit
      }()

       override func viewDidLoad() {
       super.viewDidLoad()
//       navigationController?.navigationBar.isHidden = true
        view.addSubview(submitBtn)
        navigationItem.title = "Alder"
          submitBtn.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: nil, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: -100, bottomConstant: 0, leftConstant: 0, rightConstant: 20, widthConstant: 80, heightConstant: 80)
        
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
