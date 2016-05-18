//
//  ViewController.swift
//  PhysicsCalculator
//
//  Created by William Kwok on 3/20/16.
//  Copyright © 2016 William Kwok. All rights reserved.
//

import UIKit

class ViewControllerInelastic: UIViewController {
    
    @IBOutlet weak var mass1: UITextField!
    @IBOutlet weak var initVelocity1: UITextField!
    @IBOutlet weak var mass2: UITextField!
    @IBOutlet weak var initVelocity2: UITextField!
    @IBOutlet weak var finalVelocity: UITextField!
    @IBOutlet weak var solveButton: UIButton!
    @IBOutlet weak var responseField: UITextView!
    @IBOutlet weak var exampleButton: UIBarButtonItem!
    @IBOutlet weak var diagram: UIImageView!
    @IBOutlet weak var showDiagram: UIButton!
    
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
    
    @IBAction func showDiagramButtonPress(sender: AnyObject)
    {
        diagram.hidden = !diagram.hidden
    }
    
    func calculateStuff()->String
    {
        let smass1 = mass1.text                                                 // initialize variables
        let smass2 = mass2.text
        let sinitVelocity1 = initVelocity1.text
        let sinitVelocity2 = initVelocity2.text
        let sfinalVelocity = finalVelocity.text
        var vmass1 = (smass1! as NSString).doubleValue
        var vmass2 = (smass2! as NSString).doubleValue
        var vinitVelocity1 = (sinitVelocity1! as NSString).doubleValue
        var vinitVelocity2 = (sinitVelocity2! as NSString).doubleValue
        var vfinalVelocity = (sfinalVelocity! as NSString).doubleValue
        
        var count: Int = 0;
        if(vmass1 < 0 || vmass2 < 0)
        {
            return "Invalid input"
        }
        if(mass1.text == "")
        {
            count++;
        }
        if(mass2.text == "")
        {
            count++;
        }
        if(initVelocity1.text == "")
        {
            count++;
        }
        if(initVelocity2.text == "")
        {
            count++;
        }
        if(finalVelocity.text == "")
        {
            count++;
        }
        
        if((count != 1) && !example)
        {
            return "Invalid input"
        }
            
        else if(count == 1 && !example)
        {
            if(mass1.text == "")
            {
                vmass1 = ((vmass2*vfinalVelocity)-(vmass2*vinitVelocity2))/(vinitVelocity1-vfinalVelocity)
                mass1.text = String(vmass1)
            }
            else if(mass2.text == "")
            {
                vmass2 = ((vmass1*vinitVelocity1)-(vmass1*vfinalVelocity))/(vfinalVelocity-vinitVelocity2)
                mass2.text = String(vmass2)
            }
            else if(initVelocity1.text == "")
            {
                vinitVelocity1 = ((vmass1*vfinalVelocity)+(vmass2*vfinalVelocity)-(vmass2*vinitVelocity2))/vmass1
                initVelocity1.text = String(vinitVelocity1)
            }
            else if(initVelocity2.text == "")
            {
                vinitVelocity2 = ((vmass1*vfinalVelocity)+(vmass2*vfinalVelocity)-(vmass1*vinitVelocity1))/vmass2
                initVelocity2.text = String(vinitVelocity2)
            }
            else if(finalVelocity.text == "")
            {
                vfinalVelocity = ((vmass1*vinitVelocity1)+(vmass2*vinitVelocity2))/(vmass1+vmass2)
                finalVelocity.text = String(vfinalVelocity)
            }
            return "Please clear variables before calculating again"
        }
        else if(example)
        {
            mass1.text = "30"
            mass2.text = "15"
            initVelocity1.text = "25"
            initVelocity2.text = ""
            finalVelocity.text = "15"
            return "Assuming an inelastic collision (kinetic energy is not conserved, thus the objects stick together after the collision), what is the initial velocity of the second object, given the variables? The equation being used to solve this problem is (Mass 1 * Initial Velocity 1) + (Mass 2 * Initial Velocity 2) = (Mass 1 * Final Velocity) + (Mass 2 * Final Velocity). Try it for yourself, then press solve to find out!"
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

