//
//  CustomCollectionCell.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 14.04.2021.
//

import UIKit

//MARK: - Класс ячейки collectionView для скруглениея желтых элементов тегов и добавления label для текста

@IBDesignable
class CustomCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var tagName: UILabel!
    
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
