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
class DecideViewController: UITableViewController {
var delegate:UIViewController?
//    let URL_USER_DECIDE = "http://localhost/alder_iosapp/v1/decide.php"
//    let URL_DECIDE = "http://localhost/alder_iosapp/v1/showDecide.php"
//
    
    let URL_USER_DECIDE = "http://172.20.10.5/alder_iosapp/v1/decide.php"
    let URL_DECIDE = "http://172.20.10.5/alder_iosapp/v1/showDecide.php"
    let defaultValues = UserDefaults.standard

    var actPost = Int()
    var actUserId = String()
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var feel: [emojiUser]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
        self.tableView.reloadData()
    }
    
    func reloadData(){
         Alamofire.request(URL_DECIDE).responseJSON { [weak self](resData) in
                    self?.feel = Mapper<emojiUser>().mapArray(JSONObject: resData.result.value)
                    self?.tableView.reloadData()
            }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return feel?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DecideViewCell
            self.tableView.separatorStyle = .none
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }else{
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
        }
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            
            cell.bgImage.layer.cornerRadius = 80/2
            cell.bgImage.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            cell.bgImage.layer.borderWidth = 2
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            cell.bgImage.layer.cornerRadius = 80/2
            cell.bgImage.layer.borderColor = UIColor.white.cgColor
            cell.bgImage.layer.borderWidth = 2
        }
    }

    let textView: UITextView = {
        let textView = UITextView()
         textView.textColor = UIColor.blackAlpha(alpha: 0.8)
         textView.font = UIFont.PoppinsRegular(size: 16)
         textView.layer.borderColor = UIColor.blackAlpha(alpha: 0.3).cgColor
         textView.layer.borderWidth = 0.5
         textView.textColor = UIColor.lightGray
         textView.layer.cornerRadius = 5
         return textView
    }()
    
    let regButton : UIButton = {
                    let submit = UIButton(type: UIButton.ButtonType.system)
                    submit.backgroundColor = UIColor.rgb(red: 27, green: 71, blue: 147)
                    submit.layer.cornerRadius = 25
                    submit.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                    submit.layer.shadowOpacity = 0.2
                    submit.layer.shadowOffset = CGSize(width: 0, height: 0)
                    submit.layer.shadowRadius = 10
                    submit.setTitle("เข้าร่วมกิจกรรม", for: .normal)
                    submit.setTitleColor(UIColor.white,for: .normal)
                    submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
                    submit.addTarget(self, action: #selector(psuhCheckBox), for: .touchUpInside)
                    return submit
    }()
    @objc func psuhCheckBox(){
          let selectedIndex = tableView.indexPathsForSelectedRows
          let index = selectedIndex?.compactMap{ "\($0.row)" }
          var selectedChoice = index?.joined(separator: ",") ?? ""
          print(selectedChoice)
     
        let alertController = UIAlertController(title: "คุณเข้าร่วมกิจกรรมสำเร็จ", message: "แล้วพบกันในเร็วๆ นี้ :-)", preferredStyle: .alert)
                
        let action1 = UIAlertAction(title: "เข้าสู่ระบบ", style: .default) { (action:UIAlertAction) in
            let passData = ContentActivityViewController()
            let parameters: Parameters = ["user_id":"\(self.actUserId)","post_timeline_id":"\(self.actPost)","feel_id[]":selectedChoice,"more":"\(self.textView.text ?? "NULL")"]
//                AcitivityView.delegate = self
                Alamofire.request(self.URL_USER_DECIDE, method: .post,parameters: parameters).responseJSON { response in
                    if let delegate = self.delegate as? ContentActivityViewController {
                         delegate.nextButton.setTitle("เข่าร่วมกิจกรรมแล้ว",for: .normal)
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
          if let name2 = defaultValues.string(forKey: "userId") {
             actUserId = name2
          }else{
            
          }
          view.addSubview(regButton)
          view.addSubview(textView)
          view.backgroundColor = .white
          tableView.allowsMultipleSelection = true
          tableView.register(DecideViewCell.self, forCellReuseIdentifier: cellId)
          tableView.register(layoutTableViewCell.self, forCellReuseIdentifier: cellId1)
          tableView.rowHeight = UITableView.automaticDimension
          tableView.estimatedRowHeight = 50
        
         textView.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: regButton.topAnchor, topConstant: 0, bottomConstant: 20, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant:70)
        
        
          regButton.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: -70, bottomConstant: 0, leftConstant: 40, rightConstant: 40, widthConstant: 0, heightConstant: 55)
      }
}