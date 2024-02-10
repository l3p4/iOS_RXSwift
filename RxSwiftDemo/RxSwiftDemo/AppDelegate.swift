//
//  AppDelegate.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/1/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = nil


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        
        configScrollViewAdjustSafeArea()
        
        return true
    }
    
    
    func setupWindow(){
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let VC = FoodListVC()
        let navC = UINavigationController(rootViewController: VC)
        window.rootViewController = navC
        self.window?.makeKeyAndVisible()
        
    }

    func configScrollViewAdjustSafeArea(){
        // 设置全局的 contentInsetAdjustmentBehavior
           if #available(iOS 11.0, *) {
               UIScrollView.appearance().contentInsetAdjustmentBehavior = .automatic
           }
    }

}

