//
//  ThirdSectionViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/5/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit
import Lottie
import WebKit

class ThirdSectionViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    //Outlets
    @IBOutlet weak var animationContainerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var Title = "My Resume"
    var body = "You can watch my video resume or take a look at the pdf file"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.isHidden = true
        //spinner.hidesWhenStopped = true
        
        titleLbl.text = Title
        bodyLbl.text = body
        let animationView = LOTAnimationView(name: "profile")
    
        animationView.frame = CGRect(x: animationContainerView.bounds.midX/2, y: animationContainerView.bounds.midY, width: animationContainerView.bounds.width/2, height: animationContainerView.bounds.height/2)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 2
        animationView.loopAnimation = true
        
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
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self//or use return self.navigationController for fetching app navigation bar colour
    }
    
    func documentInteractionControllerDidEndPreview(_ controller: UIDocumentInteractionController) {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    @IBAction func openPDFpressed(_ sender: Any) {
//        let pdfFilePath = Bundle.main.url(forResource: "ResumePDF2019", withExtension: "pdf")
//        let webView = WKWebView(frame: self.view.frame)
//        let urlRequest = URLRequest.init(url: pdfFilePath!)
//        webView.load(urlRequest)
//        self.view.addSubview(webView)
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        let path =  Bundle.main.path(forResource: "ResumePDF2019", ofType: ".pdf")!
        let dc = UIDocumentInteractionController(url: URL(fileURLWithPath: path))
        dc.delegate = self
        dc.presentPreview(animated: true)
    
       
        
    }
}
