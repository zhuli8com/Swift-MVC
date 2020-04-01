//
//  Repository.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/30.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation
import KakaJSON

struct Repository: Convertible{
    var id : Int = 0
    var fullName : String = ""
    var description : String?
    var stargazersCount : Int = 0
    var language : String?
    var owner : User?
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
//        if property.name == "name" { return "login" }
//        return property.name
        return property.name.kj.underlineCased()
    }
    
    func kk_modelKey(from property: Property) -> ModelPropertyKey {
        if property.name == "name" { return "login" }
        return property.name
    }
}
