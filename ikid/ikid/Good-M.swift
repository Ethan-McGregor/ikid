//
//  Good-M.swift
//  ikid
//
//  Created by studentuser on 4/26/17.
//  Copyright © 2017 Ethan McGregor. All rights reserved.
//

import Foundation
import UIKit

class Good_M: UIViewController {
    
    fileprivate var firstViewController : Good_A!
    fileprivate var secondViewController : Good_B!
    fileprivate var mainVC : Good_M!
    
    @IBOutlet weak var punLable: UILabel!
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodA")
                as! Good_A
        }
    }
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodB")
                as! Good_B
        }
    }
    
    fileprivate func mainBuilder() {
        if mainVC == nil {
            mainVC =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodM")
                as! Good_M
        }
    }
    
    
    @IBAction func switchViews(_ sender: UIButton) {
        punLable.text = ""
        firstBuilder()
        secondBuilder()
        mainBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        }
        else if secondViewController != nil &&
            secondViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            mainVC.view.frame = view.frame
            switchViewController(secondViewController, to: mainVC)
            
            
        }else{
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(mainVC, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
