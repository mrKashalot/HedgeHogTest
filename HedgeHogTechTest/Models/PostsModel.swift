//
//  PostsModel.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 17.04.2021.
//

import Foundation


//MARK: - структуры для парсинга json данных Постов
struct Posts: Decodable {
    
    var data: [User]
    var total: Int
    var page: Int
    var limit: Int
    var offset: Int
    
    enum CodingKeys: String, CodingKey {
        case data, total, page, limit, offset
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([User].self, forKey: .data)
        total = try container.decode(Int.self, forKey: .total)
        page = try container.decode(Int.self, forKey: .page)
        limit = try container.decode(Int.self, forKey: .limit)
        offset = try container.decode(Int.self, forKey: .offset)
    }
}

struct User: Decodable {
    var owner: Owner
    var id: String
    var image: String
    var publishDate: String
    var text: String
    var tags: [String]
    var link: String?
    var likes: Int
    
    enum CodingKeys: String, CodingKey {
        case owner, id, image, publishDate, text, tags, link, likes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        owner = try container.decode(Owner.self, forKey: .owner)
        id = try container.decode(String.self, forKey: .id)
        image = try container.decode(String.self, forKey: .image)
        publishDate = try container.decode(String.self, forKey: .publishDate)
        text = try container.decode(String.self, forKey: .text)
        tags = try container.decode([String].self, forKey: .tags)
        link = try container.decode(String?.self, forKey: .link)
        likes = try container.decode(Int.self, forKey: .likes)
    }
}

struct Owner: Codable {
    var id: String
    var picture: String
    var firstName: String
    var email: String
    var title: String
    var lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id, picture, firstName, email, title, lastName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        picture = try container.decode(String.self, forKey: .picture)
        firstName = try container.decode(String.self, forKey: .firstName)
        email = try container.decode(String.self, forKey: .email)
        title = try container.decode(String.self, forKey: .title)
        lastName = try container.decode(String.self, forKey: .lastName)
    }
}

