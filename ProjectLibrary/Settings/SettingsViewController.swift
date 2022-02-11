//
//  SettingsViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 1/07/21.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    @IBOutlet weak var logOutButton: GeneralButton!
    @IBOutlet weak var backgroundView: GeneralView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLastNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var changeLanguajeLabel: UILabel!
    @IBOutlet weak var nameTittleLabel: UILabel!
    @IBOutlet weak var emailTittleLabel: UILabel!
    @IBOutlet weak var ageTittleLabel: UILabel!
    @IBOutlet weak var myProfileLabel: UILabel!
    @IBOutlet weak var changeLanguajeTextField: CustomTextField!
    
    let viewModel = SettingsViewModel()
    var isOn: Bool = false
    var isOntwo: Bool = false
    let imageAcceptOn = UIImage(named: "ic_myrentals active")
    let imageAcceptOff = UIImage(named: "ic_myrentals")
    
    var settingsPickerView = UIPickerView()
    var languajesArray: [String] = [Localized.spanish , Localized.english]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        cunfigUISettings()
        configSettingsPickerView()
        userNameLabel.text = viewModel.name
        userLastNameLabel.text = viewModel.lastName
        userEmailLabel.text = viewModel.email
        userAgeLabel.text = viewModel.age
    }
    
    func configSettingsPickerView() {
        changeLanguajeTextField.inputView = settingsPickerView
        settingsPickerView.delegate = self
        settingsPickerView.dataSource = self
    }

    func cunfigUISettings() {

        logOutButton.backgroundColor = Constants.Colors.blueColor
        titleLabel.text = Localized.settingsText
        nameTittleLabel.text = Localized.nameRegistre
        emailTittleLabel.text = Localized.email
        ageTittleLabel.text = Localized.age
        logOutButton.setTitle(Localized.logOut, for: .normal)
        changeLanguajeLabel.text = Localized.changeLanguaje
//        englishLanguajeLabel.text = Localized.english
//        spanishLanguajeLabel.text = Localized.spanish
        myProfileLabel.text = Localized.myProfile
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        let alertController = UIAlertController(title: nil,
                                                message: Localized.areYouSureYouWantLogOut,
                                                preferredStyle: .alert)
        let yes = UIAlertAction(title: Localized.yesSure,
                                style: .default) { (_) in
            self.showLoggedOutScreen()
        }
        alertController.addAction(yes)
        alertController.addAction(UIAlertAction(title: Localized.cancel, style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showLoggedOutScreen() {
        self.viewModel.logOut()
        self.tabBarController?.dismiss(animated: true)
    }
    
    func setBackButton(view: UIButton, imageOn: UIImage?, imageOff: UIImage?, onOffStatus: Bool) {
        onOffStatus ? view.setImage(imageOn, for: .normal) : view.setImage(imageOff, for: .normal)
    }
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languajesArray[row]
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languajesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        changeLanguajeTextField.text = languajesArray[row]
        changeLanguajeTextField.resignFirstResponder()
    }
}
