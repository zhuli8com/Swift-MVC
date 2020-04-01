//
//  RepositoryPresenter.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/31.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation
import Alamofire
import PackageTestLibrary
import SwiftyJSON
import KakaJSON
import UIKit

class RepositoryPresenter {
    lazy var repositories: [Repository]? = [Repository]()
    
    func getRepositories() -> Void {
        AF.request(API.getrepositoriesAPI).responseJSON(completionHandler: { [weak self] (response) in
            switch response.result{
            case .success(let value):
                guard let items = JSON(value)["items"].arrayObject else {
                    return
                }
                self?.repositories = items.kj.modelArray(type: Repository.self) as? [Repository]
                debugPrint(JSON(value)["items"].arrayObject!)
            case .failure(let error):
                debugPrint(error)
                return
            }
            })
    }
}
