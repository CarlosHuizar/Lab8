//
//  CardsViewController.swift
//  tinder
//
//  Created by Carlos Huizar-Valenzuela on 3/26/18.
//  Copyright © 2018 Carlos Huizar-Valenzuela. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var picImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didCardSwipe(_:)))

        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        picImageView.isUserInteractionEnabled = true
        picImageView.addGestureRecognizer(panGestureRecognizer)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didCardSwipe(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = picImageView.center
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            if (translation.x > 0) && !(translation.x > 50){
                picImageView.transform = CGAffineTransform(translationX: 50, y: 0)
                picImageView.transform = picImageView.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 180))
            }
            else if (translation.x < 0) && !(translation.x < -50){
                picImageView.transform = CGAffineTransform(translationX: -50, y: 0)
                picImageView.transform = picImageView.transform.rotated(by: CGFloat(Double(translation.x) * Double.pi / 180))
            }
            else
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.picImageView.isHidden = true
                })
            }
        } else if sender.state == .ended {
            print("Gesture ended")
            picImageView.transform = CGAffineTransform.identity
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
