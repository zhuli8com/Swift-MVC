//
//  LoginViewController.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/3.
//  Copyright © 2020 lizhu. All rights reserved.
//

import UIKit

class LoginViewController_1: UIViewController,LoginViewModelDelegate {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var loginViewModel: LoginViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameField.addTarget(self, action: #selector(userNameChanged(field:)), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginViewModel = LoginViewModel()
        loginViewModel?.delegate = self
    }
    
    @objc func userNameChanged(field: UITextField) -> Void {
        loginViewModel?.userNameDidChange(text: field.text)
    }
    
    @objc func loginAction(button:UIButton){
        loginViewModel.loginAction(usernameField: userNameField, passwordField: passwordField)
    }
    
    //MARK: - LoginViewModelDelegate
    func reloadViews() {
        print("hello")
    }
}
