//
//  ViewController.swift
//  MySignUp
//
//  Created by Seunghun Yang on 2021/03/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signInIDField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.signInIDField != nil {
            if let idString = UserInformation.sharedUserInformation.id {
                self.signInIDField.text = idString
            } else {
                self.signInIDField.text = ""
            }
        }
    }
}
