//
//  TableCheck.swift
//  SNP_TW16
//
//  Created by Guide on 5/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
class TableCheck: UITableViewController {
  
    let URL_USER_ID = "http://localhost/alder_iosapp/v1/showactivity.php/"
    let defaultValues = UserDefaults.standard
    var typecheck = String()
    var search = [Search]()
    
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    override func numberOfSections(in tableView: UITableView) -> Int {
                return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
                  if section == 0 {
                              return 1
                          }else{
                    return search.count
                  }
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if indexPath.section == 0 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ActivityHeaderViewCell
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                                    return cell
                 }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! SearchTableViewCell
                                           let check:Search
                                           check = search[indexPath.row]
                                           cell.titleFullname.text = check.titlename
                                           cell.supportName.text = check.caption
                                           cell.supportTime.text = check.time
                                           cell.Labelid.text = check.userId

                                           Alamofire.request("http://localhost/alder_iosapp/" + (check.image ?? "0")!).responseImage { response in
                                           if let image = response.result.value {
                                                   cell.bgActivitity.image = image
                                               }
                                           }
                    
                                           cell.selectionStyle = .none
                                           self.tableView.separatorStyle = .none
                                           return cell
                    
                    
                    
                }

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
                   
        }else{
            let DvC = ContentActivityViewController()
            self.navigationController?.pushViewController(DvC, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Alder"
    tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: cellId)
    tableView.register(ActivityHeaderViewCell.self, forCellReuseIdentifier: cellId1)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
        
        
        
        
        
        if let name2 = defaultValues.string(forKey: "userId") {
                                          typecheck = name2
            print("777jkjkjk")
                                   print("id ===== \(typecheck)")
             print("777jkjkjk")
            
                     }else{
                                          //send back to login view controller
        }
        
        let parameters: Parameters = ["userId":typecheck]
        Alamofire.request(URL_USER_ID + "?id=\(typecheck)", method: .post,parameters: parameters).responseJSON { (resData) in
                            if let json = resData.data {
                                print(json)
                                print(resData)
                                do {
                                    let decode = JSONDecoder()
                                    let articles = try decode.decode([Search].self, from: json)
                                    self.search.forEach {(Search) in }
                                    self.search = articles
                                    
                                    self.tableView.reloadData()
                                } catch {
                                     //error ส่งค่าว่างและ error
                                    print(error)
                                }

                            }
            }

        }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
