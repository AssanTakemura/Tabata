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
    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        
        datebase()
        
        print(users)
    }
    
    // Do any additional setup after loading the view.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameText.text = users[0].name
        toreText.text = users[0].tore
        
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
    
    func datebase(){
        
        let ref = Database.database().reference()
        
        ref.child("Users").observe(.value) { (snapshot) in
            
            self.users = []
            
            for data in snapshot.children {
                let snapData = data as! DataSnapshot
                let dictionarySnapData = snapData.value as! [String: Any]
                
                var user = User()
                user.setFromDictionary(dictionarySnapData)
                
                self.users.append(user)
            }
            
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
