//
//  ViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/4/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profileIconView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           scrollView.contentSize = CGSize(width: 414, height: 1276)
        // Do any additional setup after the view
        titleLbl.alpha = 0
        
        UIView.animate(withDuration: 1){
            self.titleLbl.alpha = 1
        }
        
    }
    
    
    
    

}

