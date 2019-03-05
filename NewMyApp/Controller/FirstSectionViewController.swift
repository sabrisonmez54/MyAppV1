//
//  SectionViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/4/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit
import Lottie

class FirstSectionViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var animationContainerView: UIView!
    
    var Title = "My Profile"
    var caption = "a little bit about me"
    var body = "I am computer science student at Macaulay Honors College at Lehman(CUNY)."

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = Title
        captionLbl.text = caption
        bodyLbl.text = body
        
        let animationView = LOTAnimationView(name: "4583-mine")
        animationView.frame = CGRect(x: animationContainerView.bounds.midX/2, y: animationContainerView.bounds.midY/2, width: animationContainerView.bounds.width/2, height: animationContainerView.bounds.height/2)
        animationView.contentMode = .scaleAspectFit
        //animationView.loopAnimation = true
        animationView.animationSpeed = 0.7
        animationContainerView.addSubview(animationView)
        
        animationView.play()
    }
}
