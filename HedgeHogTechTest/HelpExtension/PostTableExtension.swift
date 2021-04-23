//
//  PostTableExtension.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 22.04.2021.
//

import Foundation
import UIKit

//MARK:- Расширения для использования tableView в Post + метод для передачи по тапу на ячейку (передаем Id)
extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    //MARK: Метод передачи данных по нажатию на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let commentView = storyboard.instantiateViewController(withIdentifier: "Comments") as! CommentsViewController
        
        //MARK: присваиваем переменной commentId значение полученной из данных массива (подставляем и получаем необходимые комментраии конкретно для постас фото
        commentView.commentId = userArray[indexPath.row].id
        
        //MARK: можно было бы обойтись переходами без navigationController но это увеличило бы код (для создания кастомного/отдельного класса navigationBar - чтобы добится попадания в дизайн - переход на мкомментарии сделан без сделан без segue
        navigationController?.pushViewController(commentView, animated: true)
    }
    
    //MARK: Метод позволяет вписать корректно коллекшенвью в ячейку (не стал делать делегат на контррлллер где уже делегат таблица есть) Также, метод позволяет убрать ошибку с переиспользованием ячееек таблицы и вписанных ячеек коллекции
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let cell = cell as? CustomPostCell {
            
            cell.collectionView.tag = indexPath.section
            cell.collectionView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomPostCell
        
        //MARK: тут вызываем метод конфигруации ячейки де уже подготовлено все
        confCell(cell: cell, for: indexPath)
        
        return cell
    }
}
