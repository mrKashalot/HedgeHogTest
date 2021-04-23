//
//  CommnetsModel.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 18.04.2021.
//

import Foundation

//MARK: - структуры для парсинга json данных Комментариев
struct Comments: Codable {
    var data: [UserComments]
    var total: Int
    var page: Int
    var limit: Int
    var offset: Int
    
    enum CodingKeys: String, CodingKey {
        case data, total, page, limit, offset
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([UserComments].self, forKey: .data)
        total = try container.decode(Int.self, forKey: .total)
        page = try container.decode(Int.self, forKey: .page)
        limit = try container.decode(Int.self, forKey: .limit)
        offset = try container.decode(Int.self, forKey: .offset)
    }
}

struct UserComments: Codable {
    var owner: UserInfo
    var id: String
    var message: String
    var publishDate: String
    
    enum CodingKeys: String, CodingKey {
        case owner, id, message, publishDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        owner = try container.decode(UserInfo.self, forKey: .owner)
        id = try container.decode(String.self, forKey: .id)
        message = try container.decode(String.self, forKey: .message)
        publishDate = try container.decode(String.self, forKey: .publishDate)
    }
}

struct UserInfo: Codable {
    var id: String
    var title: String
    var firstName: String
    var lastName: String
    var email: String
    var picture: String
    
    //MARK: в струкуре не приходит, но для удобсттва обьединим имя и фамилию в одно целое
    var fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, email, picture, firstName, lastName, fullName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        fullName = "\(String(describing: firstName))" + " \(String(describing: lastName))"
        email = try container.decode(String.self, forKey: .email)
        picture = try container.decode(String.self, forKey: .picture)
    }
}

