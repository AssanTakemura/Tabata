//
//  TlViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/18.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TlViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tlTableView: UITableView!

    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tlTableView.dataSource = self
        tlTableView.delegate = self
        
        FirebaseApp.configure()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            
            self.tlTableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _users = users else { return 0 }
        return _users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tlTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let user = users[indexPath.row]
        
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = user.name
        
        let toreLabel = cell.viewWithTag(2) as! UILabel
        toreLabel.text = user.tore
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
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
