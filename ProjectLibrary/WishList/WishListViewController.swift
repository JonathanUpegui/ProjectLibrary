//
//  WishListViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 1/07/21.
//

import UIKit

class WishListViewController: BaseViewController {
    
    @IBOutlet weak var wishListTableView: UITableView!
    
    var wishListViewModel: WishListViewModel = WishListViewModel(loader: BookLoader(),
                                                         coreDataManager: CoreDataManager())
    
    let nibDetailBook = String(describing: DetailBookTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Localized.wishListText
        
        configTableView()
        wishListViewModel.didUpdateModels = { [weak self] in
            DispatchQueue.main.async {
                self?.wishListTableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        wishListViewModel.getBooksInformation()
    }
    
    fileprivate func configTableView() {
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
        wishListTableView.register(UINib(nibName: nibDetailBook, bundle: nil),
                                   forCellReuseIdentifier: nibDetailBook)
        wishListTableView.rowHeight = 160
        wishListTableView.tableFooterView = UIView()
    }
}

extension WishListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishListViewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibDetailBook, for: indexPath) as? DetailBookTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.config(book: wishListViewModel.models[indexPath.row])
        return cell
    }   
}
