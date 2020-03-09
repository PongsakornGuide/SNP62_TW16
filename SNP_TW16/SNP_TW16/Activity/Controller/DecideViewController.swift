//
//  DecideViewController.swift
//  SNP_TW16
//
//  Created by Guide on 26/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
//UIViewController ,UITableViewDelegate, UITableViewDataSource
class DecideViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var delegate:UIViewController?
    let URL_USER_DECIDE = "\(AppDelegate.link)alder_iosapp/v1/decide.php"
    let URL_DECIDE = "\(AppDelegate.link)alder_iosapp/v1/showDecide.php"
    lazy var defaultValues = UserDefaults.standard
    lazy var actPost = Int()
    lazy var actUserId = String()
    var textData = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    var feel: [emojiUser]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
        self.tabBarController?.tabBar.isHidden = true
         self.tableview.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
                return 1
          }else if section == 1{
                return feel?.count ?? 0
          }else{
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if indexPath.section == 0 {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DecideViewCell
                    self.tableview.separatorStyle = .none
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
                    
                    
                }else if indexPath.section == 1{
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! layoutTableViewCell
                    let emogiDecide = feel?[indexPath.row]
                    cell.textHeader.text = emogiDecide?.feel
        
                    Alamofire.request((emogiDecide?.iconImage ?? "0")!).responseImage { response in
                            if let image2 = response.result.value {
                                    cell.bgImage.image = image2
                            }
                    }
        
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
                    
        }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! TextFieldTableViewCell
                    self.tableview.separatorStyle = .none
                    cell.selectionStyle = .none
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                    return cell
        }
    }
    
    func reloadData(){
         Alamofire.request(URL_DECIDE).responseJSON { [weak self](resData) in
                    self?.feel = Mapper<emojiUser>().mapArray(JSONObject: resData.result.value)
                    self?.tableview.reloadData()
            }
    }

    
//    var textView: UITextView = {
//           let textView = UITextView()
//            textView.textColor = UIColor.blackAlpha(alpha: 0.8)
//            textView.font = UIFont.PoppinsRegular(size: 16)
//            textView.layer.borderColor = UIColor.blackAlpha(alpha: 0.3).cgColor
//            textView.layer.borderWidth = 0.5
//            textView.textColor = UIColor.lightGray
//            textView.layer.cornerRadius = 5
//            return textView
//       }()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            cell.bgImage.layer.cornerRadius = 90/2
            cell.bgImage.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            cell.bgImage.layer.borderWidth = 5
            cell.backgroundColor = UIColor.blackAlpha(alpha: 0.1)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
            if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
                cell.bgImage.layer.cornerRadius = 90/2
                cell.bgImage.layer.borderColor = UIColor.white.cgColor
                cell.bgImage.layer.borderWidth = 5
                cell.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
                
        }
    }
    
    lazy var tableview : UITableView = {
                  let tableview = UITableView()
                  tableview.delegate = self
                  tableview.dataSource = self
                  tableview.tableFooterView = UIView()
                  tableview.showsVerticalScrollIndicator = false
                  tableview.backgroundColor = .none//UIColor(white: 0.95, alpha: 1 )
                  return tableview
    }()
    
    @objc func psuhCheckBox(){
        guard let cell = TextFieldTableViewCell.textView.text else { return }
        let selectedIndex = tableview.indexPathsForSelectedRows
        let index = selectedIndex?.compactMap{ "\($0.row+1)" }
        var selectedChoice = index?.joined(separator: ",") ?? ""
        print(selectedChoice)
          let alertController = UIAlertController(title: "คุณเข้าร่วมกิจกรรมสำเร็จ", message: "แล้วพบกันในเร็วๆ นี้ :-)", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "เข้าร่วม", style: .default) { (action:UIAlertAction) in
                    let passData = ContentActivityViewController()
                    let parameters: Parameters = ["user_id":"\(self.actUserId)","post_timeline_id":"\(self.actPost)","feel_id[]":selectedChoice,"more":cell]
        //                AcitivityView.delegate = self
                        Alamofire.request(self.URL_USER_DECIDE, method: .post,parameters: parameters).responseJSON { response in
                            if let delegate = self.delegate as? ContentActivityViewController {
                                  delegate.nextButton.setTitle("เข้าร่วมกิจกรรมแล้ว",for: .normal)
                                  delegate.enableButton.isHidden = false
                                  delegate.nextButton.isHidden = true
                                self.navigationController?.popViewController(animated: true)
                        }

                    }
                }

                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
    }
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
    
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        tableview.delegate = self
        view.addSubview(tableview)
//        view.addSubview(regButton)
//        view.addSubview(textView)
//        textView
        
        tableview.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,  right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor ,topConstant: 0,  bottomConstant: 0,leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        tableview.register(DecideViewCell.self, forCellReuseIdentifier: cellId)
        tableview.register(layoutTableViewCell.self, forCellReuseIdentifier: cellId1)
        tableview.register(TextFieldTableViewCell.self, forCellReuseIdentifier: cellId2)
        tableview.tableFooterView = UIView()
        tableview.rowHeight = UITableView.automaticDimension
        tableview.allowsMultipleSelection = true

        
          if let name2 = defaultValues.string(forKey: "userId") {
             actUserId = name2
          }else{

          }

//        textView.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 0, bottomConstant: 20, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant:70)


//        regButton.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: -70, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 55)
        
      }
}
