//
//  ThirdSectionViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/5/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit
import Lottie

class ThirdSectionViewController: UIViewController {

    @IBOutlet weak var animationContainerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!

    @IBOutlet weak var bodyLbl: UILabel!
    
    var Title = "My Resume"
    
    var body = "You can watch my video resume or take a look at the pdf file"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = Title
        bodyLbl.text = body
        let animationView = LOTAnimationView(name: "profile")
        animationView.frame = CGRect(x: 80, y: 250, width: 200, height: 150)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 2
        animationView.loopAnimation = true
        
        animationContainerView.addSubview(animationView)
        
        animationView.play()
        
        
    }
    

    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
