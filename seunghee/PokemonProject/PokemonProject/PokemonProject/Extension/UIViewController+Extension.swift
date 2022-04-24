//
//  UIViewController+Extension.swift
//  PokemonProject
//
//  Created by seungbong on 2022/04/23.
//

import UIKit

extension UIViewController {
  func showAlert(message: String) {
    DispatchQueue.main.async {
      let alert = UIAlertController(title: "안내",
                                    message: message,
                                    preferredStyle: .alert)
      self.present(alert, animated: true, completion: nil)
    }
  }
}
