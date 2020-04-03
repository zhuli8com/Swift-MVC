//
//  LoginViewModel.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/3.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel {
    weak var `delegate`:LoginViewModelDelegate?
    
    private var usernameValid = false
    private var passwordValid = false
    private var userName: String?
    private var password: String?
    
    func userNameDidChange(text:String?) -> Void {
        guard let text = text else {
            return
        }
        if text.count < 6 {
            usernameValid = false
        }else{
            usernameValid = true
        }
        userName = text
        delegate?.reloadViews()
    }
    
    func loginAction(usernameField:UITextField,passwordField:UITextField) -> () {
        print("name:\(String(describing: usernameField.text)), password:\(String(describing: passwordField.text))")
    }
}
