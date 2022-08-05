//
//  WorldNewsTableView Model.swift
//  Recent News
//
//  Created by Filip  on 1.5.22..
//

import Foundation


struct RootWorldNewsTableView: Codable {
    
    var results: [ResultsTableView]
}

struct ResultsTableView: Codable {
    
    var title: String?
    var description: String?
    var content: String?
    var imageUrl: String?
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
