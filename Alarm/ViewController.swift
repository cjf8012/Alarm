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
            let myAlertController = UIAlertController(title: "알람", message: "설정된 시간이 되었습니다.", preferredStyle: .alert)
            
            //AlertAction 만들기
            let okAction = UIAlertAction(title: "확인", style: .default, handler: {(myAction:UIAlertAction) -> Void in self.view.backgroundColor = UIColor.blue
            })
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {(myAction:UIAlertAction) -> Void in self.view.backgroundColor = UIColor.white
            })
            
            let testAction = UIAlertAction(title: "테스트", style: .default, handler: nil)
            
            //AlertAction을 AlertController에 넣기
            myAlertController.addAction(okAction)
            myAlertController.addAction(cancelAction)
            myAlertController.addAction(testAction)
            
            //화면에 출력
            present(myAlertController, animated: true, completion: nil)
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

