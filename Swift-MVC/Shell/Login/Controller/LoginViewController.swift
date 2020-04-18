//
//  LoginViewController.swift
//  Swift-MVC
//
//  Created by lizhu on 2020/4/4.
//  Copyright © 2020 lizhu. All rights reserved.
//

class LoginViewController: BaseViewController, LoginViewModelDelegate {
    
    lazy private var loginViewModel: LoginViewModel = {
        let loginVM: LoginViewModel = LoginViewModel()
        loginVM.delegate = self
        return loginVM
    }()
    
    
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
    lazy private var passwordTextField:UITextField = {
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
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTextField)
            make.right.equalTo(phoneTextField)
            make.top.equalTo(phoneTextField.snp_bottom).offset(15)
            make.height.equalTo(phoneTextField.snp_height)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
            make.height.equalTo(passwordTextField.snp_height)
        }
    }
    
    // MARK: - event response
    @objc func didClickLoginButton() {
        Network<WebJSON>().requestJSON("http://www.starming.com/api.php?get=testjson") { jsonModel in
            print(jsonModel)
        }
        loginViewModel.loginAction(phoneTextField:phoneTextField,passwordTextField:passwordTextField)
    }
    
    //MARK: - LoginViewModelDelegate
    func showToast() {
        let alertVC = UIAlertController(title: "提示", message: "用户名或密码错误", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
            alertVC.dismiss(animated: true, completion: nil)
        }
    }
}
