//
//  ViewController.swift
//  Bankey
//
//  Created by Hakeem Green on 9/21/22.
//

import UIKit

class LoginViewController: UIViewController {

    //Define login view controller
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorLabel = UILabel()
    let appName = UILabel()
    let appDescription = UILabel()
    
    var username: String?{
        return loginView.usernameTextField.text
    }
    
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }


}

extension LoginViewController{
    private func style(){
        //For custom views and autolayouts; takes element in view controller and makes it ready for autolayout
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 //for indicator spacing
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.textColor = .systemRed
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = true //Hidden until there is an error
        
        appName.translatesAutoresizingMaskIntoConstraints = false
        appName.text = "Bankey"
        appName.textAlignment = .center
        appName.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        appDescription.translatesAutoresizingMaskIntoConstraints = false
        appDescription.text = "Your premium source for all things banking!"
        appDescription.textAlignment = .center
        appDescription.numberOfLines = 0
        appDescription.font = UIFont.preferredFont(forTextStyle: .title3)
    }
    
    private func layout(){
        
        //Takes view and adds it into View controller
        view.addSubview(appName)
        view.addSubview(appDescription)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        
        
        //Centers elements in view controller
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //1 = 8 pts
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            //Places button below loginview
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        //Label
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //App Title
        NSLayoutConstraint.activate([
            appDescription.topAnchor.constraint(equalToSystemSpacingBelow: appName.bottomAnchor, multiplier: 3 ),
            appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            loginView.topAnchor.constraint(equalToSystemSpacingBelow: appDescription.bottomAnchor, multiplier: 3 ),
            appDescription.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            appDescription.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

extension LoginViewController{

    @objc func signInTapped(sender: UIButton){
//        print("Tapped")
        errorLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Hakeem" && password == "welcome"{
            signInButton.configuration?.showsActivityIndicator = true
        }
        else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String){
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
