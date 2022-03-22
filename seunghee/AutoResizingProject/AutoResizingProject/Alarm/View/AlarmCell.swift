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
  
  @IBAction func switchValueChanged(_ sender: Any) {
    updateLabelColor()
  }
  
  /// 화면 UI를 업데이트 하는 함수
  /// - Parameter alarm: 화면에 그릴 alarm 객체
  func updateUI(alarm: Alarm) {
    isAMLabel.text = isAmStringFromDate(alarm.time)
    timeLabel.text = timeStringFromDate(alarm.time)
    descriptionLabel.text = alarm.description
    alarmSwitch.isOn = alarm.isOn
    
    updateLabelColor()
  }
  
  
  /// Date 객체로부터 시간(HH:MM) String을 반환하는 함수
  /// - Parameter date: Date 객체
  /// - Returns: 시간 String (HH:MM)
  private func timeStringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:MM"
    return formatter.string(from: date)
  }
  
  
  /// Date 객체로부터 오전 / 오후 String 을 반환하는 함수
  /// - Parameter date: Date 객체
  /// - Returns: 오전 / 오후 String 값
  private func isAmStringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "a"
    formatter.locale = .autoupdatingCurrent
    return formatter.string(from: date)
  }
  
  
  /// Switch 의 On/Off 상태에 따른 라벨 컬러 변경
  private func updateLabelColor() {
    let labels = [isAMLabel, timeLabel, descriptionLabel]
    let labelColor: UIColor = alarmSwitch.isOn ? .black : .gray
    
    for label in labels {
      label?.textColor = labelColor
    }
  }
}
