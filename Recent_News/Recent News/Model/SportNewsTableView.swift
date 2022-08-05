//
//  SportNewsTableView Model.swift
//  Recent News
//
//  Created by Filip  on 6.5.22..
//

import Foundation

struct SportNewsRoot: Codable {
    
    var articles: [ArticlesData]
}

struct ArticlesData: Codable {
    
    var author: String?
    var title: String?
    var desription: String?
    var url: String?
    var content: String?
    var urlToImage: String?
    var source: SourceSport?
}

struct SourceSport: Codable  {

var id: String?
var name: String?
}
