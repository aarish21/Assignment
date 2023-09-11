//
//  ConfirmViewController.swift
//  Assignment
//
//  Created by Aarish on 08/09/23.
//

import UIKit

class ConfirmViewController: UIViewController {
    @IBOutlet var playLbl: UILabel!
    @IBOutlet var oswaldLbl: UILabel!
    @IBOutlet var balanceLbl: UILabel!
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var viewCircle1: UIView!
    @IBOutlet var viewCircle2: UIView!
    @IBOutlet var viewCircle3: UIView!
    
    
    @IBOutlet var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially hide all the views
        playLbl.isHidden = true
        oswaldLbl.isHidden = true
        view1.isHidden = true
        viewCircle1.isHidden = true
        viewCircle2.isHidden = true
        viewCircle3.isHidden = true
        view2.isHidden = true
        balanceLbl.isHidden = true
        
        
        
        viewCircle1.layer.cornerRadius = viewCircle1.frame.size.height/2
        viewCircle2.layer.cornerRadius = viewCircle2.frame.size.height/2
        viewCircle3.layer.cornerRadius = viewCircle3.frame.size.height/2
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        
        btnConfirm.layer.cornerRadius = btnConfirm.frame.size.height/2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Save original positions
        let originalPositionViewCircleOne = viewCircle1.center
        let originalPositionViewCircleTwo = viewCircle2.center
        let originalPositionViewCircleThree = viewCircle3.center
        let originalPositionViewTwo = view2.center
        let originalPositionLblBalance = balanceLbl.center
        
        // Move them off-screen (adjust as necessary)
        viewCircle1.center.x += view.bounds.width
        viewCircle2.center.x += view.bounds.width
        viewCircle3.center.x += view.bounds.width
        //            move view2 below the screen
        view2.center.y += view.bounds.height
        //            move balance below the screen
        balanceLbl.center.y += view.bounds.height
        
        
        
        
        // Set them to a smaller size
        playLbl.font = playLbl.font.withSize(0)
        oswaldLbl.font = oswaldLbl.font.withSize(0)
        
        // Make views visible
        playLbl.isHidden = false
        oswaldLbl.isHidden = false
        view1.isHidden = false
        viewCircle1.isHidden = false
        viewCircle2.isHidden = false
        viewCircle3.isHidden = false
        view2.isHidden = false
        balanceLbl.isHidden = false
        
        // Set labels to a smaller scale
        playLbl.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        oswaldLbl.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        // Animate labels to original scale
        UIView.animate(withDuration: 0.8, animations: {
            self.playLbl.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.oswaldLbl.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Animate
        UIView.animate(withDuration: 1.2, animations: {
            // animate it to its original position
            self.view2.center = originalPositionViewTwo
            self.balanceLbl.center = originalPositionLblBalance
            self.viewCircle1.center = originalPositionViewCircleOne
            self.viewCircle2.center = originalPositionViewCircleTwo
            self.viewCircle3.center = originalPositionViewCircleThree
            
        })
    }
    
}
