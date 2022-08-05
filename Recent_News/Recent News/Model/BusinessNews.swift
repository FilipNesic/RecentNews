//
//  BusinessCollectionView Model.swift
//  Recent News
//
//  Created by Filip  on 10.5.22..
//

import Foundation


struct BussinesRoot: Codable {
    
    var articles: [BusinessArticles]
}

struct BusinessArticles: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
    var source: SourceBusiness?
}

struct SourceBusiness: Codable {
    
    var name: String?
    
}
