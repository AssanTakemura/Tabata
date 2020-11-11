//
//  ViewController.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/09/25.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    let idArray: [String] = ["first", "second"]
    
    var pageViewController: UIPageViewController!
    var viewControllers: [UIViewController] = []
    
    @IBOutlet var selectTab: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for id in idArray {
            viewControllers.append((storyboard?.instantiateViewController(withIdentifier: id))!)
        }
        
        pageViewController = children[0] as? UIPageViewController
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
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
    
    
    
}

