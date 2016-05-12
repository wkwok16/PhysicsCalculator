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
        let sdeltaX = deltaX.text                            //
        let sacceleration = acceleration.text                // Initialize text variables
        let sinitVelocity = initVelocity.text                //
        let sfinalVelocity = finalVelocity.text              //
        let stime = time.text                                //
        var vdeltaX = (sdeltaX! as NSString).doubleValue                // Takes doubles of the text variables
        var vacceleration = (sacceleration! as NSString).doubleValue    //
        var vinitVelocity = (sinitVelocity! as NSString).doubleValue    //
        var vfinalVelocity = (sfinalVelocity! as NSString).doubleValue  //
        var vtime = (stime! as NSString).doubleValue                    //

        var count: Int = 0;
        if(deltaX.text == "" || vdeltaX < 0)
        {
            count++;
        }
        if(acceleration.text == "" || vacceleration < 0)
        {
            count++;
        }
        if(initVelocity.text == "" || vinitVelocity < 0)
        {
            count++;
        }
        if(finalVelocity.text == "" || vfinalVelocity < 0)
        {
            count++;
        }
        if(time.text == "" || vtime < 0)
        {
            count++;
        }
        
        if((count > 2 || count < 2) && !example)
        {
            return "Invalid input"
        }
        
        else if(count == 2 && !example)
        {
            if(deltaX.text == "")                                                               //Main calculation program
            {
                if(finalVelocity.text == "")
                {
                    vfinalVelocity = vinitVelocity + (vacceleration*vtime);
                    finalVelocity.text = String(vfinalVelocity)
                }
                else if(acceleration.text == "")
                {
                    vacceleration = (vfinalVelocity - vinitVelocity)/vtime;
                    acceleration.text = String(vacceleration);
                }
                else if(initVelocity.text == "")
                {
                    vinitVelocity = vfinalVelocity - (vacceleration*vtime)
                    initVelocity.text = String(vinitVelocity)
                }
                    
                else if(time.text == "")
                {
                    vtime = (vfinalVelocity - vinitVelocity)/vacceleration;
                    time.text = String(vtime);
                }
                vdeltaX = (vinitVelocity*vtime) + ((vacceleration/2)*(vtime*vtime));
                deltaX.text = String(vdeltaX);
                return "Please clear variables before calculating again"                        //Return here so loop exits
            }
            
            else if(acceleration.text == "")
            {
                if(initVelocity.text == "")
                {
                    vinitVelocity = (((2*vdeltaX)/vtime)-vfinalVelocity)
                    initVelocity.text = String(vinitVelocity)
                }
                else if(finalVelocity.text == "")
                {
                    vfinalVelocity = (((2*vdeltaX)/vtime)-vinitVelocity)
                    finalVelocity.text = String(vfinalVelocity)
                }
                else if(time.text == "")
                {
                    vtime = (2*vdeltaX)/(vinitVelocity+vfinalVelocity)
                    time.text = String(vtime)
                }
                vacceleration = (vfinalVelocity-vinitVelocity)/vtime
                acceleration.text = String(vacceleration)
                return "Please clear variables before calculating again"                        //Return here so loop exits
            }
            
            else if(initVelocity.text == "")
            {
                if(finalVelocity.text == "")
                {
                    vfinalVelocity = ((vdeltaX + 0.5*(vacceleration*vtime*vtime))/vtime)
                    finalVelocity.text = String(vfinalVelocity)
                    vinitVelocity = (((2*vdeltaX)/vtime)-vfinalVelocity)
                    initVelocity.text = String(vinitVelocity)
                }
                else if(time.text == "")
                {
                    vinitVelocity = sqrt(((vfinalVelocity*vfinalVelocity)-(2*vacceleration*vdeltaX)))
                    initVelocity.text = String(vinitVelocity)
                    vtime = (2*vdeltaX)/(vinitVelocity+vfinalVelocity)
                    time.text = String(vtime)
                }
                return "Please clear variables before calculating again"                        //Return here so loop exits
            }
            
            else if(finalVelocity.text == "")
            {
                vfinalVelocity = sqrt(((vinitVelocity*vinitVelocity)+(2*vacceleration*vdeltaX)))
                finalVelocity.text = String(vfinalVelocity)
                vtime = (2*vdeltaX)/(vinitVelocity+vfinalVelocity)
                time.text = String(vtime)
                return "Please clear variables before calculating again"                        //Return here so loop exits
            }
            
        }
        else if(example)
        {
            deltaX.text = ""
            acceleration.text = ""
            time.text = "25"
            finalVelocity.text = "50"
            initVelocity.text = "0"
            return "If you have a car starting from rest (0) that goes up to (50) meters per second in (25) seconds, what distance does it have to travel, and what would that car's acceleration be? Because the initial velocity is that the car is at rest, you enter (0). It ends up at (50) meters per second after (25) seconds. Press solve to see the other two values that you have to find!"
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

