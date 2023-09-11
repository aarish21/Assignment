//
//  MainViewController.swift
//  Assignment
//
//  Created by Aarish on 08/09/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var orangeView: UIView!
    @IBOutlet var yellowView: UIView!
    
    @IBOutlet var orangeBtn: UIButton!
    @IBOutlet var greenBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orangeView.layer.cornerRadius = 20
        yellowView.layer.cornerRadius = 20
        
        orangeBtn.layer.cornerRadius = orangeBtn.frame.size.height/2
        greenBtn.layer.cornerRadius = greenBtn.frame.size.height/2
        
    }
    
    
    @IBAction func btnOrangeTapped(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CandyViewController") as? DownloadViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}
