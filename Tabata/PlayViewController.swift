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
    
    var number : Int = 0
    
    var timer: Timer?
    
    @IBOutlet var playLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer1) , userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func timer1(){
        if (time1[0] == 0 && number <= 4) {
            timer?.invalidate()
            number = number + 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer2) , userInfo: nil, repeats: true)
            nameLabel.text = "運動"
        } else {
            time1[0] -= 1
        }
        playLabel.text = String(time1[0])
    }
    
    @objc func timer2(){
        if (time2[0] == 0 && number <= 4) {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer3) , userInfo: nil, repeats: true)
            nameLabel.text = "休憩"
        } else {
            time2[0] -= 1
        }
        playLabel.text = String(time2[0])
    }
    
    @objc func timer3(){
        if (time3[0] == 0) {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer1) , userInfo: nil, repeats: true)
        } else if (number == 5) {
            playLabel.text = "終了"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let TimerViewController = self.storyboard?.instantiateViewController(withIdentifier: "first") as! TimerViewController
                self.present(TimerViewController, animated: true, completion: nil)
            }
        } else {
            time3[0] -= 1
        }
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
