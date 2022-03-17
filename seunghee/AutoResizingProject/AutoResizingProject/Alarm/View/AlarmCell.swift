//
//  AlarmCell.swift
//  AutoResizingProject
//
//  Created by seungbong on 2022/03/17.
//

import UIKit

class AlarmCell: UITableViewCell {
  
  @IBOutlet weak var isAMLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var alarmSwitch: UISwitch!
  
  static let id = "AlarmCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func updateUI(alarm: Alarm) {
    isAMLabel.text = isAmStringFromDate(alarm.time)
    timeLabel.text = timeStringFromDate(alarm.time)
    descriptionLabel.text = alarm.description
    alarmSwitch.isOn = alarm.isOn
    
    updateLabelColor()
  }
  
  private func timeStringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:MM"
    return formatter.string(from: date)
  }
  
  private func isAmStringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "a"
    return formatter.string(from: date)
  }
  
  private func updateLabelColor() {
    let labels = [isAMLabel, timeLabel, descriptionLabel]
    let labelColor: UIColor = alarmSwitch.isOn ? .black : .gray
    
    for label in labels {
      label?.textColor = labelColor
    }
  }
  
  @IBAction func switchValueChanged(_ sender: Any) {
    updateLabelColor()
  }
}
