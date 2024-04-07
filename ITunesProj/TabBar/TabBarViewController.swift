//
//  TabBarViewController.swift
//  ITunesProj
//
//  Created by cho on 4/7/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = TodayViewController()
        let vc2 = GameViewController()
        let vc3 = AppViewController()
        let vc4 = ArcadeViewController()
        let vc5 = SearchViewController()
        
//        let image1 = UIImage(named: "tab_trend_inactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage1 = UIImage(named: "tab_trend")?.withRenderingMode(.alwaysOriginal)
//        let image2 = UIImage(named: "tab_search_inactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage2 = UIImage(named: "tab_search")?.withRenderingMode(.alwaysOriginal)
//        let image3 = UIImage(named: "tab_portfolio_inactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage3 = UIImage(named: "tab_portfolio")?.withRenderingMode(.alwaysOriginal)
//        let image4 = UIImage(named: "tab_user_inactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage4 = UIImage(named: "tab_user")?.withRenderingMode(.alwaysOriginal)
        
        let image1 = UIImage(systemName: "book")
        let image2 = UIImage(systemName: "gamecontroller")
        let image3 = UIImage(systemName: "rectangle.stack.fill")
        let image4 = UIImage(systemName: "star")
        let image5 = UIImage(systemName: "magnifyingglass")
        
        vc1.tabBarItem = UITabBarItem(title: nil, image: image1, tag:1)
        vc2.tabBarItem = UITabBarItem(title: nil, image: image2, tag:2)
        vc3.tabBarItem = UITabBarItem(title: nil, image: image3, tag:3)
        vc4.tabBarItem = UITabBarItem(title: nil, image: image4, tag:4)
        vc5.tabBarItem = UITabBarItem(title: nil, image: image5, tag:5)
        
//        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
//        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
//        vc3.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
//        vc4.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue

        setViewControllers([nav5, nav1, nav2, nav3, nav4], animated: true)
        
    }
 }
