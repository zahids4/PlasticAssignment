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
    
    @IBOutlet weak var currentTimeLabel: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDragGestureToDraggableView()
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
    }
    
    func createTimer(){
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeLabel() {
        print("saim")
    }
}
