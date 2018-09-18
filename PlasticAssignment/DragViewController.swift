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
    @IBOutlet weak var drawerView: UIView!
    @IBOutlet weak var dropZoneView: UIView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    var dragViewOriginalPosition = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDragGestureAndAnimations()
        ViewHelpers.addRotateAnimationTo(draggableView)
        dragViewOriginalPosition = draggableView.center
        //Could not get this to work without memery leaks
        //createTimerForTimeLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func addDragGestureAndAnimations() {
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(configureGestureAndAnimations(_:)))
        draggableView.isUserInteractionEnabled = true
        draggableView.addGestureRecognizer(dragGesture)
    }
    
    
    @objc fileprivate func configureGestureAndAnimations(_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .began:
            openDrawer()
        case .changed:
            self.view.bringSubview(toFront: draggableView)
            let translation = sender.translation(in: self.view)
            draggableView.center = CGPoint(x: draggableView.center.x + translation.x, y: draggableView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            if (ViewHelpers.areViewsColliding(draggableView, dropZoneView)) {
                dropDragViewIntoDrawer()
            } else {
                returnViewsToOriginalPosition()
            }
        default: break
        }
    }
    
    fileprivate func openDrawer() {
        UIView.animate(withDuration: 2.0, animations: {
            self.drawerView.transform = CGAffineTransform(scaleX: 1.0, y: 9)
            self.dropZoneView.transform = CGAffineTransform(scaleX: 1.0, y: 9)
        })
    }
    
    fileprivate func dropDragViewIntoDrawer() {
        UIView.animate(withDuration: 1.5, animations: {
            self.draggableView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.maxY - 100)
        })
    }
    
    fileprivate func returnViewsToOriginalPosition() {
        UIView.animate(withDuration: 0.7, animations: {
            self.draggableView.center = self.dragViewOriginalPosition
            self.drawerView.transform = CGAffineTransform.identity
            self.dropZoneView.transform = CGAffineTransform.identity
        })
    }
    
    func createTimerForTimeLabel(){
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeLabel() {
        TimeHelpers.getCurrentDateTime() { currentDateTime, error in
            if currentDateTime != nil {
                self.currentTimeLabel.text = TimeHelpers.formatDateTime(currentDateTime!)
            } else {
                print("Error")
            }
        }
    }
}
