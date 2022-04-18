//
//  UIView+Extension.swift
//  PokemonProject
//
//  Created by seunghee on 2022/04/18.
//

import Foundation
import UIKit

extension UIView {
    func rotate() {
        DispatchQueue.main.async {
            let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = NSNumber(value: Double.pi * 2)
            rotation.duration = 1
            rotation.isCumulative = true
            rotation.repeatCount = Float.greatestFiniteMagnitude
            self.layer.add(rotation, forKey: "rotationAnimation")
        }
    }
}
