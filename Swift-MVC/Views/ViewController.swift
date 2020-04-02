//
//  ViewController.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/30.
//  Copyright © 2020 lizhu. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import KakaJSON
import SwiftyJSON

class ViewController: UIViewController {
    var presenter = RepositoryPresenter()
    
    //MARK: - 属性
    let cellID = "cell"
    private lazy var tableView: UITableView = {
        var table = UITableView(frame: view.bounds)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return table
    }()
    
    var repositories:[Repository] = [Repository](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1.创建tableview，并添加到控制器的view
        view.addSubview(tableView)
        
//        getRepositories()
        presenter.getRepositories(success: { [weak self] (models) in
            guard let items = models as? [Repository] else {
                return
            }
            self?.repositories = items
            self?.tableView.reloadData()
        }) { (error) in
            
        }
    }
    
    func getRepositories() -> Void {
        AF.request(API.getrepositoriesAPI).responseJSON(completionHandler: { [weak self] (response) in
            switch response.result{
            case .success(let value):
                guard let items = JSON(value)["items"].arrayObject else {
                    return
                }
                guard let modles = items.kj.modelArray(type: Repository.self) as? [Repository] else {
                    return
                }
                self?.repositories = modles
                debugPrint(JSON(value)["items"].arrayObject!)
            case .failure(let error):
                debugPrint(error)
                return
            }
            })
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = repositories[indexPath.row].fullName
        return cell!
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(repositories[indexPath.row].description ?? "default")
    }
}
