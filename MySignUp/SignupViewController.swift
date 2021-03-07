//
//  SignupViewController.swift
//  MySignUp
//
//  Created by Seunghun Yang on 2021/03/07.
//

import UIKit

class SignupViewController: ViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordCheckField: UITextField!
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
        
        idField.delegate = self
        passwordField.delegate = self
        passwordCheckField.delegate = self
        bioTextView.delegate = self
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.idField.text != "" && passwordField.text != "" && passwordField.text == passwordCheckField.text && self.bioTextView.text != "" {
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.isEnabled = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.idField.text != "" && passwordField.text != "" && passwordField.text == passwordCheckField.text && self.bioTextView.text != "" {
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.isEnabled = false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        self.profileImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imagePickerTapped(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
