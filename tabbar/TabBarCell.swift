//
//  TabbarCell.swift
//  tabbar
//
//  Created by Riccardo Cipolleschi on 17/04/21.
//

import UIKit
struct TabBarCellVM: Equatable {
  let title: String
  let isSelected: Bool
}

class TabBarCell: UICollectionViewCell {
  static let reuseIdentifier: String = "\(TabBarCell.self)"

  var viewModel: TabBarCellVM? {
    didSet {
      self.update(old: oldValue)
    }
  }

  private let titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
    self.style()
  }

  required init?(coder: NSCoder) {
    fatalError("Not implemented")
  }

  func setup() {
    self.addSubview(self.titleLabel)
  }

  func style() {
    self.backgroundColor = .clear
    self.titleLabel.textAlignment = .center
    self.titleLabel.numberOfLines = 0
  }

  func update(old: TabBarCellVM?) {
    guard
      let model = self.viewModel
    else { return }
    self.titleLabel.text = model.title
    self.titleLabel.textColor = model.isSelected ? UIColor.white : UIColor.systemGray
    self.setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    self.titleLabel.frame = .zero
    self.titleLabel.sizeToFit()
    let titleSize = self.titleLabel.frame.size

    self.titleLabel.frame = .init(
      x: (self.bounds.width - titleSize.width) / 2,
      y: 10,
      width: titleSize.width,
      height: titleSize.height
    )

  }

}
