//
//  PersonalInfoViewController.swift
//  MySignUp
//
//  Created by Seunghun Yang on 2021/03/07.
//

import UIKit

class PersonalInfoViewController: ViewController {
    
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func datePicked(_ sender: Any) {
        let date = self.datePicker.date
        let dateString = dateFormatter.string(from: date)
        self.birthdayLabel.text = dateString
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    @IBAction func prevButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
    }
}
