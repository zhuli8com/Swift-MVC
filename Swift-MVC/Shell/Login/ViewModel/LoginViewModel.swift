//
//  LoginViewModel.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/3.
//  Copyright © 2020 lizhu. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel : ValidatesPhoneNumber,ValidatesPassword {
    weak var delegate:LoginViewModelDelegate?
    
    func loginAction(phoneTextField:UITextField,passwordTextField:UITextField) -> () {
        if validatePhoneNumber(phoneTextField.text ?? "") && validatePassword(passwordTextField.text ?? "") {
            print("name:\(String(describing: phoneTextField.text)), password:\(String(describing: passwordTextField.text))")
        } else {
            delegate?.showToast()
        }
        
    }
}
