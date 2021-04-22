//
//  CustomHomeCell.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 14.04.2021.
//

import UIKit

//MARK: Класс основной ячейки таблицы постов (добавлен делегат коллекции для тегов)

class CustomHomeCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionArray = ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5"]
    
    @IBOutlet weak var customViewInsideCell: CustomViewInsideCell!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var urlPostList: UILabel!
    @IBOutlet weak var dateLPostList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.reloadData()
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
    }
    
    //MARK: Методы для коллекции. Возвращаем количество и формируем контент внутри ячеек
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionCell
        
        cell.tagName.text = collectionArray[indexPath.row]
        
        return cell
    }
}



