//
//  ViewController.swift
//  TextViewDemo
//
//  Created by Tomer Buzaglo on 19/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var tapLabel: UILabel!
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("MasterToDetail", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        tapLabel.alpha = 1
    }
    override func viewDidAppear(animated: Bool) {
       tapLabel.rotate360Degrees()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}


extension UIView {
    func rotate360Degrees(delegate: AnyObject? = nil) {
        
        let duration = 0.4
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = CGFloat(0)
        rotate.toValue = M_PI
        rotate.duration = duration
        rotate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rotate.delegate = self
        rotate.removedOnCompletion = true
        
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.25
        pulse.toValue = 1.0
        pulse.duration = duration
        pulse.delegate = self
        pulse.removedOnCompletion = true
        //must set the delegate before asigning the animation to a layer
        self.layer.addAnimation(pulse, forKey: nil)
        self.layer.addAnimation(rotate, forKey: nil)
    }
    public override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.alpha = 0
    }
    
    
}
