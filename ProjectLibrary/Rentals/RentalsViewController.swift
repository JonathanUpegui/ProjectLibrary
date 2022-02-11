//
//  RentalsViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 1/07/21.
//

import UIKit

class RentalsViewController: BaseViewController {

    @IBOutlet weak var rentalsTableView: UITableView!
    
    var rentalsViewModel: RentalsViewModel = RentalsViewModel(loader: BookLoader(),
                                                         coreDataManager: CoreDataManager())
    
    let nibDetailBook = String(describing: DetailBookTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Localized.rentalsText
        configTableView()
        rentalsViewModel.didUpdateModels = { [weak self] in
            self?.rentalsTableView.reloadData()
        }
    }
    
    fileprivate func configTableView() {
        rentalsTableView.delegate = self
        rentalsTableView.dataSource = self
        rentalsTableView.register(UINib(nibName: nibDetailBook, bundle: nil), forCellReuseIdentifier: nibDetailBook)
        rentalsTableView.rowHeight = 160
        rentalsTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        rentalsViewModel.getBooksInformation()
    }
}

extension RentalsViewController: UITableViewDelegate {
    
}

extension RentalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rentalsViewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibDetailBook, for: indexPath) as? DetailBookTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.config(book: rentalsViewModel.models[indexPath.row])
        return cell
    }
}
