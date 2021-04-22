//
//  CustomViewInsideCell.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 14.04.2021.
//

import UIKit

//MARK: Класс для View (в контент вью ячейки) для скругления и бортов согласно дизайна

@IBDesignable
class CustomViewInsideCell: UIView {
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = borderRadius
        }
    }
}

