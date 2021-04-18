//
//  ViewController.swift
//  tabbar
//
//  Created by Riccardo Cipolleschi on 17/04/21.
//

import UIKit

open class TabBar: UIViewController {

  var rootView: TabBarView {
    return self.view as! TabBarView
  }

  open var viewControllers: [UIViewController] = [] {
    didSet {
      self.updateVM()
    }
  }

  open var selectedTab: Int? = nil {
    didSet {
      guard
        selectedTab != oldValue,
        let selectedTab = selectedTab
      else {
        return
      }

      // remove old
      if let oldValue = oldValue {
        self.remove(self.viewControllers[oldValue])
      }

      // add new
      self.add(viewControllers[selectedTab])
      self.updateVM()
    }
  }

  open var tabbarHeight: CGFloat = 50 {
    didSet {
      self.updateVM()
    }
  }

  open var tabbarVisible: Bool = true {
    didSet {
      self.updateVM()
    }
  }

  open override func loadView() {
    self.view = TabBarView()
    self.updateVM()
  }

  open override func viewDidLoad() {
    super.viewDidLoad()

    self.updateVM()
    self.setupInteractions()
  }

  func setupInteractions() {
    self.rootView.userDidSelectTab = { [weak self] tab in
      self?.selectedTab = tab
    }
  }

  func updateVM() {
    self.rootView.viewModel = .init(
      tabs: self.viewControllers.compactMap(\.title),
      selectedTab: self.selectedTab ?? 0,
      tabbarHeight: self.tabbarHeight,
      isVisible: self.tabbarVisible
    )
  }

  func toggleTabbar() {
    self.tabbarVisible = !self.tabbarVisible
  }

}

// MARK: - View Containment API
extension TabBar {

  func add(_ child: UIViewController, frame: CGRect? = nil) {
    addChild(child)

    if let frame = frame {
      child.view.frame = frame
    }

    view.addSubview(child.view)
    view.sendSubviewToBack(child.view)
    child.didMove(toParent: self)
  }

  /// Remove a vc previously added from the children
  func remove(_ child: UIViewController) {
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}

