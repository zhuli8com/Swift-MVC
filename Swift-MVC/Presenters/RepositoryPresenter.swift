//
//  RepositoryPresenter.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/31.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation

typealias ResponseSuccess = (_ response: [Convertible]) -> Void
typealias ResponseFail = (_ error: Error) -> Void

class RepositoryPresenter {
    
    func getRepositories(success: @escaping ResponseSuccess, failure: @escaping ResponseFail) -> Void {
        
        request(API.getrepositoriesAPI).responseJSON(completionHandler: { (response) in
            switch response.result{
            case .success(let value):
                guard let items = JSON(value)["items"].arrayObject else {
                    return
                }
                guard let models = items.kj.modelArray(type: Repository.self) as? [Repository] else {
                    return
                }
                success(models)
                debugPrint(models)
            case .failure(let error):
                failure(error)
                debugPrint(error)
                return
            }
            })
    }
}
