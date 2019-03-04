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
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var titles = ["Profile","GitHub","Resume","Linkedin"]
    var captions = ["A little bit about me.","This is my GitHub account where I upload all my projects.","Here lies my resume","My Linkedin profile "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        scrollView.contentSize = CGSize(width: 414, height: 1276)
        scrollView.delegate = self
        
        titleLbl.alpha = 0
       
        UIView.animate(withDuration: 1){
            self.titleLbl.alpha = 1
        }
        
    }
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SectionCollectionViewCell
        
        cell.cellTitleLbl.text = titles[indexPath.row]
        cell.cellCaptionLbl.text = captions[indexPath.row]
        
        return cell
    }
}

extension ViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let OffsetY = scrollView.contentOffset.y
        
        if OffsetY < 0{
            mainView.transform = CGAffineTransform(translationX: 0, y: OffsetY)
            titleLbl.transform = CGAffineTransform(translationX: 0, y: -OffsetY/4)
            backgroundImage.transform = CGAffineTransform(translationX: 0, y: -OffsetY/5)
        }
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! [SectionCollectionViewCell]{
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                let translationX = cellFrame.origin.x / 5
                cell.coverImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                let angleFromX = Double((-cellFrame.origin.x)/10)
                let angle = CGFloat(angleFromX * Double.pi / 180.0)
              
                var transform = CATransform3DIdentity
                transform.m34 = -1.0 / 1000
                 //rotate with perspective
                let rotation = CATransform3DRotate(transform, angle, 0, 1 , 0)
                cell.layer.transform = rotation
            }
        }
    }
    
    
}

