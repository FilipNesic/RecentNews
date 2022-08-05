//
//  SportNewsCollectionViewHorizontal Model.swift
//  Recent News
//
//  Created by Filip  on 6.5.22..
//

import Foundation


struct CollectionViewHorizontalRoot: Codable {
    
    var articles: [HorizontalArticles]
}

struct HorizontalArticles: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
}
