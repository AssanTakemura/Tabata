//
//  PlayViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/05.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    //準備
    var time1: [Int] = [20]
    //運動
    var time2: [Int] = [21]
    //休憩
    var time3: [Int] = [11]
    
    var timer: Timer?
    
    @IBOutlet var playLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer1) , userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func timer1(){
        if (time1[0] == 0) {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer2) , userInfo: nil, repeats: true)
        } else {
            time1[0] -= 1
        }
        playLabel.text = String(time1[0])
    }
    
    @objc func timer2(){
        if (time2[0] == 0) {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer3) , userInfo: nil, repeats: true)
        } else {
            time2[0] -= 1
        }
        playLabel.text = String(time2[0])
    }
    
    @objc func timer3(){
        if (time3[0] == 0) {
            playLabel.text = "終了"
        } else {
            time3[0] -= 1
        }
        playLabel.text = String(time3[0])
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
