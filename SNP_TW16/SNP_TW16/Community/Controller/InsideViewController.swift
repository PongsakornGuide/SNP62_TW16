//
//  InsideViewController.swift
//  SNP_TW16
//
//  Created by Guide on 11/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class InsideViewController: UITableViewController{
    
    let URL_GET_DATA = "http://localhost/alder_iosapp/v1/show.php"
    let URL_GET_COMMENT = "http://localhost/alder_iosapp/v1/showcomment.php"
    let defaultValues = UserDefaults.standard
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var check : allList?
    var comment: [CommentList]?


    override func viewWillAppear(_ animated: Bool){
           super.viewWillAppear(animated)
           tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return 2
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         if section == 0 {
            return 1
         }else{
            return comment?.count ?? 0
         }
     }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
          let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! DetailActivityViewController
              cell.username.text = check?.username
              cell.date.text = check?.createdAt
              cell.comment.text = check?.caption
              cell.numCount.text = "\(check?.like ?? 0)"
            Alamofire.request("http://localhost/alder_iosapp/" + (check?.photo ?? "0")!).responseImage { response in
                     if let image = response.result.value {
                        cell.profile.image = image
                    }
            }
            
            Alamofire.request("http://localhost/alder_iosapp/" + (check?.img ?? "0")!).responseImage { response in
                     if let image = response.result.value {
                        cell.imagePost.image = image
                    }
            }
              cell.selectionStyle = .none
              return cell
          }else{
           let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! CommentTableView
            
            let commentActivity = comment?[indexPath.row]
            cell.date.text = commentActivity?.created
            cell.comment.text = commentActivity?.post
            cell.username.text = commentActivity?.userName
            cell.numCount.text = "\(commentActivity?.like ?? 0)"
            Alamofire.request("http://localhost/alder_iosapp/" + (commentActivity?.imageView ?? "0")!).responseImage { response in
                    if let image = response.result.value{
                            cell.profile.image = image
                }
            }

                cell.selectionStyle = .none
                return cell
          }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Alder"
        print(check?.id ?? 0)
        let url = URL_GET_COMMENT + "?id=\(check?.id ?? 0)"
        Alamofire.request(url).responseJSON { [weak self](resData) in
            print(resData)
            self?.comment = Mapper<CommentList>().mapArray(JSONObject: resData.result.value)
            self?.tableView.reloadData()
        }

        tableView.register(DetailActivityViewController.self, forCellReuseIdentifier: cellId)  
        tableView.register(CommentTableView.self, forCellReuseIdentifier: cellId1)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50

    }
    
    
}
