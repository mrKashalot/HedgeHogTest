//
//  CommnetsModel.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 18.04.2021.
//

import Foundation

struct Comments: Codable {
    var data: [UserComments]
    var total: Int
    var page: Int
    var limit: Int
    var offset: Int
}

struct UserComments: Codable {
    var owner: Comments
    var id: String
    var message: String
    var publishDate: String
}

"data": [
       {
           "owner": {
               "id": "TaA5kek00ZRHfUjciI0t",
               "title": "mrs",
               "firstName": "Els",
               "lastName": "Ijsseldijk",
               "email": "els.ijsseldijk@example.com",
               "picture": "https://randomuser.me/api/portraits/women/75.jpg"
           },
           "id": "UEHfuU9iydkVRCm5uJRY",
           "message": "🤔 Beautiful post!!!",
           "publishDate": "2020-01-03T00:53:25.492Z"
       },
       {
           "owner": {
               "id": "1pRsh5nXDIH3pjEOZ17A",
               "lastName": "Vicente",
               "title": "miss",
               "firstName": "Margarita",
               "email": "margarita.vicente@example.com",
               "picture": "https://randomuser.me/api/portraits/women/5.jpg"
           },
           "id": "KnTLWS1iWGmOR1F0l0to",
           "message": "Perfect pic",
           "publishDate": "2019-12-27T21:23:59.282Z"
       }
   ],
   "total": 2,
   "page": 0,
   "limit": 20,
   "offset": 0
}
