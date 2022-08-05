//
//  Top News Model.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import Foundation

struct Root: Codable {
    var totalResults: Int
    var articles: [Articles]
}

struct Articles: Codable {
    var title: String?
    var author: String?
    var description: String?
    var content: String?
    var urlToImage: String?
    var url: String?
    var source: Source?
}

struct Source: Codable {
    var id: String?
    var name: String?
}
