//
//  LoginViewController.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/4.
//  Copyright © 2020 lizhu. All rights reserved.
//

class LoginViewController: BaseViewController {
    //logo
    private let logoView = UIImageView(image: R.image.logo())
    //手机号
    lazy private var phoneTextField:UITextField = {
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        var phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor =  UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "请输入手机号"
        return phoneTextField
    }()
    //密码
    lazy private var passwordTextFiled:UITextField = {
        let passwordIconView = UIImageView(image: R.image.icon_pwd())
        let textFiled = UITextField()
        textFiled.leftView = passwordIconView
        textFiled.leftViewMode = .always
        textFiled.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        textFiled.layer.borderWidth = 1
        textFiled.textColor = UIColor.hexColor(0x333333)
        textFiled.layer.cornerRadius = 5
        textFiled.layer.masksToBounds = true
        textFiled.placeholder = "请输入密码"
        textFiled.isSecureTextEntry = true
        return textFiled
    }()
    //登录按钮
    lazy private var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("登录", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(logoView)
        logoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextFiled)
        passwordTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTextField)
            make.right.equalTo(phoneTextField)
            make.top.equalTo(phoneTextField.snp_bottom).offset(15)
            make.height.equalTo(phoneTextField.snp_height)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(passwordTextFiled)
            make.right.equalTo(passwordTextFiled)
            make.top.equalTo(passwordTextFiled.snp_bottom).offset(20)
            make.height.equalTo(passwordTextFiled.snp_height)
        }
    }
    
    // MARK: - event response
    @objc func didClickLoginButton() {
//        if validatePhoneNumber(phoneTextField.text ?? "") && validatePassword(passwordTextField.text ?? "") {
//
//        } else {
//            self.showToast()
//        }
    }
}
