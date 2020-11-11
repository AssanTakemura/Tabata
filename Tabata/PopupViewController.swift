//
//  PopupViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/11/11.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let ud = UserDefaults.standard
        let firstLunchKey = "firstLunch"
        let firstLunch = [firstLunchKey: true]
        ud.register(defaults: firstLunch)
        
        return true
    }
    
    @IBAction func toback() {
        self.dismiss(animated: true, completion: nil)
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
