//
//  Network.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/18.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation

struct WebJSON: Codable {
    var name: String
    var node: String
    var version: Int?
}

class Network<T: Codable> {
    let session: URLSession
    
    typealias CompletionJSONClosure = (_ data: T) -> Void
    var completionJSONClosure: CompletionJSONClosure = {_ in}
    
    init() {
        self.session = URLSession.shared
    }
    
    func requestJSON(_ url: String, doneClouser: @escaping CompletionJSONClosure) {
        self.completionJSONClosure = doneClouser
        let url =  URL(string: url)!

        let request: URLRequest = NSURLRequest(url:url) as URLRequest
        let task = self.session.dataTask(with: request) { (data, res, error) in
            if error == nil {
                let decoder = JSONDecoder()
                do {
                    print("解析JSON成功")
                    let jsonModel = try decoder.decode(T.self, from: data!)
                    self.completionJSONClosure(jsonModel)
                    print(jsonModel)
                } catch  {
                    print("解析JSON失败")
                }
            }
        }
        task.resume()
    }
    

    func testAF() {
        Alamofire.request("https://httpbin.org/get").responseData { (response) in
            if let data = response.data{
                let decoder = JSONDecoder()
                do {
                    print("解析JSON成功")
                    let jsonModel = try decoder.decode(WebJSON.self, from: data)
                    print(jsonModel)
                } catch  {
                    print("解析JSON失败")
                }
            }
        }
    }
}
