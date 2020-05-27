//
//  EmergencyViewController.swift
//  SNP_TW16
//
//  Created by Guide on 31/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SDWebImage
import PopupDialog
class EmergencyViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate {
    let defaultValues = UserDefaults.standard
    var user_id = String()
    let URL_GET_TEL = "\(AppDelegate.link)alder_iosapp/v1/emergency.php"
    let URL_GET_TEL_RELATIVE = "\(AppDelegate.link)alder_iosapp/v1/showTel.php"
    let URL_GET_TEL_RELATIVE_ADD = "\(AppDelegate.link)alder_iosapp/v1/showTelRelative.php"
    let URL_DELETE_TEL_RELATIVE = "\(AppDelegate.link)alder_iosapp/v1/deleteRelativeTel.php"
    var relativeList: [listRelative]?
    var emergencyList: [allListTel]?
    var userRelavite: [addRelative]?
    var btnBarBadge : MJBadgeBarButton!
    
    lazy var indexPathComment = Int()
    lazy var indexPathComment2 = Int()
    lazy var indexPathComment3 = Int()
    lazy var indexPathComment4 = Int()
    lazy var indexPathComment5 = Int()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    private var cellId3 = "Cell3"
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           getRelative()
           getList()
           getUserRelative()
           self.tableview.reloadData()
//          self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        self.navigationController?.isNavigationBarHidden = true
       }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
             
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              if section == 0 {
                  return relativeList?.count ?? 0
              }else if section == 1{
                  return emergencyList?.count ?? 0
              }else if section == 2{
                  return userRelavite?.count ?? 0
              }else{
                    return 1
              }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! EmergencyView
//                cell.btnEmergency.tag = indexPath.row
//            TextFieldTableViewCell.textView.text
                
            
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
        }else if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! DetailEmergencyView
                let Emergency = emergencyList?[indexPath.row]
                cell.title.text = Emergency?.emergencyName ?? "5555"
            
    
            
                let postImagePath = Emergency?.emergencyIcon ?? "0"
                    if let postImageURL = URL(string: postImagePath) {
                        cell.ImageView.sd_setImage(with: postImageURL, completed: nil)
                }
            
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                self.tableview.separatorStyle = .none
                return cell
                
        }else if indexPath.section == 2{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId3,for: indexPath) as! ListRelatuveView
                let ListRelative = userRelavite?[indexPath.row]
                cell.title.text = "\(ListRelative?.username ?? "nil")"
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                self.tableview.separatorStyle = .none
                return cell
            }else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! AddTelView
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                return cell
            }
        }
    
    
    @objc func actionDecide(_sender:UIButton){
        indexPathComment2 = _sender.tag
            print(indexPathComment2)
        
                    let callRelative = self.relativeList?[indexPathComment2]
                            if let url = URL(string: "tel://\(0)\(callRelative?.relativeTel ?? 0)"), UIApplication.shared.canOpenURL(url) {
                                 if #available(iOS 10, *) {
                                     UIApplication.shared.open(url)
                                              } else {
                                     UIApplication.shared.openURL(url)
                              }
                    
                }
    }
    
    @objc func actionCall(_sender:UIButton){
        indexPathComment = _sender.tag
              print(indexPathComment)
        
            let callRelative = self.emergencyList?[indexPathComment]
                    if let url = URL(string: "tel://\(callRelative?.emergencyCall ?? 0)"), UIApplication.shared.canOpenURL(url) {
                         if #available(iOS 10, *) {
                             UIApplication.shared.open(url)
                                      } else {
                             UIApplication.shared.openURL(url)
                      }
            
        }
    }
    
    @objc func actionCallUser(_sender:UIButton){
            indexPathComment3 = _sender.tag
                  print(indexPathComment3)
                let callRelative = self.userRelavite?[indexPathComment3]
                        if let url = URL(string: "tel://\(0)\(callRelative?.telphone ?? 0)"), UIApplication.shared.canOpenURL(url) {
                             if #available(iOS 10, *) {
                                 UIApplication.shared.open(url)
                                          } else {
                                 UIApplication.shared.openURL(url)
                          }
                
            }
    }
    
    
    @objc func complete(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func deleteUser(_sender:UIButton){
            indexPathComment4 = _sender.tag
            indexPathComment5 = _sender.titleLabel?.tag ?? 0
        let parameters: Parameters = ["id":indexPathComment4,"user_id":self.user_id]
            let url = self.URL_DELETE_TEL_RELATIVE
            print(parameters)
            Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
                self?.userRelavite?.remove(at: self?.indexPathComment5 ?? 0)
                self?.tableview.reloadData()
                let popOverVC = AlertDelete()
                self?.navigationController?.pushViewController(popOverVC, animated: true)
            }
    }
    
    //Func call phone
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
        
            
            let callRelative = self.relativeList?[indexPath.row]
            let TelUser = "\(0)\(callRelative?.relativeTel ?? 0)"
            let TelnameUser = callRelative?.relativeName
            let popOverVC = AlertDecide()
            self.addChild(popOverVC)
            AlertDecide.callUser.tag = indexPath.row
            popOverVC.titleHeader.text = "ติดต่อ : \(TelnameUser ?? "x")"
            popOverVC.titleHeader1.text = "\(TelUser)"
            popOverVC.titleHeader.font = UIFont.BaiJamjureeBold(size: 22)
            popOverVC.titleHeader.textAlignment = .center
            popOverVC.titleHeader1.font = UIFont.BaiJamjureeBold(size: 30)
            popOverVC.titleHeader1.textAlignment = .center
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
            
        }else if indexPath.section == 1{
//            print(indexPath.row)
              let callRelative = self.emergencyList?[indexPath.row]
              let TelUser = "\(callRelative?.emergencyCall ?? 0)"
              let TelnameUser = callRelative?.emergencyName
              let popOverVC = AlertofCall()
              self.addChild(popOverVC)
              popOverVC.titleHeader.text = "ติดต่อ : \(TelnameUser ?? "x")"
              popOverVC.titleHeader1.text = "\(TelUser)"
              popOverVC.titleHeader.font = UIFont.BaiJamjureeBold(size: 22)
              popOverVC.titleHeader.textAlignment = .center
              popOverVC.titleHeader1.font = UIFont.BaiJamjureeBold(size: 30)
              popOverVC.titleHeader1.textAlignment = .center
              AlertofCall.postUser.tag = indexPath.row
          
            
                      let postImagePath = (callRelative?.emergencyIcon ?? "0")
                     
                     if let postImageURL = URL(string: postImagePath) {
                        popOverVC.iconImage.sd_setImage(with: postImageURL, completed: nil)
                     }
            
              popOverVC.view.frame = self.view.frame
              self.view.addSubview(popOverVC.view)
              popOverVC.didMove(toParent: self)
            
        }else if indexPath.section == 2{
            let callRelative = self.userRelavite?[indexPath.row]
            let TelUser = "\(callRelative?.username ?? "x")"
            let TelnameUser = callRelative?.telphone
            let popOverVC = AlertCallofUser()
            self.addChild(popOverVC)
            AlertCallofUser.postUser.tag = indexPath.row
            popOverVC.titleHeader.text = "ติดต่อ : \(TelUser)"
            popOverVC.titleHeader1.text = "\(0)\(TelnameUser ?? 0)"
            popOverVC.titleHeader.font = UIFont.BaiJamjureeBold(size: 22)
            popOverVC.titleHeader.textAlignment = .center
            popOverVC.titleHeader1.font = UIFont.BaiJamjureeBold(size: 30)
            popOverVC.titleHeader1.textAlignment = .center
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
            AlertCallofUser.deletebtn.tag = callRelative?.idTel ?? 0
            AlertCallofUser.deletebtn.titleLabel?.tag = indexPath.row

        }else{
            let createRelative = CreateRelativeTelView()
            navigationController?.pushViewController(createRelative, animated: true)
        }
    }
    
    func getRelative(){
        let parameters: Parameters = ["userId":user_id]
        let url = URL_GET_TEL_RELATIVE + "?id=\(user_id)"
        print(url)
        Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](dataRes) in
             self?.relativeList = Mapper<listRelative>().mapArray(JSONObject: dataRes.result.value)
             self?.tableview.reloadData()
             print(dataRes)
        }
    }
    
    func getList(){
           Alamofire.request(URL_GET_TEL).responseJSON { [weak self](resData) in
            self?.emergencyList = Mapper<allListTel>().mapArray(JSONObject: resData.result.value)
            self?.tableview.reloadData()
            }
    }
    
    func getUserRelative(){
        let parameters: Parameters = ["userId":user_id]
        let url = URL_GET_TEL_RELATIVE_ADD + "?id=\(user_id)"
        Alamofire.request(url, method: .post,parameters: parameters).responseJSON { [weak self](TelData)
            in
            self?.userRelavite = Mapper<addRelative>().mapArray(JSONObject: TelData.result.value)
            self?.tableview.reloadData()
        }
    }
    
    func animateTable(){
        tableview.reloadData()
        let cells = tableview.visibleCells
        let tableViewHeight = tableview.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
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
        let RefreshLine = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: RefreshLine) {
            self.refresher.endRefreshing()
            self.getRelative()
            self.getList()
            self.getUserRelative()
        }
    }
    
    
    @objc func handelSettingNotification(){
        let notificaionView = NotificationTableView()
        navigationController?.pushViewController(notificaionView, animated: true)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        view.addSubview(tableview)
        tableview.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,  right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor ,topConstant: 0,  bottomConstant: 0,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

         let customButton = UIButton(type: UIButton.ButtonType.custom)
               customButton.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
               customButton.addTarget(self, action: #selector(self.handelSettingNotification), for: .touchUpInside)
             customButton.setImage(UIImage(named: "bell"), for: .normal)
             
             self.btnBarBadge = MJBadgeBarButton()
             self.btnBarBadge.setup(customButton: customButton)
             self.btnBarBadge.badgeOriginX = 20.0
             self.btnBarBadge.badgeOriginY = -4
             self.navigationItem.rightBarButtonItem = self.btnBarBadge

        
        
        
        
    navigationItem.title = "Alder"
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.BaiJamjureeBold(size: 25)]
                navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        if #available(iOS 12.1 , *) {
            tableview.refreshControl = refresher
        }else{
            tableview.addSubview(refresher)
        }
        if let user = defaultValues.string(forKey: "userId") {
            user_id = user
         }else{
            //send back to login view controller
        }
        
        tableview.register(EmergencyView.self, forCellReuseIdentifier: cellId)
        tableview.register(DetailEmergencyView.self, forCellReuseIdentifier: cellId1)
        tableview.register(AddTelView.self, forCellReuseIdentifier: cellId2)
        tableview.register(ListRelatuveView.self, forCellReuseIdentifier: cellId3)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 40
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        animateTable()
    }
}
