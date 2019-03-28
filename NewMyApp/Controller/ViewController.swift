//  ViewController.swift
//  NewMyApp
//
//  Created by Sabri Sönmez on 3/4/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profileIconView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var headShotImg: UIImageView!
    @IBOutlet weak var emailMeBtnOutlet: UIButton!
    @IBOutlet weak var textMeBtnOutlet: UIButton!
    
    var titles = ["Profile","GitHub","Resume","Linkedin and more"]
    var captions = ["A little bit about me.","This is my GitHub account where I upload all my projects.","Here lies my resume","My Linkedin profile and other ways to get in touch with me"]
    
    private var indexOfCellBeforeDragging = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        scrollView.contentSize = CGSize(width: 414, height: 1276)
        scrollView.delegate = self
        
        titleLbl.alpha = 0
        headShotImg.alpha = 0
        emailMeBtnOutlet.alpha = 0
        textMeBtnOutlet.alpha = 0
        
        UIView.animate(withDuration: 1){
            self.titleLbl.alpha = 1
            self.headShotImg.alpha = 1
            self.emailMeBtnOutlet.alpha = 1
            self.textMeBtnOutlet.alpha = 1
        }
        //  headShotImg.clipsToBounds = true
       // headShotImg.layer.cornerRadius = headShotImg.frame.width / 2
    }

    @IBAction func emailMeBtnPressed(_ sender: Any) {
        let email = "sabri.sonmez@macaulay.cuny.edu"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func textMeBtnPressed(_ sender: Any) {
      UIApplication.shared.open(URL(string: "sms:+13472183015")!, options: [:], completionHandler: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
             performSegue(withIdentifier: "HomeToSection1", sender: nil)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "HomeToSection2", sender: nil)
        }
        if indexPath.row == 2{
            performSegue(withIdentifier: "HomeToSection3", sender: nil)
        }
        if indexPath.row == 3{
            performSegue(withIdentifier: "HomeToSection4", sender: nil)
        }
    }
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        let pageWidth = cardView.bounds.width
//        let proportionalOffset = cardCollectionView.contentOffset.x / pageWidth
//        indexOfCellBeforeDragging = Int(round(proportionalOffset))
//    }
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//        // Stop scrolling
//        targetContentOffset.pointee = scrollView.contentOffset
//
//        // Calculate conditions
//        let pageWidth = cardView.bounds.width // The width your page should have (plus a possible margin)
//        let collectionViewItemCount = 4
//        let proportionalOffset = cardCollectionView.contentOffset.x / pageWidth
//        let indexOfMajorCell = Int(round(proportionalOffset))
//        let swipeVelocityThreshold: CGFloat = 0.5
//        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < collectionViewItemCount && velocity.x > swipeVelocityThreshold
//        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
//        let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
//        let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
//
//        if didUseSwipeToSkipCell {
//            // Animate so that swipe is just continued
//            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
//            let toValue = pageWidth * CGFloat(snapToIndex) - 65
//            UIView.animate(
//                withDuration: 0.5,
//                delay: 0,
//                usingSpringWithDamping: 1,
//                initialSpringVelocity: velocity.x,
//                options: .allowUserInteraction,
//                animations: {
//                    scrollView.contentOffset = CGPoint(x: toValue, y: 0)
//                    scrollView.layoutIfNeeded()
//            },
//                completion: nil
//            )
//        } else {
//            // Pop back (against velocity)
//            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
//            cardCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        }
//    }

}

extension ViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let OffsetY = scrollView.contentOffset.y
        
        if OffsetY < 0 {
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
