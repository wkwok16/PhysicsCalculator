//
//  ViewController.swift
//  PhysicsCalculator
//
//  Created by William Kwok on 3/20/16.
//  Copyright © 2016 William Kwok. All rights reserved.
//

import UIKit

class ViewControllerEnergyConservation: UIViewController {
    
    @IBOutlet weak var mass: UITextField!
    @IBOutlet weak var initHeight: UITextField!
    @IBOutlet weak var initVelocity: UITextField!
    @IBOutlet weak var finalHeight: UITextField!
    @IBOutlet weak var finalVelocity: UITextField!
    @IBOutlet weak var solveButton: UIButton!
    @IBOutlet weak var responseField: UITextView!
    @IBOutlet weak var exampleButton: UIBarButtonItem!
    @IBOutlet weak var rollerCoasterImage: UIImageView!
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
        rollerCoasterImage.hidden = !rollerCoasterImage.hidden
    }
    
    func calculateStuff()->String
    {
        let smass = mass.text                            //
        let sinitHeight = initHeight.text                // Initialize text variables
        let sinitVelocity = initVelocity.text            //
        let sfinalHeight = finalHeight.text              //
        let sfinalVelocity = finalVelocity.text          //
        let vmass = (smass! as NSString).doubleValue                    // Takes doubles of the text variables
        var vinitHeight = (sinitHeight! as NSString).doubleValue        //
        var vinitVelocity = (sinitVelocity! as NSString).doubleValue    //
        var vfinalHeight = (sfinalHeight! as NSString).doubleValue      //
        var vfinalVelocity = (sfinalVelocity! as NSString).doubleValue  //
        let gravity = 9.80665
        
        var count: Int = 0;
        
        if(initHeight.text == "" || vinitHeight < 0)
        {
            count++;
        }
        if(initVelocity.text == "" || vinitVelocity < 0)
        {
            count++;
        }
        if(finalHeight.text == "" || vfinalHeight < 0)
        {
            count++;
        }
        if(finalVelocity.text == "" || vfinalVelocity < 0)
        {
            count++;
        }
        
        if((count != 1) && !example)
        {
            return "Invalid input"
        }
            
        else if(count == 1 && !example)
        {
            if(initHeight.text == "")
            {
                vinitHeight = ((gravity*vfinalHeight)+(0.5*vfinalVelocity*vfinalVelocity)-(0.5*vinitVelocity*vinitVelocity))/gravity
                initHeight.text = String(vinitHeight)
                return "Please clear values before calculating again"
            }
            else if(initVelocity.text == "")
            {
                vinitVelocity = sqrt((2*gravity*vfinalHeight)+(vfinalVelocity*vfinalVelocity)-(2*gravity*vinitHeight))
                if(vinitVelocity.isNaN)
                {
                    return "Invalid input"
                }
                else
                {
                    initVelocity.text = String(vinitVelocity)
                    return "Please clear values before calculating again"
                }
            }
            else if(finalHeight.text == "")
            {
                vfinalHeight = ((gravity*vinitHeight)+(0.5*vinitVelocity*vinitVelocity)-(0.5*vfinalVelocity*vfinalVelocity))/gravity
                finalHeight.text = String(vfinalHeight)
                return "Please clear values before calculating again"
            }
            else if(finalVelocity.text == "")
            {
                vfinalVelocity = sqrt((2*gravity*vinitHeight)+(vinitVelocity*vinitVelocity)-(2*gravity*vfinalHeight))
                if(vfinalVelocity.isNaN)
                {
                    return "Invalid input"
                }
                else
                {
                    finalVelocity.text = String(vfinalVelocity)
                    return "Please clear values before calculating again"
                }
            }
        }
        else if(example)
        {
            mass.text = "20"
            initHeight.text = "20"
            finalHeight.text = "10"
            finalVelocity.text = ""
            initVelocity.text = "40"
            return "If you have a roller coaster weighing (20) kg starting at a height of (20) m with an initial velocity at that height of (40) m/s, and the final height is (10) m/s, what will the velocity of the roller coaster be at that height? The equation being used is mghi + 1/2mvi² = mghf + 1/2mvf². Try it for yourself before clicking solve to see the answer! (Hint: Mass is actually disregarded in this equation)"
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

