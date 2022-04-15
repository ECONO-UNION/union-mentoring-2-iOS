//
//  alarmVC.swift
//  jadeAlarmApp
//
//  Created by 황지우 on 2022/03/18.
//

import UIKit

class alarmVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var alarmInformationList : [alarmModel] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        addAlarmInformationList(_:alarmModel(hour: 12, minute: 30, isAM: true, message: "냥냥냐오오오옹오오옹오옹오오옹오옹오옹오옹오옹오옹오오옹오오옹오오오오오오오오오오오오오오오오assdfjdjfiowfiegjfiejgwjgjgwlejfijfiejfowjfejfwifjoejfwejfewjfwjefjweofjeiwjfwejfowej", isON: true))
        addAlarmInformationList(_:alarmModel(hour: 11, minute: 20, isAM: false, message: "쿠쿠룽", isON: false))
        addAlarmInformationList(_:alarmModel(hour: 10, minute: 50, isAM: true, message: "아직도 안 일어나면 안돼", isON: false))

        // Do any additional setup after loading the view.
    }
    
    // 새로운 알람 정보를 추가하는 함수
    func addAlarmInformationList (_ newInformation : alarmModel){
        
        alarmInformationList.append(newInformation)
        
    }
    
// UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return alarmInformationList.count
        //return alarmInformationList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Listcell else {return UITableViewCell()}
        cell.onOffSwitch.setOn(false, animated: true)
        
        //isMorningLabel Setting
        if alarmInformationList[indexPath.row].isAM == true {
            cell.isMorningLabel.text = "오전"
        } else {cell.isMorningLabel.text = "오후"}
        
        //onOffSwitch Setting + 스위치에 따른 글자색 전환
        if alarmInformationList[indexPath.row].isON == true {
            cell.onOffSwitch.setOn(true, animated: true)
            cell.isMorningLabel.textColor = UIColor.black
            cell.hourLabel.textColor = UIColor.black
            cell.minuteLabel.textColor = UIColor.black
            cell.messageLabel.textColor = UIColor.black
            cell.seperatorLabel.textColor = UIColor.black
        }
        else {
            cell.onOffSwitch.setOn(false, animated: true)
            cell.isMorningLabel.textColor = UIColor.lightGray
            cell.hourLabel.textColor = UIColor.lightGray
            cell.minuteLabel.textColor = UIColor.lightGray
            cell.messageLabel.textColor = UIColor.lightGray
            cell.seperatorLabel.textColor = UIColor.lightGray
        }
        
        // 기타 정보 Setting
        cell.hourLabel.text = "\(alarmInformationList[indexPath.row].hour)"
        cell.minuteLabel.text = "\(alarmInformationList[indexPath.row].minute)"
        cell.messageLabel.text = alarmInformationList[indexPath.row].message
        cell.messageLabel.sizeToFit()
        
        // 스위치 이벤트 구현
        
        if cell.onOffSwitch.isOn {
            cell.isMorningLabel.textColor = UIColor.black
            cell.hourLabel.textColor = UIColor.black
            cell.minuteLabel.textColor = UIColor.black
            cell.messageLabel.textColor = UIColor.black
            cell.seperatorLabel.textColor = UIColor.black
        }
        else{
            cell.isMorningLabel.textColor = UIColor.lightGray
            cell.hourLabel.textColor = UIColor.lightGray
            cell.minuteLabel.textColor = UIColor.lightGray
            cell.messageLabel.textColor = UIColor.lightGray
            cell.seperatorLabel.textColor = UIColor.lightGray
        }
        return cell
    }
    
// tableview header
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "지우의 알람 앱"
    }

// tableview 각 셀의 높이를 컨텐츠에 맞춰 조정되게 해주기
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return UITableView.automaticDimension
    }

    
}

class Listcell : UITableViewCell {
    
    @IBOutlet weak var isMorningLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var seperatorLabel: UILabel!
    
}
