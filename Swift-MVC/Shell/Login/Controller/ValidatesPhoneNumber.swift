//
//  ValidatesPhoneNumber.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/4.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

extension ValidatesPhoneNumber{
    func validatePhoneNumber(_ phoneNumber: String) -> Bool{
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}
