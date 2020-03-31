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

class RepositoryPresenter {
    let url = "https://api.github.com/search/repositories?q=SwiftUI&order=desc"
    
    func getRepositories() -> Void {
        AF.request(url).response { (response) in
            debugPrint(response)
//            PackageTestLibrary().test()
            PackageTestLibrary().test()
        }
        
    }
}
