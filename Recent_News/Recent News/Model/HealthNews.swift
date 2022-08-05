//
//  HealthNews Model.swift
//  Recent News
//
//  Created by Filip  on 8.5.22..
//

import Foundation


struct HealthRoot: Codable {
    
    var articles: [HealthArticles]
}

struct HealthArticles: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
    var source: SourceHealth
}
struct SourceHealth: Codable  {
    
    var id: String?
    var name: String?
}


