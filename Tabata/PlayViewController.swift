//
//  PlayViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/05.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var time: [Int] = [6,30]
    
    @IBOutlet var playLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playLabel.text = String(time[0]) + ":" + String(time[1])
        Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer) , userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func timer(){
        if (time[0] == 0 && time[1] == 0) {
            playLabel.text = "終了"
        } else {
            if time[1] > 0 {
                //秒数が0以上の時秒数を-1
                time[1] -= 1
            } else {
                //秒数が0の時
                time[1] += 59
                if time[0] > 0 {
                    //分が0以上の時、分を-1
                    time[0] -= 1
                }
            }
            playLabel.text = String(time[0]) + ":" + String(time[1])
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
