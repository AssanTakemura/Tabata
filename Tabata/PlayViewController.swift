//
//  PlayViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/05.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit
import AVFoundation


class PlayViewController: UIViewController {
    
    //準備
    var time1: [Int] = [21]
    //運動
    var time2: [Int] = [21]
    //休憩
    var time3: [Int] = [11]
    
    var number : Int = 1
    
    var timer: Timer?
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var playLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numLabel: UILabel!
    @IBOutlet var bgimageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer1) , userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func timer1(){
        if (time1[0] == 0 && number <= 4) {
            timer?.invalidate()
            nameLabel.text = "🔥運動🔥"
            bgimageView.image = UIImage(named: "paper03")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer2) , userInfo: nil, repeats: true)
        } else {
            time1[0] -= 1
        }
        playLabel.text = String(time1[0])
    }
    
    @objc func timer2(){
        
        numLabel.text = String(number)+"回"
        
        if (time2[0] == 0 && number <= 4) {
            timer?.invalidate()
            number = number + 1
            time3 = [11]
            nameLabel.text = "😪休憩😪"
            bgimageView.image = UIImage(named: "paper06")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer3) , userInfo: nil, repeats: true)
        } else {
            time2[0] -= 1
        }
        
        playLabel.text = String(time2[0])
        
        if (time2[0] <= 3){
            playLabel.textColor = UIColor.red
        } else {
            playLabel.textColor = UIColor.black
        }
    }
    
    @objc func timer3(){
        if (time3[0] == 0 && number == 5) {
            nameLabel.text = ""
            playLabel.text = "🙆‍終了🙆‍"
            bgimageView.image = UIImage(named: "paper07")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.timer?.invalidate()
                self.performSegue(withIdentifier: "tosecond",sender: nil)
                
            }
        }else if (time3[0] == 0) {
            playLabel.text = String(time3[0])
            timer?.invalidate()
            time2 = [21]
            nameLabel.text = "🔥運動🔥"
            bgimageView.image = UIImage(named: "paper03")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer2) , userInfo: nil, repeats: true)
        } else {
            time3[0] -= 1
            playLabel.text = String(time3[0])
        }
        
        if (time3[0] <= 3){
            playLabel.textColor = UIColor.red
        } else {
            playLabel.textColor = UIColor.black
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tosecond" {
            let nextView = segue.destination as! EndViewController
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
