//
//  Pun-M.swift
//  ikid
//
//  Created by studentuser on 4/26/17.
//  Copyright © 2017 Ethan McGregor. All rights reserved.
//

import Foundation
import UIKit

class Knock_M: UIViewController {
    
    fileprivate var firstViewController :  Knock_A!
    fileprivate var secondViewController : Knock_B!
    fileprivate var thirdViewController : Knock_C!
    fileprivate var fourthViewController : Knock_D!
    fileprivate var fithViewController : Knock_E!
    fileprivate var mainVC : Knock_M!
    
    @IBOutlet weak var punLable: UILabel!
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KnockA")
                as! Knock_A
        }
    }
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KnockB")
                as! Knock_B
        }
    }
    fileprivate func thirdBuilder() {
        if thirdViewController == nil {
            thirdViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KnockC")
                as! Knock_C
        }
    }
    
    fileprivate func fourthBuilder() {
        if fourthViewController == nil {
            fourthViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KnockD")
                as! Knock_D
        }
    }
    fileprivate func fithBuilder() {
        if fithViewController == nil {
            fithViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KnockE")
                as! Knock_E
        }
    }
    
    fileprivate func mainBuilder() {
        if mainVC == nil {
            mainVC =
                storyboard?
                    .instantiateViewController(withIdentifier: "KnockM")
                as! Knock_M
        }
    }
    
    
    @IBAction func switchViews(_ sender: UIButton) {
        punLable.text = ""
        firstBuilder()
        secondBuilder()
        thirdBuilder()
        fourthBuilder()
        fithBuilder()
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
            thirdViewController.view.frame = view.frame
            switchViewController(secondViewController, to: thirdViewController)
            
            
        }else if thirdViewController != nil &&
            thirdViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            fourthViewController.view.frame = view.frame
            switchViewController(thirdViewController, to: fourthViewController)
            
            
        }else if fourthViewController != nil &&
            fourthViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            fithViewController.view.frame = view.frame
            switchViewController(fourthViewController, to: fithViewController)
            
            
        }else if fithViewController != nil &&
            fithViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            mainVC.view.frame = view.frame
            switchViewController(fithViewController, to: mainVC)
            
            
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
