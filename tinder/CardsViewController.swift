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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        picImageView.isUserInteractionEnabled = true
        picImageView.addGestureRecognizer(panGestureRecognizer)
        picImageView.addGestureRecognizer(tapGestureRecognizer)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    @IBAction func didCardSwipe(_ sender: UIPanGestureRecognizer) {
        _ = sender.location(in: view)
        _ = sender.velocity(in: view)
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
    
//    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
//        performSegue(withIdentifier: "profileSegue", sender: sender)
//
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "profileSegue" {
                let profileViewController = segue.destination as! ProfileViewController
                profileViewController.newImage = picImageView.image
            }
    }

}
