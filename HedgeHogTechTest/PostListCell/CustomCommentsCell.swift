//
//  CustomCommentsCellTableViewCell.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 15.04.2021.
//

import UIKit

//MARK: - класс ячейки комментария

class CustomCommentsCell: UITableViewCell {

    @IBOutlet weak var commentAvatarPhoto: CustomImage!
    @IBOutlet weak var commentUserName: UILabel!
    @IBOutlet weak var userComment: UILabel!
}
