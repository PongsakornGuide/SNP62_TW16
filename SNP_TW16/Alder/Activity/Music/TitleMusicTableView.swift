//
//  TitleMusicTableView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 15/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class TitleMusicTableView: UITableViewController ,UINavigationControllerDelegate {
    var video: [VideoUser]?
    private var cellId = "Cell"
    private var cellId1 = "Cell1"
    var VideoName = String()
    let URL_GET_DATA_VIDEO = "\(AppDelegate.link)alder_iosapp/v1/showVideo.php"
//       let URL_GET_DATA_PRAYER = "\(AppDelegate.link)alder_iosapp/v1/showPrayer.php"
//
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            getVideo()
            tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
           return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           if section == 0 {
               return 1
           }else{
            return video?.count ?? 0
           }
    }
      
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 if indexPath.section == 0 {
                         let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! TitleMusicViewCell
                          self.tableView.separatorStyle = .none
                          cell.selectionStyle = .none
                          cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                          return cell
                 }else{
                         let cell = tableView.dequeueReusableCell(withIdentifier: cellId1,for: indexPath) as! MusicViewCell
                         let videoUserRead = video?[indexPath.row]
                         VideoName = videoUserRead?.url ?? "x"
                         let url = URL(string:"\(VideoName)")
                         cell.bgActivitity.loadRequest(URLRequest(url: url!))
                         cell.nameMusic.text = "เพลง : \(videoUserRead?.singerName ?? "x")"
                         cell.songMusic.text = "นักร้อง : \(videoUserRead?.title_video ?? "x")"
                         self.tableView.separatorStyle = .none
                         cell.selectionStyle = .none
                         cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                         return cell
                 }
    }
    
    func getVideo(){
           Alamofire.request(URL_GET_DATA_VIDEO).responseJSON { [weak self](resData) in
                   self?.video = Mapper<VideoUser>().mapArray(JSONObject: resData.result.value)
                   self?.tableView.reloadData()
           }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 246, blue: 250)
        navigationItem.title = "Alder"
        tableView.register(TitleMusicViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(MusicViewCell.self, forCellReuseIdentifier: cellId1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 350
    }
            

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
