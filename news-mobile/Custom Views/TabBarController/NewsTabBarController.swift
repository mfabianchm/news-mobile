//
//  NewsTabBarController.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class NewsTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemPurple
        viewControllers = [createHomeNavigationController(), createSearchNavigationController()]
    }
    
    
    func createHomeNavigationController() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "News"
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        return UINavigationController(rootViewController: searchVC)
    }
    

}
