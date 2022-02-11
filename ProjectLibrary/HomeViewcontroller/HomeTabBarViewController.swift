//
//  HomeTabBarViewController.swift
//  ProjectLibrary
//
//  Created by Upegui on 2/07/21.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {
    @IBOutlet weak var navigationTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
        
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//            if item.tag == 1 {
//                item.title = "pepo"
//
//            }
//            if item.tag == 2 {
//                item.title = "tigre"
//            }
//           
//    }
//    func  config() {
        
//        let settings = UINavigationController(rootViewController: SettingsViewController())
//                        navigationTabBar?(to: settings,
//                                        title: Localized.libraryText,
//                                         tag: 3)
//
//
//    }
}
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        let home = UINavigationController(rootViewController: LibraryViewController())
    //        setTabBar(to: home,
    //                  title: Localized.libraryText,
    //                  image: UIImage.library,
    //                  tag: 0)
    //
    //        let wishList = UINavigationController(rootViewController: WishListViewController())
    //        setTabBar(to: wishList,
    //                  title: Localized.wishListText,
    //                  image: UIImage.wishList,
    //                  tag: 1)
    //
    //        let addNew = UINavigationController(rootViewController: AddNewViewController())
    //        setTabBar(to: addNew,
    //                  title: Localized.addNewText,
    //                  image: UIImage.addNew,
    //                  tag: 2)
    //
    //        let rentals = UINavigationController(rootViewController: RentalsViewController())
    //        setTabBar(to: rentals,
    //                  title: Localized.rentalsText,
    //                  image: UIImage.rentals,
    //                  tag: 3)
    //
    //        let settings = UINavigationController(rootViewController: SettingsViewController())
    //        setTabBar(to: settings,
    //                  title: Localized.settingsText,
    //                  image: UIImage.settings,
    //                  tag: 4)
    //
    //        viewControllers = [home, wishList, addNew, rentals, settings]
    //    }
    //
    //    private func setTabBar(to controller: UIViewController,
    //                           title: String,
    //                           image: UIImage?,
    //                           tag: Int) {
    //        controller.tabBarItem = UITabBarItem()
    //        controller.tabBarItem.title = title
    //        controller.tabBarItem.image = image
    //        controller.tabBarItem.tag = tag
    //    }
//}
