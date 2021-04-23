//
//  CustomHomeCell.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 14.04.2021.
//

import UIKit

//MARK: - Класс основной ячейки таблицы постов (добавлен делегат коллекции для тегов)
class CustomPostCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: пустой массив для тегов
    var collectionTagsArray = [String]()
    
    @IBOutlet weak var customViewInsideCell: UIView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var urlPostList: UILabel!
    @IBOutlet weak var dateLPostList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //MARK: Вызов функции скругления верхних углов с радиусом 16 (назодится в HelpExtension)
        postImage.roundImageCorners(corners: [.topLeft, .topRight], radius: 16)
        
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
    }
}







