//
//  ViewController.swift
//  PhysicsCalculator
//
//  Created by William Kwok on 3/20/16.
//  Copyright © 2016 William Kwok. All rights reserved.
//

import UIKit

class ViewControllerKinematics: UIViewController {
    
    @IBOutlet weak var deltaX: UITextField!
    @IBOutlet weak var acceleration: UITextField!
    @IBOutlet weak var initVelocity: UITextField!
    @IBOutlet weak var finalVelocity: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var solveButton: UIButton!
    @IBOutlet weak var responseField: UITextView!
    @IBOutlet weak var exampleButton: UIBarButtonItem!
    
    @IBAction func solve(sender: AnyObject){
        responseField.text = ""
        responseField.text = calculateStuff()
    }
    
    func calculateStuff()->String
    {
        var booldeltaX: Bool =  true
        var boolacceleration: Bool = true
        var boolinitVelocity: Bool = true
        var boolfinalVelocity: Bool = true
        var booltime: Bool = true
        var count: Int = 0;
        if(deltaX.text == "")
        {
            count++;
            booldeltaX = false
        }
        if(acceleration.text == "")
        {
            count++;
            boolacceleration = false
        }
        if(initVelocity.text == "")
        {
            count++;
            boolinitVelocity = false
        }
        if(finalVelocity.text == "")
        {
            count++;
            boolfinalVelocity = false
        }
        if(time.text == "")
        {
            count++;
            booltime = false
        }
        
        if(count > 2)
        {
            return "Invalid input"
        }
         let mystring = initVelocity.text
            let myfloatt = (mystring! as NSString).doubleValue
            
           // 15 loops
        else
        {
            return ""
        }
    }
    
    
    
    
    
    
    
    
    
    
    
  ////////////////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:0.75, alpha:1.0)
    }
    /*
    override func prefersStatusBarHidden() -> Bool {
    return true
    }*/
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

