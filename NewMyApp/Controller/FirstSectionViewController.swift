//
//  SectionViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/4/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class FirstSectionViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bodyLbl: UILabel!
    
    var Title = "My Profile"
    var caption = "a little bit about me"
    var body = "I am computer science student at Macaulay Honors College"
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = Title
        captionLbl.text = caption
        bodyLbl.text = body
       
        
    }
    
    
    

    
}
