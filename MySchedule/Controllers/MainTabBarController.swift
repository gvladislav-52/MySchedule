//
//  ViewController.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let scheduleViewController = createNavController(vc: ScheduleViewController(), itemName: "Schedule", ItemImage: "calendar.badge.clock")
        let tasksViewController = createNavController(vc: TasksViewController(), itemName: "Task", ItemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(vc: ContactsTableViewController(), itemName: "Contacts", ItemImage: "rectangle.stack.person.crop")
    
        viewControllers = [scheduleViewController, tasksViewController, contactsViewController]
    }
    
    private func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        
        let item =  UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        var navCotroller = UINavigationController(rootViewController: vc)
        navCotroller.tabBarItem = item
        setupNavUI(nav: &navCotroller)
        //setupTabUI(nav: &navCotroller)
        return navCotroller
    }
    
    private func setupNavUI(nav: inout UINavigationController) {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .darkGray
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//        nav.navigationBar.standardAppearance = appearance
//        nav.navigationBar.scrollEdgeAppearance = appearance
//        nav.navigationBar.tintColor = .white
        
        nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
        
    }
    
//    private func setupTabUI(nav: inout UINavigationController) {

//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .darkGray
//
//        let itemAppearance = UITabBarItemAppearance()
//        itemAppearance.normal.titleTextAttributes = [
//            .font: UIFont.systemFont(ofSize: 14),
//            .foregroundColor: UIColor.lightGray
//        ]
//        itemAppearance.selected.titleTextAttributes = [
//            .font: UIFont.systemFont(ofSize: 16),
//            .foregroundColor: UIColor.white
//        ]
//        itemAppearance.normal.iconColor = .lightGray
//        itemAppearance.selected.iconColor = .white
//
//        appearance.stackedLayoutAppearance = itemAppearance
//
//        tabBar.standardAppearance = appearance
//        tabBar.scrollEdgeAppearance = appearance
//    }
    
}

