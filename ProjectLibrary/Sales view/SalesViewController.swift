//
//  SalesViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 7/02/22.
//

import UIKit
import SVProgressHUD

class SalesViewController: BaseViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var settingsTableVIew: UITableView!
    
    let nibBookDetail = String(describing: BookDetailViewController.self)
    let nibBookList = String(describing: ListBookTableViewCell.self)
    
    let viewModel = HomeViewModel(loader: BookLoader())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSettingsTableVIew()
        UIBackButton()
        titleLabel.text = Localized.tittleSales
        
        viewModel.didUpdateModels = { [weak self] in
            guard let self = self else { return }
            SVProgressHUD.dismiss()
            self.settingsTableVIew.reloadData()
        }
        viewModel.getBooksInformation()
        SVProgressHUD.show()
    }
    
    func configSettingsTableVIew() {
        settingsTableVIew.delegate = self
        settingsTableVIew.dataSource = self
        settingsTableVIew.register(UINib(nibName: nibBookList, bundle: nil),
                           forCellReuseIdentifier: nibBookList)
        settingsTableVIew.separatorStyle = .none
        settingsTableVIew.rowHeight = 170
    }
    
    func UIBackButton() {
        
        imgHeader.addSubview(backButton)
        backButton.backgroundColor = .clear
        
    }

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SalesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = BookDetailViewController(nibName: nibBookDetail, bundle: nil)
        controller.book = viewModel.filteredModels[indexPath.row]
        SVProgressHUD.show()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension SalesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibBookList, for: indexPath) as? ListBookTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.priceLabel.textColor = .red
        cell.config(book: viewModel.filteredModels[indexPath.row])
        return cell
    }
}
