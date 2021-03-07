//
//  SignupViewController.swift
//  MySignUp
//
//  Created by Seunghun Yang on 2021/03/07.
//

import UIKit

class SignupViewController: ViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var signUpIDField: UITextField!
    @IBOutlet weak var signUpPWField: UITextField!
    @IBOutlet weak var doubleCheckPWField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profileImageTappGesture = UITapGestureRecognizer(target: self, action: #selector(self.imagePickerTapped(_:)))
        
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(profileImageTappGesture)
        
        nextButton.isEnabled = false
        
        signUpIDField.delegate = self
        signUpPWField.delegate = self
        doubleCheckPWField.delegate = self
        bioTextView.delegate = self
    }
    
    func inputValidation() {
        if signUpIDField.text != "" && signUpPWField.text != "" && signUpPWField.text == doubleCheckPWField.text && bioTextView.text != "" {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        inputValidation()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        inputValidation()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        self.profileImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imagePickerTapped(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        UserInformation.sharedUserInformation.id = signUpIDField.text
        UserInformation.sharedUserInformation.password = signUpPWField.text
        UserInformation.sharedUserInformation.bio = bioTextView.text
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        UserInformation.sharedUserInformation.id = nil
        UserInformation.sharedUserInformation.password = nil
        UserInformation.sharedUserInformation.bio = nil
        self.navigationController?.popViewController(animated: true)
    }
}
