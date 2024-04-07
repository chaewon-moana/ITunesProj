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
        
        let image1 = UIImage(systemName: "book")
        let image2 = UIImage(systemName: "gamecontroller")
        let image3 = UIImage(systemName: "rectangle.stack.fill")
        let image4 = UIImage(systemName: "star")
        let image5 = UIImage(systemName: "magnifyingglass")
        
        vc1.tabBarItem = UITabBarItem(title: "투데이", image: image1, tag:1)
        vc2.tabBarItem = UITabBarItem(title: "게임", image: image2, tag:2)
        vc3.tabBarItem = UITabBarItem(title: "앱", image: image3, tag:3)
        vc4.tabBarItem = UITabBarItem(title: "아케이드", image: image4, tag:4)
        vc5.tabBarItem = UITabBarItem(title: "검색", image: image5, tag:5)
        
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
