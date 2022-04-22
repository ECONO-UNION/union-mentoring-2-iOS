//
//  UIView+Extension.swift
//  PokemonProject
//
//  Created by seunghee on 2022/04/18.
//

import UIKit

extension UIView {
  func startRotate() {
    DispatchQueue.main.async {
      let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
      rotation.fromValue = 0
      rotation.toValue = NSNumber(value: M_PI * 2)
      rotation.duration = 2
      rotation.isCumulative = true
      rotation.repeatCount = FLT_MAX
      self.layer.add(rotation, forKey: "rotationAnimation")
    }
  }
  
  func stopRotate() {
    DispatchQueue.main.async {
      self.layer.removeAnimation(forKey: "rotationAnimation")
    }
  }
  
  func setCornerRadius(_ radius: CGFloat = 20.0) {
    self.layer.cornerRadius = radius
  }
  
  func setConstraintEqualTo(_ view: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      self.topAnchor.constraint(equalTo: view.topAnchor),
      self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
