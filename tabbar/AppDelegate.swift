//
//  AppDelegate.swift
//  tabbar
//
//  Created by Riccardo Cipolleschi on 17/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var tabbarVC: TabBar?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    self.window = UIWindow()
    let vc = TabBar()
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .systemRed
    vc1.title = "Red"
//    vc1.view.addSubview(self.toggleTabbarButton)

    let vc2 = UIViewController()
    vc2.view.backgroundColor = .systemGreen
    vc2.title = "Green"
//    vc2.view.addSubview(self.toggleTabbarButton)

    let vc3 = UIViewController()
    vc3.view.backgroundColor = .systemBlue
    vc3.title = "Blue"
//    vc3.view.addSubview(self.toggleTabbarButton)

    let vc4 = UIViewController()
    vc4.view.backgroundColor = .systemYellow
    vc4.title = "Yellow"
//    vc4.view.addSubview(self.toggleTabbarButton)

    vc.view.backgroundColor = .white
    vc.viewControllers = [vc1, vc2, vc3, vc4]
    vc.selectedTab = 0
    vc.tabbarHeight = 40

    self.tabbarVC = vc
    self.window?.rootViewController = vc
    self.window?.makeKeyAndVisible()
    return true
  }

  var toggleTabbarButton: UIButton {
    let button = UIButton(frame: .init(x: 60, y: 75, width: 200, height: 50))
    button.setTitle("Hide tabbar", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(self.toggleTabbar(_:)), for: .touchUpInside)
    return button
  }

  @objc func toggleTabbar(_ uiControl: UIControl) {
    self.tabbarVC?.toggleTabbar()
  }
}

