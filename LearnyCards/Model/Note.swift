//
//  Note.swift
//  LearnyCards
//
//  Created by Zachary Buffington on 9/12/21.
//

import Foundation

class Note: Codable {
    var phrase: String
    var translation: String
    
    init(phrase: String, translation: String) {
        self.phrase = phrase
        self.translation = translation
    }
    
}

extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.phrase == rhs.phrase &&
            lhs.translation == lhs.translation
            
    }
}
