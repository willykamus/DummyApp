//
//  LoginController.swift
//  DummyApp
//
//  Created by William Ching on 2019-04-08.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var registerButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        ref = Database.database().reference()
        
        container.layer.cornerRadius = 8
        //container.layer.masksToBounds = true
        
        registerButton.layer.cornerRadius = 8

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func register(_ sender: UIButton) {
        
        guard let email = emailText.text, let password = passwordText.text, let name = nameText.text  else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            guard let user = authResult?.user else {
                return
            }
            
            self.ref.child("users").child(user.uid).setValue(["username": name, "email": email])
        }
        
    }
    
}
