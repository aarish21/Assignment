//
//  DownloadViewController.swift
//  Assignment
//
//  Created by Aarish on 08/09/23.
//

import UIKit

class DownloadViewController: UIViewController {
    
    @IBOutlet var yellowView: UIView!
    @IBOutlet var gray1: UIView!
    @IBOutlet var gray2: UIView!
    
    @IBOutlet var candyLbl: UILabel!
    @IBOutlet var loremIpsumLbl: UILabel!
    @IBOutlet var downloadLbl: UILabel!
    
    @IBOutlet var crossBtn1: UIButton!
    @IBOutlet var readBtn: UIButton!
    @IBOutlet var downloadBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    
    
    @IBOutlet var btnDownloadWidthConstraint: NSLayoutConstraint!
    
    // Adding background process view programatically
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 222/255, green: 237/255, blue: 197/255, alpha: 0.8)
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let crossBtn2: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor.init(red: 249/255, green: 225/255, blue: 77/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.setTitle("X", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        yellowView.layer.cornerRadius = 20
        downloadBtn.layer.cornerRadius = downloadBtn.frame.size.height/2
        playBtn.layer.cornerRadius = playBtn.frame.size.height/2
        // Initially hide the view
        crossBtn2.isHidden = true
        backgroundView.isHidden = true
        // Add behind downloadBtn
        view.insertSubview(backgroundView, belowSubview: downloadBtn)
        view.insertSubview(crossBtn2, belowSubview: downloadBtn)
        // assigning the constraints to progressview
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: downloadBtn.leadingAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: 300),
            backgroundView.heightAnchor.constraint(equalToConstant: 60),
            backgroundView.topAnchor.constraint(equalTo: downloadBtn.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: downloadBtn.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            crossBtn2.leadingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: 10),
            crossBtn2.widthAnchor.constraint(equalToConstant: 40),
            crossBtn2.heightAnchor.constraint(equalToConstant: 40),
            crossBtn2.topAnchor.constraint(equalTo: downloadBtn.topAnchor,constant: 10),
        ])
        // Initially hide the views
        playBtn.isHidden = true
        gray1.isHidden = true
        gray2.isHidden = true
        loremIpsumLbl.alpha = 0.0
        crossBtn1.alpha = 0.0
        readBtn.alpha = 0.0
        
        // Save the original position
        let loremIpsumOriginalPosition = loremIpsumLbl.center
        let crossOriginalPosition = crossBtn1.center
        let readOriginalPosition = readBtn.center
        
        // Shift them a little backwards
        loremIpsumLbl.center.y += 10
        crossBtn1.center.y += 10
        readBtn.center.y += 10
        
        // Animation for the view
        let viewOriginalPosition = yellowView.frame.origin.y
        yellowView.frame.origin.y = (self.view.frame.height / 2) - 250 // You can adjust this value
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.yellowView.frame.origin.y = viewOriginalPosition
        })
        
        // Animation for the label
        let labelOriginalPosition = candyLbl.frame.origin.x
        candyLbl.frame.origin.x = self.view.frame.width - 220
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.candyLbl.frame.origin.x = labelOriginalPosition
        })
        
        // Animation for the button
        let buttonOriginalPosition = downloadBtn.frame.origin.y
        downloadBtn.frame.origin.y = (self.view.frame.height / 2) + 150 // You can adjust this value
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.downloadBtn.frame.origin.y = buttonOriginalPosition
        }, completion: { _ in
            // Show the views after the animation
            self.gray1.isHidden = false
            self.gray2.isHidden = false
            
            // Animation for viewGrayOne
            let grayOneOriginalPosition = self.gray1.frame.origin.x
            self.gray1.frame.origin.x = self.view.frame.width
            UIView.animate(withDuration: 0.5, animations: {
                self.gray1.frame.origin.x = grayOneOriginalPosition
            })
            
            
            // Animation for viewGrayTwo
            let grayTwoOriginalPosition = self.gray2.frame.origin.x
            self.gray2.frame.origin.x = self.view.frame.width
            UIView.animate(withDuration: 0.5, animations: {
                self.gray2.frame.origin.x = grayTwoOriginalPosition
            })
            
            // Fade in animations for the labels and the button
            UIView.animate(withDuration: 1.0, animations: {
                self.loremIpsumLbl.alpha = 1.0
                self.crossBtn1.alpha = 1.0
                self.readBtn.alpha = 1.0
                
                // Move them to their original position
                self.loremIpsumLbl.center = loremIpsumOriginalPosition
                self.crossBtn1.center = crossOriginalPosition
                self.readBtn.center = readOriginalPosition
            })
            
        })
        
        
    }
    
    
    @IBAction func btnDownloadTapped(_ sender: Any) {
        
        downloadBtn.isEnabled = false
        UIView.animate(withDuration: 1) {
            // Change the width of downloadBtn and corner radius
            self.view.layoutIfNeeded()
            self.downloadBtn.layer.cornerRadius  = 30
            self.btnDownloadWidthConstraint.constant = 300
            // Shifting the downloadLbl w.r.t downloadBtn
            let newX: CGFloat = self.downloadLbl.center.x - 30
            let newCenter = CGPoint(x: newX, y: self.downloadLbl.center.y)
            
            // Update the label's center
            self.downloadLbl.center = newCenter
            self.crossBtn2.isHidden = false
            self.view.layoutIfNeeded()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            self.backgroundView.isHidden = false
            
            self.downloadLbl.text = "10 MB / 30 MB"
            
            self.downloadBtn.layer.cornerRadius  = 20
            self.btnDownloadWidthConstraint.constant = 50
            self.view.layoutIfNeeded()
            //    downloadBtn Animation
            UIView.animate(withDuration: 3) {
                self.view.layoutIfNeeded()
                self.downloadBtn.layer.cornerRadius  = 30
                self.btnDownloadWidthConstraint.constant = 300
                self.view.layoutIfNeeded()
            } completion: { _ in
                
                
                self.downloadLbl.text = "DOWNLOADED"
                self.crossBtn2.setTitle("✓", for: .normal)
                // Hide the background view after the download button's animation
                self.backgroundView.isHidden = true
                self.crossBtn2.isHidden = false
            }
        }
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            
            let originalPosition = self.playBtn.center
            
            // Move the button below the screen
            self.playBtn.center.y = self.view.frame.height + self.playBtn.frame.height
            
            // Make playBtn visible
            self.downloadBtn.isHidden = true
            self.playBtn.isHidden = false
            
            // Animate button coming up from the bottom
            UIView.animate(withDuration: 0.5, animations: {
                self.playBtn.center = originalPosition
            })
        }
        
        
    }
    
    
    @IBAction func btnPlayTapped(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextBtnViewController {
            vc.modalPresentationStyle = .overCurrentContext
            vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
