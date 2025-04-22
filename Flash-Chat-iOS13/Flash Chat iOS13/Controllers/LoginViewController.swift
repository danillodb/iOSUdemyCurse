//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.text = "a@b.com"
        passwordTextfield.text = "123456"
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        errorLabel.text = ""
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let exception = error {
                    print(exception.localizedDescription)
                    self.errorLabel.text = exception.localizedDescription
                } else {
                    self.performSegue(withIdentifier: Constants.segueLoginToChat, sender: self)
                }
            }
        }
    }
}
