//
//  TimerViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/05.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func zyunbi(){
        print ("押された")
    }
    
    @IBAction func undo(){
        print ("押された")
    }
    
    @IBAction func kyukei(){
        print ("押された")
    }
    
    @IBAction func kaisu(){
        print ("押された")
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
