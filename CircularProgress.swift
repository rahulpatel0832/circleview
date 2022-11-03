//
//  CircularProgress.swift
//  Circular ProgressView
//
//  Created by Rahul on 12/07/19.
//
//

import UIKit

class CircularProgress: UIView{
    
    let thumbLayer = CAShapeLayer()
    
    func showCircle() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.2) { [weak self] in
            guard let `self` = self else { return }
            
            let circleFrameValueY: CGFloat = self.bounds.midY
            let circleFrameValueX: CGFloat = self.bounds.midX
            let circleRadius: CGFloat = self.frame.size.width
            
            // For thumb layer
            let thumbRadius: CGFloat = 15
            
            //for circle layer
            self.backgroundColor = .clear
            let total: Int = 3
            let width: CGFloat = 8.0
            let circlePath = UIBezierPath(arcCenter: CGPoint(x:circleFrameValueX, y: circleFrameValueY),
                                          radius: circleRadius,
                                          startAngle: CGFloat(-0.5 * Double.pi),
                                          endAngle: CGFloat(1.5 * Double.pi),
                                          clockwise: true)
            
            
            // these are the percentages
            let percentages = [0.20, 0.50, 0.30]
            
            for i in 1...total {
                let prevPercentage: Double = percentages.prefix(i - 1).reduce(0, +)
                let percentage = percentages[i - 1]
                
                let circleShape = CAShapeLayer()
                circleShape.path = circlePath.cgPath
                
                switch i-1 {
                case 0:
                    circleShape.strokeColor = UIColor(named: "LightRedColor")?.cgColor
                    
                case 1:
                    circleShape.strokeColor = UIColor(named: "LightPinkColor")?.cgColor
                    
                case 2:
                    circleShape.strokeColor = UIColor(named: "LightGreyColor")?.cgColor
                    
                default:
                    circleShape.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }
                circleShape.fillColor = UIColor.clear.cgColor
                circleShape.lineWidth = width
                circleShape.strokeStart = CGFloat(prevPercentage)
                circleShape.strokeEnd = CGFloat(prevPercentage + percentage)
                self.layer.addSublayer(circleShape)
            }
            
            // Creating Dot icon here on circle
            self.thumbLayer.fillColor = UIColor(named: "DarkRedColor")?.cgColor
            self.thumbLayer.strokeColor = nil
            self.thumbLayer.path = CGPath(ellipseIn: CGRect(x: -thumbRadius, y: -circleRadius - thumbRadius, width: 2 * thumbRadius, height: 2 * thumbRadius), transform: nil)
            self.thumbLayer.position = CGPoint(x: circleFrameValueX, y: circleFrameValueY)
            self.layer.addSublayer(self.thumbLayer)
            
        }
    }
    
    func moveThumbLayer(moveToVal:CGFloat, totalValue: CGFloat) {
        
        let movetoValuePercentage : CGFloat = (2*moveToVal)/totalValue
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = movetoValuePercentage * CGFloat.pi
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 1.0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        thumbLayer.add(animation, forKey: nil)
        
    }
}
