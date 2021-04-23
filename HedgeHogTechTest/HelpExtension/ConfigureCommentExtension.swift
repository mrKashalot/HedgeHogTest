//
//  ConfigureCommentExtension.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 22.04.2021.
//

import Foundation
import UIKit

//MARK: конфигурируем ячейку - метод будет вызван в расширениии CommentTableExtension при назначении данных в ячейки

extension CommentsViewController {
    
    func confCell(cell: CustomCommentsCell, for indexPath: IndexPath) {
        
        let commentsUser = commentsArray[indexPath.row]
        
        //MARK: Получаем сообщение
        cell.userComment.text = commentsUser.message
        
        //MARK: Получаем полное имя и фамилию пользователя (в модели данные соединины с помощью инициализации)
        cell.commentUserName.text = commentsUser.owner.fullName
        
        DispatchQueue.global().async {
            
            guard let imageUrl = URL(string: self.commentsArray[indexPath.row].owner.picture) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            //MARK: UIImage формат не опддерживется в json  поэтому получив ссылку на изображение - получаем данные корреткно
            DispatchQueue.main.async {
                cell.commentAvatarPhoto.image = UIImage(data: imageData)
            }
        }
    }
}
