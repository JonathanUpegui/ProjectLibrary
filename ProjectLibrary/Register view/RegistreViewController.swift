//
//  RegistreViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 26/01/22.
//

import Foundation

import UIKit

class RegistreViewController: BaseViewController {
    
    let informationLabel = UILabel()
    let nameTextField = UITextField()
    let lastNameTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let emailTextField = UITextField()
    let phoneTextField = UITextField()
    let addressTextField = UITextField()
    let sendButton = ButtonCustom()
    let birthDateTexfield = UITextField()
    let datePicker = UIDatePicker()
    let labelErrorInEmailTextField = UILabel()
    let bottomLine = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Localized.titleRegister
       
        configInformationLabel()
        configNameTextField()
        configLastNameTextField()
        configPasswordTextField()
        configConfirmPasswordTextField()
        configEmailTextField()
        configPhoneTextField()
        configAddressTextField()
        configSendButton()
        createBackButton()
        
        configBirthDateTexfield()
        configDatePicker()
        configErrorAlertInEmailTextField()
        
    }
    
    //        dismiss the date picker whit touch any part of the screem
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

//    navigation whit icon but not insert icon how a button
    func createBackButton() {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        
        view.addSubview(button)
        button.frame = CGRect(x: 10, y: 50, width: 50, height: 50)
        
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func configInformationLabel() {
        view.addSubview(informationLabel)
        informationLabel.text = Localized.informationRegistreLabel
        informationLabel.numberOfLines = 0
        informationLabel.textAlignment = .center
        informationLabel.textColor = .black
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: imgHeader.bottomAnchor, constant: 50),
            informationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            informationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            informationLabel.heightAnchor.constraint(equalToConstant: 150)
//            informationLabel.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }
    
    func configNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.placeholder = Localized.nameRegistre
//        Call the underline
        nameTextField.underlined()
//      nameTextField.becomeFirstResponder()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configLastNameTextField() {
        view.addSubview(lastNameTextField)
        lastNameTextField.placeholder = Localized.LastNameRegistre
        lastNameTextField.underlined()
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.placeholder = Localized.password
        passwordTextField.underlined()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.isSecureTextEntry = false
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configConfirmPasswordTextField() {
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.placeholder = Localized.confirmPassword
        confirmPasswordTextField.underlined()
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        confirmPasswordTextField.isSecureTextEntry = false
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    func configEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.placeholder = Localized.email
        emailTextField.delegate = self
        emailTextField.underlined()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    
    }
    
    func configErrorAlertInEmailTextField() {
//        add alert to EmailTextField
        view.addSubview(labelErrorInEmailTextField)
        labelErrorInEmailTextField.text = Localized.errorInEmailTextField
        labelErrorInEmailTextField.textColor = .red
//      A Boolean value that determines whether the view is hidden.
        labelErrorInEmailTextField.isHidden = true
        labelErrorInEmailTextField.font = .systemFont(ofSize: 15)
        labelErrorInEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelErrorInEmailTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -1),
            labelErrorInEmailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            labelErrorInEmailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            labelErrorInEmailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])

    }
    
    func configPhoneTextField() {
        view.addSubview(phoneTextField)
        phoneTextField.placeholder = Localized.phone
        phoneTextField.underlined()
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            phoneTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configAddressTextField() {
        view.addSubview(addressTextField)
        addressTextField.placeholder = Localized.address
        addressTextField.underlined()
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            addressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            addressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            addressTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configBirthDateTexfield() {
        view.addSubview(birthDateTexfield)
        birthDateTexfield.placeholder = Localized.birthDate
        birthDateTexfield.underlined()
        birthDateTexfield.translatesAutoresizingMaskIntoConstraints = false
        //      add content of date picker in this text field
        birthDateTexfield.inputView = datePicker
        NSLayoutConstraint.activate([
            birthDateTexfield.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20),
            birthDateTexfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            birthDateTexfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            birthDateTexfield.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configDatePicker() {
//        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
//      changes the physical appearance of the picker date
        datePicker.preferredDatePickerStyle = .inline
        // Add action to data pickers
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged), for: .valueChanged)
        
    }
        
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        // Create date formatter
        let dateFormatter = DateFormatter()
        // Set date format and style
        dateFormatter.dateFormat = "dd/MMMM/yyyy"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        // Apply date format
        self.birthDateTexfield.text = dateFormatter.string(from: sender.date)
    }
    
    func configSendButton() {
        view.addSubview(sendButton)
        sendButton.setTitle(Localized.send, for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        sendButton.addTarget(self, action: #selector(sendActionButton), for: .touchUpInside)
    }
    
    @objc func sendActionButton() {
//        call func and texfield check email
        let isValidEmail = isValidEmail(emailTextField.text ?? " ")
        labelErrorInEmailTextField.isHidden = isValidEmail

    }
    
//    this function verifies that the email is written well
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)

    }

}
// make alert in the textField when finish to writhe
extension RegistreViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == emailTextField {
            let isValidEmail = isValidEmail(emailTextField.text ?? " ")
            labelErrorInEmailTextField.isHidden = isValidEmail
        }
        
    }
}
