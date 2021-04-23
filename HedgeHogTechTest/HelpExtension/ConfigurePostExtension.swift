//
//  ConfigurePostExtension.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 22.04.2021.
//

import Foundation
import UIKit

//MARK: - конфигурируем ячейку - метод будет вызван в расширениии PostTableExtension при назначении данных в ячейки

extension PostViewController {
    
    func confCell(cell: CustomPostCell, for indexPath: IndexPath) {
        
        let postUserInfo = userArray[indexPath.row]
        
        //MARK: Получаем дату в виде ISO 8601 формат
        cell.dateLPostList.text = postUserInfo.publishDate
        
        //MARK: Получаем текст под постом пользователя
        cell.textView.text = postUserInfo.text
        
        //MARK: получаем теги и помещаем их вмассив из которого формируется список ячеек коллекции встроенной в ячейку таблицы
        cell.collectionTagsArray = postUserInfo.tags
        
        DispatchQueue.global().async {
            
            guard let imageUrl = URL(string: postUserInfo.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            //MARK: UIImage формат не опддерживется в json  поэтому получив ссылку на изображение - получаем данные корреткно
            DispatchQueue.main.async {
                cell.postImage.image = UIImage(data: imageData)
            }
        }
    }
}
