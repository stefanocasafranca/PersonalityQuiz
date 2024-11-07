//
//  QuestionsData.swift
//  PersonalityQuiz
//
//  Created by Stefano Casafranca Laos on 11/6/24.
//

import Foundation



struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}


enum ResponseType {
    case single, multiple, ranged
}


struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐇", turtle = "🐢"

var definition : String {
    switch self {
    case .dog:
        return "You are incredibly Outgoing. You enjoy spending time with those you love"
        
    case .cat:
        return "You are mischievious yet mild-tempered. You march to the beat of your own drum"
    case .rabbit:
        return "You love everything that is soft. You are sweet"
        
    case .turtle:
        return "You are wise beyond your years. You pay attention to details"
        }
    }
}





