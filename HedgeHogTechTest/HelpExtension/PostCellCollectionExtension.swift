//
//  PostCellCollectionExtension.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 22.04.2021.
//

import Foundation
import UIKit

//MARK: - Расгирние для коллекции внутри ячейки. Возвращаем количество и формируем контент внутри ячеек

extension CustomPostCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionTagsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionCell
        
        //MARK: данному массиву присвоим значения массива сформирванного с тег-элементами (после получения данных json)
        cell.tagName.text = collectionTagsArray[indexPath.item]
        
        return cell
    }
}
