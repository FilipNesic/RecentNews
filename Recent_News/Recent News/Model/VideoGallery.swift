//
//  VideoGallery Model.swift
//  Recent News
//
//  Created by Filip  on 8.5.22..
//

import Foundation


struct GalleryRoot: Codable {
    
    var response: [Response]
}

struct Response: Codable {
    
    var title: String?
    var competition: String?
    var matchviewUrl: String?
    var thumbnail: String?
    var videos: [Videos]
    var competitionUrl: String?
}

struct Videos: Codable {
    
    var id: String?
    var title: String?
    var embed: String?
}
