//
//  TitleStoryTableView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class TitleStoryTableView:  UITableViewController ,UINavigationControllerDelegate{
    
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    private var cellId2 = "Cell2"
    private var cellId3 = "Cell3"
    var story: [StoryUser]?
    var prayer: [prayerUser]?
    let URL_GET_DATA_STORY = "\(AppDelegate.link)alder_iosapp/v1/showStory.php"
    let URL_GET_DATA_PRAYER = "\(AppDelegate.link)alder_iosapp/v1/showPrayer.php"
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         getPrayer()
         getStory()
         tableView.reloadData()
     }
     
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 4
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         if section == 0 {
             return 1
         }else if section == 1{
            return prayer?.count ?? 0
         }else if section == 2{
            return 1
         }else{
            return story?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               if indexPath.section == 0 {
                       let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! TitleReligionViewCell
                        self.tableView.separatorStyle = .none
                        cell.selectionStyle = .none
                        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                        return cell
                              
               }else if indexPath.section == 1{
                       let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! ReligionTableView
                       let prayerUserRead = prayer?[indexPath.row]
                        cell.titleFullname.text = prayerUserRead?.title
                            Alamofire.request((prayerUserRead?.image ?? "0")!).responseImage { response in
                                   if let image = response.result.value {
                                       cell.bgActivitity.image = image
                                   }
                            }
                       self.tableView.separatorStyle = .none
                       cell.selectionStyle = .none
                       cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                       return cell
               }else if indexPath.section == 2{
                       let cell = tableView.dequeueReusableCell(withIdentifier: cellId2,for: indexPath) as! TileStoryViewCell
                       self.tableView.separatorStyle = .none
                       cell.selectionStyle = .none
                       cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                       return cell
               }else{
                       let cell = tableView.dequeueReusableCell(withIdentifier: cellId3,for: indexPath) as! StroyTableView
                
                        let storyUserRead = story?[indexPath.row]
                        cell.titleFullname.text = storyUserRead?.title
                        cell.detaillname.text = storyUserRead?.caption
                            Alamofire.request((storyUserRead?.image ?? "0")!).responseImage { response in
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
                   
        }else if indexPath.section == 1{
            let vc = DetailReligionViewController()
            let deatilPrayer = prayer?[indexPath.row]
            vc.titleLabel.text = deatilPrayer?.title
            vc.contentLabel.text = deatilPrayer?.content
            
              Alamofire.request((deatilPrayer?.image ?? "0")!).responseImage { response in
                        if let image = response.result.value{
                            vc.stepView.image = image
                        }
             }
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.section == 2{
            
        }else{
            let vc = DetailStoryViewController()
            let deatilStory = story?[indexPath.row]
            vc.titleLabel.text = deatilStory?.title
            vc.contentLabel.text = deatilStory?.content
            Alamofire.request((deatilStory?.image ?? "0")!).responseImage { response in
                                   if let image = response.result.value{
                                       vc.stepView.image = image
                                   }
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
      func getPrayer(){
             Alamofire.request(URL_GET_DATA_PRAYER).responseJSON { [weak self](resData) in
                     self?.prayer = Mapper<prayerUser>().mapArray(JSONObject: resData.result.value)
                     self?.tableView.reloadData()
             }
      }
    
      func getStory(){
                Alamofire.request(URL_GET_DATA_STORY).responseJSON { [weak self](resData) in
                        self?.story = Mapper<StoryUser>().mapArray(JSONObject: resData.result.value)
                        self?.tableView.reloadData()
                }
       }
    
      override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
            navigationItem.title = "Alder"
            tableView.register(TitleReligionViewCell.self, forCellReuseIdentifier: cellId)
            tableView.register(ReligionTableView.self, forCellReuseIdentifier: cellId1)
            tableView.register(TileStoryViewCell.self, forCellReuseIdentifier: cellId2)
            tableView.register(StroyTableView.self, forCellReuseIdentifier: cellId3)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 350

        }
            
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
}
