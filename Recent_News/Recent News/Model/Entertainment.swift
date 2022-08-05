//
//  Entertainment Model.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import Foundation

struct TriviaRoot: Codable {
    
    var results: [Results]
}

struct Results: Codable {
    
    var question: String?
    var correct_answer: String?
    var incorrect_answers: [String]?
    
}
