//
//  AddNewViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 1/07/21.
//

import UIKit
import Alamofire

class AddNewViewController: BaseViewController {
    @IBOutlet weak var contentView: CustomView!
    @IBOutlet weak var submitButton: CustomGradientButton!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var bookNameTextfield: CustomTextfieldInfoBook!
    @IBOutlet weak var authorTextfield: CustomTextfieldInfoBook!
    @IBOutlet weak var yearBookTextfield: CustomTextfieldInfoBook!
    @IBOutlet weak var topicBookTextfield: CustomTextfieldInfoBook!
    @IBOutlet weak var descriptionBookTextfield: CustomTextfieldInfoBook!
    
    private var textFields: [CustomTextfieldInfoBook] = []
    
    init() {
        super.init(nibName: "AddNewViewController", bundle: nil)
    }
    
    required init?(coder aDecoder:  NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configTextfields()
        
        textFields = [bookNameTextfield,
                      authorTextfield,
                      yearBookTextfield,
                      topicBookTextfield,
                      descriptionBookTextfield]
        textFields.forEach { $0.delegate = self }
    }
    
    private func configUI() {
        titleLabel.text = Localized.addNewText
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .polar
        titleLabel.text = Localized.addNewBookText.uppercased()
        titleLabel.font = UIFont.titleFont
        cameraImage.backgroundColor = .polar
        cameraButton.tintColor = .white
        submitButton.setTitle(Localized.submitButton.uppercased(), for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont.subTitle
    }
    
    private func configTextfields() {
        bookNameTextfield.placeholder = Localized.bookName
        authorTextfield.placeholder = Localized.authorBook
        yearBookTextfield.placeholder = Localized.yearBook
        topicBookTextfield.placeholder = Localized.topicBook
        descriptionBookTextfield.placeholder = Localized.descriptionBook
        
        textFields.forEach { $0.font = .subTitle }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        prensentAlert()
    }
    @IBAction func submintButtonAddNew(_ sender: Any) {
        let allAreValid = textFields.filter({ !$0.isValid }).isEmpty
        
        if allAreValid {
            self.presentAlert(title: Localized.titleAddNewBookAlert.uppercased(),
                              message: Localized.successfulAddNewBookAlert)
        } else {
            self.presentAlert(title: Localized.titleAddNewBookAlert.uppercased(),
                              message: Localized.errorAddNewBookAlert)
        }
    }
    
    private func prensentAlert() {
        let alertController = UIAlertController(title: .none,
                                                message: .none,
                                                preferredStyle: .actionSheet)
        
        let chooseAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            self.presentGallery()
        }
        
        let chooseActionCamera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.presentCamera()
        }
        
        alertController.addAction(chooseAction)
        alertController.addAction(chooseActionCamera)
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    private func presentGallery() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
}

extension AddNewViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            cameraImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddNewViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFields.forEach {
            if $0 == textField {
                $0.isValid ? $0.hideError() : $0.showError()
            }
        }
    }
    
    func presentAlert(title: String,
                      message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Localized.accept,
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
