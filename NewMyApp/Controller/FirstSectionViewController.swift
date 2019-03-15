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
    @IBOutlet var myView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var animationContainerView: UIView!
    
    var Title = "My Profile"
    var caption = "a little bit about me"
    var body = "Hey! My name is Sabri and I'm a Software Engineer based in NYC. I am currently a sophmore pursuing  a Bachelors of Science in Computer Science at Macaulay Honors College at Lehman(CUNY). I am most interested in mobile development, and hence I have made this app to resemble making an own website."

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = Title
        captionLbl.text = caption
        bodyLbl.text = body
        
        let animationView = LOTAnimationView(name: "4948-about")
        animationView.frame = CGRect(x: animationContainerView.bounds.midX/2, y: (animationContainerView.bounds.midY/2) + 15, width: animationContainerView.bounds.width/2, height: animationContainerView.bounds.height/2)
        animationView.contentMode = .scaleAspectFit
        //animationView.loopAnimation = true
        animationView.animationSpeed = 0.5
        animationContainerView.addSubview(animationView)
        
        animationView.play()
        
        let down = UISwipeGestureRecognizer(target : self, action : #selector(FirstSectionViewController.downSwipe))
        down.direction = .down
        self.animationContainerView.addGestureRecognizer(down)
    }
    
    @objc
    func downSwipe(){
        dismiss(animated: true, completion: nil)
    }
}
