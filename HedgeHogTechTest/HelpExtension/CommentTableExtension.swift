//
//  CommentTableExtension.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 22.04.2021.
//

import Foundation
import UIKit

// MARK: - Расширения для использования tableView в Comments контроле
extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell") as! CustomCommentsCell
        
        confCell(cell: cell, for: indexPath)
        
        return cell
    }
}
