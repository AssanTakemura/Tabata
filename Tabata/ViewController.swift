//
//  ViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/09/25.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UITableViewDataSource {
    
    let idArray: [String] = ["first", "second"]
    
    var pageViewController: UIPageViewController!
    var viewControllers: [UIViewController] = []
    
    @IBOutlet var selectTab: UISegmentedControl!
    
    @IBOutlet var tlTableView: UITableView!
    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        FirebaseApp.configure()
        
        tlTableView.dataSource = self
        
        for id in idArray {
            viewControllers.append((storyboard?.instantiateViewController(withIdentifier: id))!)
        }
        
        pageViewController = children[0] as? UIPageViewController
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = idArray.firstIndex(of: viewController.restorationIdentifier!)!
        if (index > 0) {
            return storyboard!.instantiateViewController(withIdentifier: idArray[index - 1])
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = idArray.firstIndex(of: viewController.restorationIdentifier!)!
        if (index < idArray.count - 1) {
            return storyboard!.instantiateViewController(withIdentifier: idArray[index + 1])
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let index = idArray.firstIndex(of: (pageViewController.viewControllers?.first!.restorationIdentifier)!)
        self.selectTab.selectedSegmentIndex = index!
    }
    
    @IBAction func selectedTab(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pageViewController.setViewControllers([viewControllers[0]], direction: .reverse, animated: true, completion: nil)
            break
        case 1:
            pageViewController.setViewControllers([viewControllers[1]], direction: .forward, animated: true, completion: nil)
            break
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _users = users else { return 0 }
        return _users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tlTableView.dequeueReusableCell(withIdentifier: "UserTableCell", for: indexPath)
        
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
    
    
}

