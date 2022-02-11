//
//  ForgotPasswordViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 26/01/22.
//

import Foundation
import UIKit

class ForgotPasswordViewController: BaseViewController {

    let infoLabel = UILabel()
    let emailTextField = UITextField()
    let sendButton = ButtonCustom()
    let labelErrorInEmailTextField = UILabel()
    let bottomLine = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Localized.titleForgotpassword
       
        configInfoLabel()
        configEmailTextField()
        configSendButton()
        createBackButton()
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
    
    func configInfoLabel() {
        view.addSubview(infoLabel)
        infoLabel.text = Localized.infoForgotPassword
        infoLabel.numberOfLines = 10
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 20)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: imgHeader.bottomAnchor, constant: 120),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            infoLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func configEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.backgroundColor = UIColor(red: 220/255, green: 242/255, blue: 248/255, alpha: 1)
        emailTextField.delegate = self
        emailTextField.underlined()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 60),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
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
            labelErrorInEmailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configSendButton() {
        view.addSubview(sendButton)
        sendButton.setTitle(Localized.send, for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 60),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        sendButton.addTarget(self, action: #selector(sendActionButton), for: .touchUpInside)
    }
    
    @objc func sendActionButton() {
//        call func and texfield check email
        let libraryViewController = HomeBookViewController()
        let navigationView = UINavigationController(rootViewController: libraryViewController)
        present(navigationView, animated: true)
    
    }
    
//    this function verifies that the email is written well
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)

    }
}

// make alert in the textField when finish to writhe
extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == emailTextField {
            let isValidEmail = isValidEmail(emailTextField.text ?? " ")
            labelErrorInEmailTextField.isHidden = isValidEmail
        }
    }
}
