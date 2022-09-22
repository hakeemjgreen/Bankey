//
//  LoginView.swift
//  Bankey
//
//  Created by Hakeem Green on 9/21/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    //Initialize Frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Styling for view
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Size of view
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 200)
    }
}

//Extend style and layout to group and remove clutter
extension LoginView{
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .purple
    }
    
    func layout() {
        
    }
}
