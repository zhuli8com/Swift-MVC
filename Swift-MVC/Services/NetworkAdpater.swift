//
//  NetworkAdpater.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/1.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation
import Alamofire

//https://blog.csdn.net/yahibo/article/details/100083499
class NetworkAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        request.setValue("hibotoken", forHTTPHeaderField: "token")
        request.setValue("device", forHTTPHeaderField: "iOS")
        request.setValue("vision", forHTTPHeaderField: "1.0.0")
    }
    
}
