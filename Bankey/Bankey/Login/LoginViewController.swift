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
    }
    
    private func layout(){
        
        //Takes view and adds it into View controller
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //1 = 8 pts
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
    }
}

