//
//  HomeBookViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 29/06/21.
//

import UIKit
import SVProgressHUD

class HomeBookViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var salesButton: GeneralButton!

    let nibBookDetail = String(describing: BookDetailViewController.self)
    let nibBookList = String(describing: ListBookTableViewCell.self)
    
    let viewModel = HomeViewModel(loader: BookLoader())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configTableView()
        searchBar.delegate = self
        viewModel.didUpdateModels = { [weak self] in
            guard let self = self else { return }
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
        viewModel.getBooksInformation()
        SVProgressHUD.show()
    }
    
    func configUI() {
        titleLabel.text = Localized.libraryText
        searchBar.searchTextField.placeholder = Localized.searchBook
        salesButton.setTitle(Localized.tittleSales, for: .normal)
    
    }
    
    fileprivate func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: nibBookList, bundle: nil),
                           forCellReuseIdentifier: nibBookList)
        tableView.separatorStyle = .none
        tableView.rowHeight = 150
    }
    
    @IBAction func salesButton(_ sender: Any) {
        let controller = SalesViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
    
}

extension HomeBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = BookDetailViewController(nibName: nibBookDetail, bundle: nil)
        controller.book = viewModel.filteredModels[indexPath.row]
        SVProgressHUD.show()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomeBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibBookList, for: indexPath) as? ListBookTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.priceLabel.isHidden = true
        cell.config(book: viewModel.filteredModels[indexPath.row])
        return cell
    }
}

extension HomeBookViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(using: searchText)
    }
}
