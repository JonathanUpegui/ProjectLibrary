//
//  LoginViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 28/06/21.
//

import UIKit
import SVProgressHUD

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var navegationBarImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var backgroundView: GeneralView!
    @IBOutlet weak var subtitleTextLabel: UILabel!
    @IBOutlet weak var lastNameTextField: GeneralTextfield!
    @IBOutlet weak var nameTextField: GeneralTextfield!
    @IBOutlet weak var emailTextField: GeneralTextfield!
    @IBOutlet weak var signInButton: GeneralButton!
    @IBOutlet weak var ageTextField: CustomTextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var acceptPoliticalButton: UIButton!
    @IBOutlet weak var acceptTermsButton: UIButton!
    @IBOutlet weak var formStack: UIStackView!
    @IBOutlet weak var stackTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var registerButton: GeneralButton!
    @IBOutlet weak var acceptPoliticalLabel: UILabel!
    @IBOutlet weak var acceptTermsLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    let helloLabel = UILabel()
    let imgWbooksName = UIImageView()
    
    var isOn: Bool = false
    var isOntwo: Bool = false
    let imageAcceptOn = UIImage(named: "ic_myrentals active")
    let imageAcceptOff = UIImage(named: "ic_myrentals")
    
    var ageArray: [String] = []
    var pickerView = UIPickerView()
    
    var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        configUI()
        configPickerView()
        self.formStack.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.formStack.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserSession.shared.isLoggedIn() {
            loadHome()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func configPickerView() {
        fillAges()
        ageTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func configUI() {
        ageTextField.layer.cornerRadius = 16
        signInButton.backgroundColor = Constants.Colors.blueColor
        subtitleTextLabel.text = Localized.subtitleText
        lastNameTextField.placeholder = Localized.LastNameRegistre
        nameTextField.placeholder = Localized.nameRegistre
        emailTextField.placeholder = Localized.email
        signInButton.setTitle(Localized.signInText, for: .normal)
        forgotPasswordButton.setTitle(Localized.forgotPassword, for: .normal)
        registerButton.setTitle(Localized.registerButton, for: .normal)
        ageLabel.text = Localized.pleaseSelectYourAge
        acceptPoliticalLabel.text = Localized.acceptPoliticalTreatmenData
        acceptTermsLabel.text = Localized.acceptTermsConditions
        configLogoWbooks()
        configHelloLabel()
    }
    
    func configLogoWbooks() {
        imgHeader.addSubview(imgWbooksName)
        imgWbooksName.image = UIImage(named: "Group")
        imgWbooksName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgWbooksName.topAnchor.constraint(equalTo: imgHeader.topAnchor, constant: 40),
            imgWbooksName.trailingAnchor.constraint(equalTo: imgHeader.trailingAnchor, constant: -60),
            imgWbooksName.heightAnchor.constraint(equalToConstant: 70),
            //  width but this define value determinate and constant
            imgWbooksName.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func configHelloLabel() {
        view.addSubview(helloLabel)
//        aggre text to label    and   use of localizables to make automatic language translations
        helloLabel.text = Localized.titleText
        //        aligment txt of label to diferent posibylities
        helloLabel.textAlignment = .center
//     color  in text
        helloLabel.textColor = .black
        helloLabel.font = UIFont.boldSystemFont(ofSize: 25)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: imgHeader.bottomAnchor, constant: 30),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            helloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            helloLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func fillAges() {
        for item in 8...100 {
            ageArray.append("\(item)")
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        defer {
            SVProgressHUD.dismiss()
        }
        
        SVProgressHUD.show()
        let areNamesValid = viewModel.isValidName(textName: nameTextField.text ?? "") &&
            viewModel.isValidName(textName: lastNameTextField.text ?? "")
        if !areNamesValid {
            showError(msg: Localized.pleaseEnterPersonalData)
            return
        }
        
        let isValidName = viewModel.isValidEmail(emailTextField.text ?? "")
        if !isValidName {
            showError(msg: Localized.pleaseEnterYourEmailAddress)
            return
        }
        
        if !isOn {
            showError(msg: Localized.PleaseAcceptPoliticalTreatmentData)
            return
            
        }
        
        if !isOntwo {
            showError(msg: Localized.pleaseAcceptTermsConditions)
            return
        }
        
        if let age = ageTextField.text, age.isEmpty {
            showError(msg: Localized.pleaseSelectYourAge)
            return
        }
        setUser()
        loadHome()
    }
    
    private func setUser() {
        let user = User(name: nameTextField.text ?? "",
                        lastName: lastNameTextField.text ?? "",
                        email: emailTextField.text ?? "",
                        age: ageTextField.text ?? "")
        UserSession.shared.login(with: user)
    }
    
    func showError(msg: String) {
        
        let alertController = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Localized.cancel, style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    func loadHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeTabBar")
        present(viewController, animated: true, completion: nil)
    }
 
    @IBAction func acceptDataButton(_ sender: Any) {
        isOn.toggle()
        setBackButton(view: acceptPoliticalButton,
                      imageOn: imageAcceptOn,
                      imageOff: imageAcceptOff, onOffStatus: isOn)
    }
    
    @IBAction func acceptTermsButton(_ sender: Any) {
        isOntwo.toggle()
        setBackButton(view: acceptTermsButton,
                      imageOn: imageAcceptOn,
                      imageOff: imageAcceptOff, onOffStatus: isOntwo)
    }
    
    func setBackButton(view: UIButton, imageOn: UIImage?, imageOff: UIImage?, onOffStatus: Bool) {
        onOffStatus ? view.setImage(imageOn, for: .normal) : view.setImage(imageOff, for: .normal)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        let controller =  ForgotPasswordViewController()
                navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let controller = RegistreViewController()
                navigationController?.pushViewController(controller, animated: true)
    }

}

extension LoginViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageArray[row]
    }
}

extension LoginViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTextField.text = ageArray[row]
        ageTextField.resignFirstResponder()
    }
}
