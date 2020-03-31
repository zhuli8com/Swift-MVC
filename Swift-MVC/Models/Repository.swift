//
//  Repository.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/30.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation

struct Repository {
    var id : Int
    var fullName : String
    var description : String?
    var stargazersCount : Int = 0
    var language : String?
    var owner : User
}
