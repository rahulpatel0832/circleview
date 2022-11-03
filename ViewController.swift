//
//  ViewController.swift
//  Circular ProgressView
//
//  Created by Rahul on 12/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let circularProgress = CircularProgress(frame: CGRect(x: 150.0, y: 380.0, width: 134.0, height: 134.0))
        circularProgress.showCircle()
        self.view.addSubview(circularProgress)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // MoveToVal is where we want to put red dot.
            // TotalValue is the value of circle
            circularProgress.moveThumbLayer(moveToVal: 14.0, totalValue: 28.0)
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
