//
//  World News Model.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import Foundation

struct RootWorldNews: Codable {
    
    var results: [ArticleResults]
}

struct ArticleResults: Codable {
    
    var title: String
    var description: String?
    var imageUrl: String?
    var content: String?
    var creator: [String]?
    var sourceId: String?
    var link: String?
    
    
    private enum CodingKeys : String, CodingKey {
        
        case title
        case description
        case imageUrl = "image_url"
        case content
        case creator
        case sourceId = "source_id"
        case link
    }
}


