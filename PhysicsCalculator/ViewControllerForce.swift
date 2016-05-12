//
//  ViewController.swift
//  PhysicsCalculator
//
//  Created by William Kwok on 3/20/16.
//  Copyright © 2016 William Kwok. All rights reserved.
//

import UIKit

class ViewControllerForce: UIViewController {
    
    @IBOutlet weak var force: UITextField!
    @IBOutlet weak var acceleration: UITextField!
    @IBOutlet weak var mass: UITextField!
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
        let sforce = force.text                                                 // initialize variables
        let sacceleration = acceleration.text
        let smass = mass.text
        var vforce = (sforce! as NSString).doubleValue
        var vacceleration = (sacceleration! as NSString).doubleValue
        var vmass = (smass! as NSString).doubleValue
        
        var count = 0;
        
        if(force.text == "" || vforce < 0)
        {
            count++;
        }
        if(acceleration.text == "" || vacceleration < 0)
        {
            count++;
        }
        if(mass.text == "" || vmass < 0)
        {
            count++;
        }
        
        if((count != 1) && !example)
        {
            return "Invalid input"
        }
        else if(count == 1 && !example)
        {
            if(force.text == "")
            {
                vforce = vmass*vacceleration
                force.text = String(vforce)
            }
            else if(acceleration.text == "")
            {
                vacceleration = vforce/vmass
                acceleration.text = String(vacceleration)
            }
            else if(mass.text == "")
            {
                vmass = vforce/vacceleration
                mass.text = String(vmass)
            }
            return "Please clear variables before calculating again"
        }
        else if(example)
        {
            force.text = "20"
            acceleration.text = ""
            mass.text = "5"
            return "If you have a (5) kg object and neglecting friction, you push on it from the side with (20) Newtons of force, what will your acceleration be? Friction is neglected for simplicity. If you did have a frictional force, it would be subtracted from this force. The equation being used is Force = Mass * Acceleration. Try it for yourself and then press solve to find out the acceleration! "
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

