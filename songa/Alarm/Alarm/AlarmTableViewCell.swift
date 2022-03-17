//
//  AlarmTableViewCell.swift
//  Alarm
//
//  Created by asong on 2022/03/17.
//
import UIKit

class AlarmTableViewCell: UITableViewCell{
    @IBOutlet weak var isAmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    @IBAction func switchValueChanged(_ sender: Any) {
        switch alarmSwitch.isOn{
        case true:
            isAmLabel.textColor = .white
            timeLabel.textColor = .white
            contentLabel.textColor = .white
        case false:
            isAmLabel.textColor = .gray
            timeLabel.textColor = .gray
            contentLabel.textColor = .gray
        }
    }
}
