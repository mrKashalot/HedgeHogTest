//
//  UIImageRoundExtansion.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 22.04.2021.
//

import Foundation
import UIKit

//MARK: - расширение для скругления углов UIImageView: метод вызывается в awakeFromNib() ячейки Post
extension UIImageView {
    
    func roundImageCorners(corners:UIRectCorner, radius: CGFloat) {
        
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
