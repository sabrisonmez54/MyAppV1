//
//  FourthSectionViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/5/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit
import Lottie

class FourthSectionViewController: UIViewController {

    //Outlets
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var animationViewContainer: UIView!
    
    var Title = "Linkedin and more"
    var caption = "My Linkedin profile and other ways to get in touch with me"
   
    //Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = Title
        captionLbl.text = caption
        
        let animationView = LOTAnimationView(name: "1607-computer-display")
        animationView.frame = CGRect(x: 80, y: 150, width: 350, height: 350)
        animationView.contentMode = .scaleAspectFit
        //animationView.loopAnimation = true
        animationView.animationSpeed = 0.5
        animationViewContainer.addSubview(animationView)
        
        animationView.play()
    }
    
   
    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    
//    @IBAction func linkedInProfileBtnTapped(_ sender: Any) {
//        guard let url = URL(string: "https://www.linkedin.com/in/sabri-umut-s%C3%B6nmez-034025180/") else { return }
//        UIApplication.shared.open(url)
//    }
//    
//    @IBAction func emailBtnPressed(_ sender: Any) {
//        let email = "sabri.sonmez@macaulay.cuny.edu"
//        if let url = URL(string: "mailto:\(email)") {
//            if #available(iOS 10.0, *) {
//                UIApplication.shared.open(url)
//            } else {
//                UIApplication.shared.openURL(url)
//            }
//        }
//    }
//    
//    @IBAction func messageBtnPressed(_ sender: Any) {
//        UIApplication.shared.open(URL(string: "sms:+13472183015")!, options: [:], completionHandler: nil)
//    }
}
