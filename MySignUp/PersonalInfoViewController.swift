//
//  PersonalInfoViewController.swift
//  MySignUp
//
//  Created by Seunghun Yang on 2021/03/07.
//

import UIKit

class PersonalInfoViewController: ViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var signinButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signinButton.isEnabled = false
        phoneNumberField.delegate = self
    }
    
    func inputValidation() {
        if birthdayLabel.text != "" && phoneNumberField.text != "" {
            signinButton.isEnabled = true
        } else {
            signinButton.isEnabled = false
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        inputValidation()
    }
    
    @IBAction func datePicked(_ sender: Any) {
        let date = self.datePicker.date
        let dateString = dateFormatter.string(from: date)
        self.birthdayLabel.text = dateString
        inputValidation()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        UserInformation.sharedUserInformation.id = nil
        UserInformation.sharedUserInformation.password = nil
        UserInformation.sharedUserInformation.bio = nil
        UserInformation.sharedUserInformation.phoneNumber = nil
        UserInformation.sharedUserInformation.birthday = nil
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func prevButtonTapped(_ sender: Any) {
        UserInformation.sharedUserInformation.phoneNumber = nil
        UserInformation.sharedUserInformation.birthday = nil
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        UserInformation.sharedUserInformation.phoneNumber = phoneNumberField.text
        UserInformation.sharedUserInformation.birthday = birthdayLabel.text
        self.navigationController?.popToRootViewController(animated: true)
    }
}
