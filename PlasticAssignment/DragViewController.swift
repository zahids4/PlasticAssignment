//
//  DragViewController.swift
//  PlasticAssignment
//
//  Created by Saim Zahid on 2018-09-17.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import UIKit

class DragViewController: UIViewController {
    @IBOutlet weak var draggableView: UIView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDragGestureToDraggableView()
        addRotateAnimation()
        createTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func addDragGestureToDraggableView() {
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(configureDragAnimation(_:)))
        draggableView.isUserInteractionEnabled = true
        draggableView.addGestureRecognizer(dragGesture)
    }
    

    @objc fileprivate func configureDragAnimation(_ sender: UIPanGestureRecognizer){
        self.view.bringSubview(toFront: draggableView)
        let translation = sender.translation(in: self.view)
        draggableView.center = CGPoint(x: draggableView.center.x + translation.x, y: draggableView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        createTimer()
    }
    
    fileprivate func addRotateAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = Double.pi * 2.0
        rotateAnimation.duration = 2.0
        rotateAnimation.repeatCount = Float.greatestFiniteMagnitude;
        draggableView.layer.add(rotateAnimation, forKey: nil)
    }
    
    func createTimer(){
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeLabel() {
        DispatchQueue.main.async {
//            GetTime.current() { currentTime, error in
//                if currentTime != nil {
//                    self.currentTimeLabel.text = currentTime
//                } else {
//                    print("Error")
//                }
//            }
        }
    }
}
