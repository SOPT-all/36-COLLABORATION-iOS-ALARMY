//
//  AlarmyTabBarController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

enum TabIndex: Int {
    case alarm
    case sleep
    case morning
    case report
    case setting
}

final class AlarmyTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        configureController()
        setupTabBarAppearance()
    }

    private func configureController() {
        let alarmViewController = tabBarNavigationController(
            unselectedImage: assetImage(name: "icon_gnb_clockoff"),
            selectedImage: assetImage(name: "icon_gnb_clockon"),
            rootViewController: AlarmViewController(),
            title: "알람"
        )

        let sleepViewController = placeholderTab(title: "수면", imageName: "icon_gnb_sleep")

        let morningViewController = tabBarNavigationController(
            unselectedImage: assetImage(name: "icon_gnb_morningoff"),
            selectedImage: assetImage(name: "icon_gnb_morningon"),
            rootViewController: MorningViewController(),
            title: "아침"
        )

        let reportViewController = placeholderTab(title: "리포트", imageName: "icon_gnb_report")

        let settingViewController = placeholderTab(title: "설정", imageName: "icon_gnb_setting")


        viewControllers = [alarmViewController, sleepViewController, morningViewController, reportViewController, settingViewController]
        tabBar.tintColor = .white
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.firstIndex(of: viewController),
              let tabIndex = TabIndex(rawValue: index) else { return true }

        let disabledTabs: [TabIndex] = [.sleep, .report, .setting]
        return !disabledTabs.contains(tabIndex)
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.appColor(.grey900)

        let itemAppearance = UITabBarItemAppearance()
        appearance.stackedLayoutAppearance = itemAppearance

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

    private func tabBarNavigationController(
        unselectedImage: UIImage,
        selectedImage: UIImage,
        rootViewController: UIViewController,
        title: String
    ) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        return navigation
    }
    
    private func placeholderTab(title: String, imageName: String) -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: assetImage(name: imageName),
            selectedImage: nil
        )
        return viewController
    }
    
    private func assetImage(name: String) -> UIImage {
        return UIImage(named: name)?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
}
