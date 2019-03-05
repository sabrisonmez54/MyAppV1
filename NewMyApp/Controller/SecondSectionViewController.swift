//
//  SecondSectionViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/4/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit
import Lottie
import WebKit

class SecondSectionViewController: UIViewController {

    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var animationContainerView: UIView!
    @IBOutlet weak var webViewOutlet: WKWebView!
    
    var Title = "My GitHub"
    var caption = "This is where I upload all my projects"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = Title
        captionLbl.text = caption
       
        let animationView = LOTAnimationView(name: "3179-code-icon")
        animationView.frame = CGRect(x: 79, y: 150, width: 250, height: 150)
        animationView.contentMode = .scaleAspectFit
        //animationView.loopAnimation = true
       
        animationContainerView.addSubview(animationView)
        
        animationView.play()
        
       let url = URL(string: "https://github.com/sabrisonmez54")
       let request = URLRequest(url: url!)
        
        webViewOutlet.load(request)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
