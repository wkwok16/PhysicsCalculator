//
//  ViewController.swift
//  PhysicsCalculator
//
//  Created by William Kwok on 3/20/16.
//  Copyright © 2016 William Kwok. All rights reserved.
//

import UIKit

class ViewControllerAtwood: UIViewController {
    
    @IBOutlet weak var mass1: UITextField!
    @IBOutlet weak var mass2: UITextField!
    @IBOutlet weak var solveButton: UIButton!
    @IBOutlet weak var responseField: UITextView!
    @IBOutlet weak var exampleButton: UIBarButtonItem!
    var example: Bool = false
    
    @IBAction func solve(sender: AnyObject){
        responseField.text = ""
        responseField.text = calculateStuff()
    }
    
    @IBAction func exampleButtonPress(sender: AnyObject){
        example = true;
        responseField.text = ""
        responseField.text = calculateStuff()
        example = false
    }
    
    func calculateStuff()->String
    {
        let smass1 = mass1.text                                                 // initialize variables
        let smass2 = mass2.text
        let vmass1 = (smass1! as NSString).doubleValue
        let vmass2 = (smass2! as NSString).doubleValue
        let gravity = 9.80665
        
        if(!example)
        {
            if(smass1 == "" || smass2 == "")
            {
                return "Invalid input"
            }
            let vAnswer = fabs(vmass2-vmass1)*gravity/(vmass1+vmass2)
            return "Assuming a frictionless pulley, "+String(vAnswer)+" m/s² is the acceleration of the system. Please clear the variables before calculating again."
        }
        else if(example)
        {
            mass1.text = "5"
            mass2.text = "10"
            return "If you have a (5) kg mass and a (10) kg mass on the other side, what will the acceleration of the system be, assuming a frictionless system? The equation being used is (m2-m1)g/(m1+m2) = a. Try it for yourself before clicking solve to check!"
        }
        return ""
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

