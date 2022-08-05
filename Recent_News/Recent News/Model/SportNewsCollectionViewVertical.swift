//
//  SportNewsCollectionViewVertical Model.swift
//  Recent News
//
//  Created by Filip  on 7.5.22..
//

import Foundation


struct CollectionViewVerticalRoot: Codable {
    
    var articles: [VerticalArticles]
}

struct VerticalArticles: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
}
