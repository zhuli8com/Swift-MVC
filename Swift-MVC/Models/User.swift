//
//  User.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/3/30.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation
import KakaJSON

struct User : Convertible{
    
    var id : Int = 0
    var login : String?
    var avatarUrl : String?
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        return property.name.kj.underlineCased()
    }
}
