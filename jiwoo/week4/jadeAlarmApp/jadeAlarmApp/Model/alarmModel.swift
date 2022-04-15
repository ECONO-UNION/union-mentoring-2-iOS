//
//  alarmModel.swift
//  jadeAlarmApp
//
//  Created by 황지우 on 2022/03/18.
//

import Foundation

class alarmModel {
    
    var hour : Int = 0
    var minute : Int = 0
    var isAM : Bool = true
    var message : String = ""
    var isON : Bool = false
    
    init(hour: Int, minute : Int, isAM : Bool, message : String, isON : Bool ){
        self.hour = hour
        self.minute = minute
        self.isAM = isAM
        self.message = message
        self.isON = isON
    }
}
