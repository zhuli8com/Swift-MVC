//
//  ValidatesPassword.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/4.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation

protocol ValidatesPassword {
    func validatePassword(_ password: String) -> Bool
}

extension ValidatesPassword {
    func validatePassword(_ password: String) -> Bool {
        if password.count < 6 || password.count > 12 {
            return false
        }
        return true
    }
}
