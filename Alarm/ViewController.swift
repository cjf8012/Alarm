//
//  ViewController.swift
//  Alarm
//
//  Created by D7703_15 on 2018. 4. 18..
//  Copyright © 2018년 D7703_15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var time: UILabel!
    var myTime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alarmTime.text = formatter.string(from: myDatePicker.date)
        
        myTime = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTime) in self.updateTime()})
    }
    
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        time.text = formatter.string(from: date)
        
        if time.text == alarmTime.text{
            view.backgroundColor = UIColor.yellow
        }
    }
    
    //날짜 선택
    @IBAction func DatePickerValueChanged(_ sender: Any) {
        //print("change Date Picker")
        //print(myDatePicker.date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alarmTime.text = formatter.string(from: myDatePicker.date)
    }
    
    //버튼 클릭시 배경화면이 흰색으로 바뀐다.
        @IBAction func selectTime(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
}

