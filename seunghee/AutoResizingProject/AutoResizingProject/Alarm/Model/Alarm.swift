//
//  Alarm.swift
//  AutoResizingProject
//
//  Created by seungbong on 2022/03/17.
//

import Foundation

class Alarm {
  var time: Date
  var description: String
  var isOn: Bool
  
  init(time: Date, description: String = "알람", isOn: Bool = false) {
    self.time = time
    self.description = description
    self.isOn = isOn
  }
}
