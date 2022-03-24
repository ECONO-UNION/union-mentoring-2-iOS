//
//  ViewController.swift
//  Alarm
//
//  Created by asong on 2022/03/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let data: [AlarmModel] = [AlarmModel(isAm: true, time: "2:00", isOn: true, content: "알람"), AlarmModel(isAm: true, time: "2:00", isOn: true, content: "알람"), AlarmModel(isAm: true, time: "3:50", isOn: true, content: "알람이다. 일어나~~~~~~~~~~~~~ 알람이다. 일어나~~~~~~~~~~~~~ 알람이다. 일어나~~~~~~~~~~~~~ 알람이다. 일어나~~~~~~~~~~~~~"), AlarmModel(isAm: false, time: "12:00", isOn: true, content: "알람~~~~~~~~~~~~"), AlarmModel(isAm: false, time: "8:23", isOn: false, content: "알람")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AlarmTableViewCell else{ return UITableViewCell() }
        cell.contentLabel.text = data[indexPath.row].content
        cell.timeLabel.text = data[indexPath.row].time
        cell.alarmSwitch.isOn = data[indexPath.row].isOn
        
        switch data[indexPath.row].isAm{
        case true:
            cell.isAmLabel.text = "오전"
        case false:
            cell.isAmLabel.text = "오후"
        }
        
        switch data[indexPath.row].isOn{
        case true:
            cell.isAmLabel.textColor = .white
            cell.contentLabel.textColor = .white
            cell.timeLabel.textColor = .white
        case false:
            cell.isAmLabel.textColor = .gray
            cell.contentLabel.textColor = .gray
            cell.timeLabel.textColor = .gray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let text = data[indexPath.row].content
        let height = CGFloat( 100 + (text.count)/30 * 10)
        return height
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "알람"
    }
}
