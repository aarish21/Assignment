//
//  NextBtnViewController.swift
//  Assignment
//
//  Created by Aarish on 08/09/23.
//

import UIKit

class NextBtnViewController: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var viewCircle1: UIView!
    @IBOutlet var viewCircle2: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!
    @IBOutlet var view5: UIView!
    
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially hide the views
        viewCircle1.isHidden = true
        viewCircle2.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        view5.isHidden = true
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
        view5.layer.cornerRadius = 10
        
        viewCircle1.layer.cornerRadius = viewCircle1.frame.size.height/2
        viewCircle2.layer.cornerRadius = viewCircle2.frame.size.height/2
        
        btnNext.layer.cornerRadius = btnNext.frame.size.height/2
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewCircle1.isHidden = false
        self.viewCircle2.isHidden = false
        self.view2.isHidden = false
        self.view3.isHidden = false
        self.view4.isHidden = false
        self.view5.isHidden = false
        
        // Save the original positions
        let circleOneOriginalPosition = viewCircle1.frame.origin.x
        let circleTwoOriginalPosition = viewCircle2.frame.origin.x
        let twoOriginalPosition = view2.frame.origin.x
        let threeOriginalPosition = view3.frame.origin.x
        let fourOriginalPosition = view4.frame.origin.x
        let fiveOriginalPosition = view5.frame.origin.x
        
        // Shift them off the screen to the right
        viewCircle1.frame.origin.x = self.view.frame.width
        viewCircle2.frame.origin.x = self.view.frame.width
        view2.frame.origin.x = self.view.frame.width
        view3.frame.origin.x = self.view.frame.width
        view4.frame.origin.x = self.view.frame.width
        view5.frame.origin.x = self.view.frame.width
        
        // Animate them back to their original positions
        UIView.animate(withDuration: 1.2, animations: {
            self.viewCircle1.frame.origin.x = circleOneOriginalPosition
            self.viewCircle2.frame.origin.x = circleTwoOriginalPosition
            self.view2.frame.origin.x = twoOriginalPosition
            self.view3.frame.origin.x = threeOriginalPosition
            self.view4.frame.origin.x = fourOriginalPosition
            self.view5.frame.origin.x = fiveOriginalPosition
        })
        
        UIView.animate(withDuration: 0.8, animations: {
            self.view1.frame.size.width = self.view.frame.width
        })
    }
    
    
    @IBAction func btnNextTapped(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "NumberViewController") as? WalletViewController {
            vc.modalPresentationStyle = .overCurrentContext
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            self.present(vc, animated: true, completion: nil)
            
        }
        
    }
    
}
