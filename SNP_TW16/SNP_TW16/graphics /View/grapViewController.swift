//
//  grapViewController.swift
//  SNP_TW16
//
//  Created by Guide on 25/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//
//
import UIKit
class grapViewController: UITableViewController {
    private var cellId = "Cell"
    
    let regButton : UIButton = {
                    let submit = UIButton(type: UIButton.ButtonType.system)
                    submit.backgroundColor = UIColor.white
                    submit.layer.cornerRadius = 30
                    submit.layer.borderColor = UIColor.blackAlpha(alpha: 0.2).cgColor
                    submit.layer.shadowOpacity = 0.2
                    submit.layer.shadowOffset = CGSize(width: 0, height: 0)
                    submit.layer.shadowRadius = 10
                    submit.setTitle("SUMMIT", for: .normal)
                    submit.setTitleColor(UIColor.blackAlpha(alpha: 0.7),for: .normal)
                    submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
                    submit.addTarget(self, action: #selector(psuhCheckBox), for: .touchUpInside)
                    return submit
    }()
    
    @objc func psuhCheckBox(){
        let selectedIndex = tableView.indexPathsForSelectedRows
        let index = selectedIndex?.compactMap{ "\($0.row)" }
        var selectedChoice = index?.joined(separator: ",") ?? ""
        print(selectedChoice)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! layoutTableViewCell
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            cell.bgImage.backgroundColor = .purple
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath) as? layoutTableViewCell{
            cell.bgImage.backgroundColor = .yellow
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        view.addSubview(regButton)
        tableView.register(layoutTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        regButton.anchor(view.safeAreaLayoutGuide.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: -100, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
    }
}

