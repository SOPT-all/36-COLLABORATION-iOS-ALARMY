//
//  AlarmyTabBarController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

class AlarmyTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        configureController()
        setupTabBarAppearance()
    }

    func configureController() {
        let alarmViewController = tabBarNavigationController(
            unselectedImage: symbolImage(name: "icon_gnb_clockoff"),
            selectedImage: symbolImage(name: "icon_gnb_clockon"),
            rootViewController: AlarmViewController(),
            title: "알람"
        )

        let sleepViewController = UIViewController()
        sleepViewController.tabBarItem = UITabBarItem(
            title: "수면",
            image: symbolImage(name: "icon_gnb_sleep"),
            selectedImage: nil
        )

        let morningViewController = tabBarNavigationController(
            unselectedImage: symbolImage(name: "icon_gnb_morningoff"),
            selectedImage: symbolImage(name: "icon_gnb_morningon"),
            rootViewController: MorningViewController(),
            title: "아침"
        )

        let reportViewController = UIViewController()
        reportViewController.tabBarItem = UITabBarItem(
            title: "리포트",
            image: symbolImage(name: "icon_gnb_report"),
            selectedImage: nil
        )

        let settingViewController = UIViewController()
        settingViewController.tabBarItem = UITabBarItem(
            title: "설정",
            image: symbolImage(name: "person.circle"),
            selectedImage: nil
        )

        viewControllers = [alarmViewController, sleepViewController, morningViewController, reportViewController, settingViewController]
        tabBar.tintColor = .white
    }

    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // TODO: - 아래 주석 코드로 변경 예정
        appearance.backgroundColor = UIColor.gray
//        appearance.backgroundColor = UIColor.appColor(.grey900)

        let itemAppearance = UITabBarItemAppearance()
        
        // TODO: - Pretendard로 변경 예정
        let font = UIFont.systemFont(ofSize: 10, weight: .regular)

        appearance.stackedLayoutAppearance = itemAppearance
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

    func tabBarNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController, title: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        return navigation
    }
    
    func symbolImage(name: String) -> UIImage {
        return UIImage(systemName: name)?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.firstIndex(of: viewController) else { return true }

        let disabledTabs = [1, 3, 4]

        return !disabledTabs.contains(index)
    }
}
