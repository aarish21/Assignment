//
//  WalletViewController.swift
//  Assignment
//
//  Created by Aarish on 08/09/23.
//

import UIKit

class WalletViewController: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var viewCircle1: UIView!
    @IBOutlet var viewCircle2: UIView!
    @IBOutlet var viewCircle3: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var balanceLbl: UILabel!
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially hide all the views
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        viewCircle1.isHidden = true
        viewCircle2.isHidden = true
        viewCircle3.isHidden = true
        balanceLbl.isHidden = true
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        
        viewCircle1.layer.cornerRadius = viewCircle1.frame.size.height/2
        viewCircle2.layer.cornerRadius = viewCircle2.frame.size.height/2
        viewCircle3.layer.cornerRadius = viewCircle3.frame.size.height/2
        
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height/2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Save original positions
        let originalPositionViewTwo = view2.center
        let originalPositionViewThree = view3.center
        let originalPositionViewCircleOne = viewCircle1.center
        let originalPositionViewCircleTwo = viewCircle2.center
        let originalPositionViewCircleThree = viewCircle3.center
        let originalPositionLblBalance = balanceLbl.center
        
        // Move them off-screen (adjust as necessary)
        view2.center.x += view.bounds.width
        view3.center.y += view.bounds.height
        viewCircle1.center.x += view.bounds.width
        viewCircle2.center.x += view.bounds.width
        viewCircle3.center.x += view.bounds.width
        //            move balance below the screen
        balanceLbl.center.y += view.bounds.height
        
        // Make views visible
        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false
        viewCircle1.isHidden = false
        viewCircle2.isHidden = false
        viewCircle3.isHidden = false
        balanceLbl.isHidden = false
        
        UIView.animate(withDuration: 0.8, animations: {
            // Animate viewOne's width to fill the screen
            self.view1.frame.size.width = self.view.frame.width
        })
        
        // After viewOne is shown, animate the rest
        UIView.animate(withDuration: 1.2, animations: {
            // Move views back to original positions
            self.viewCircle1.center = originalPositionViewCircleOne
            self.viewCircle2.center = originalPositionViewCircleTwo
            self.viewCircle3.center = originalPositionViewCircleThree
            self.balanceLbl.center = originalPositionLblBalance
            self.view2.center = originalPositionViewTwo
            self.view3.center = originalPositionViewThree
            
        })
    }
    
    
    @IBAction func btnNextTapped(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmViewController") as? ConfirmViewController {
            vc.modalPresentationStyle = .overCurrentContext
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    
}
