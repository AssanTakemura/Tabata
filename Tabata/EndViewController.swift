//
//  EndViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/16.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EndViewController: UIViewController {
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var toreText: UITextField!
    
    var user: User!
    var key: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
    }
    
    // Do any additional setup after loading the view.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameText.text = user.name
        toreText.text = user.tore
        
    }
    
    @IBAction func touroku() {
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        var newUser = User()
        newUser.name = nameText.text!
        newUser.tore = toreText.text!
        
        ref.child("Users").childByAutoId().setValue(newUser.toDictionary)
        
        let TimerViewController = self.storyboard?.instantiateViewController(withIdentifier: "first") as! TimerViewController
        self.present(TimerViewController, animated: true, completion: nil)
        
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
