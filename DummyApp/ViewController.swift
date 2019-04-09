//
//  ViewController.swift
//  DummyApp
//
//  Created by William Ching on 2019-04-08.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func LogOut(_ sender: UIBarButtonItem) {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let mainViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginController") as? LoginController else {
            return
        }
        
        present(mainViewController,animated: true,completion: nil)
        
    }
    
}

