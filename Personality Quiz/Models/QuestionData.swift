//
//  QuestionData.swift
//  Personality Quiz
//
//  Created by student5 on 3/9/19.
//  Copyright © 2019 Hannah Leland. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
} // end Question

enum ResponseType {
    case single, multiple, ranged
} // end ReponseType

struct Answer {
    var text: String
    var type: PersonType
} // end answer

enum PersonType: String {
    case type1 = "Java", type2 = "Swift", type3 = "Python", type4 = "PHP", type5 = "C++", type6 = "C#"
    
    var definition : String {
        switch self {
        case .type1 :
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .type2 :
            return "Mischievious, yet mild-tempered, you enjoy doing things on your own terms."
        case .type3 :
            return "You love everything that's soft. You are healthy and full of energy."
        case .type4 :
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race"
        case .type5 :
            return "The first thing people notice about you is your forceful and vigorous nature. You shine like the sun, which is both a gift and a responsibility."
        case .type6 :
            return "You are energetic and love to know a little bit about everything. Your friends can always want you on their team, whether playing trivia or trying a new hobby."
        } // end switch
    } // end definition
} // end enum Character

var questions : [Question] = [
    Question(text: "Favorite place to sit?", type: .single,
             answers: [
                Answer(text: "Coffee Shop", type: .type1),
                Answer(text: "Log in Forest", type: .type2),
                Answer(text: "Bleachers", type: .type3),
                Answer(text: "In Bed", type: .type4),
                Answer(text: "Moving Vehicle", type: .type5),
                Answer(text: "Kitchen Table", type: .type6)
                      ]),
    Question(text: "Which emoji do you identify with?", type: .multiple,
             answers: [
                Answer(text: "😋", type: .type1),
                Answer(text: "😈", type: .type2),
                Answer(text: "🤔", type: .type3),
                Answer(text: "😘", type: .type4),
                Answer(text: "🤬", type: .type5),
                Answer(text: "😴", type: .type6)
                      ]),
    Question(text: "What is your handwriting like?", type: .ranged,
             answers: [
                Answer(text: "Chicken Scratch", type: .type4),
                Answer(text: "Hieroglyphics", type: .type3),
                Answer(text: "All Caps", type: .type1),
                Answer(text: "Comic Sans", type: .type2),
                Answer(text: "Typewriter", type: .type5),
                Answer(text: "Calligraphy", type: .type6)
        ]),
    Question(text: "What is most important to you when choosing work?", type: .single,
             answers: [
                Answer(text: "Achievement", type: .type1),
                Answer(text: "Independence", type: .type2),
                Answer(text: "Recognition", type: .type3),
                Answer(text: "Relationships", type: .type4),
                Answer(text: "Support", type: .type5),
                Answer(text: "Working Conditions", type: .type6)
        ])
] // end array Question

