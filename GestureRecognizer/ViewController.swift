//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Victoria Klimova on 31.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObservers()
        TapObserver()
    }

    func swipesObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func TapObserver() {
        let trippleTap = UITapGestureRecognizer(target: self, action: #selector(trippleTapAction))
        trippleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(trippleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: trippleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
            case .right:
                label.text = "Right swipe was recognized"
            case .left:
                label.text = "Left swipe was recognized"
            case .up:
                label.text = "Up swipe was recognized"
            case .down:
                label.text = "Down swipe was recognized"
                
        default:
            break
        }
    }
    
    @objc func trippleTapAction() {
        label.text = "Tripple taps were recognized"
        
    }
    @objc func doubleTapAction() {
        label.text = "Double taps were recognized"
    }
}

