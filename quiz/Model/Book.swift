//
//  File.swift
//  quiz
//
//  Created by 陳翰揚 on 15/5/2020.
//  Copyright © 2020 陳翰揚. All rights reserved.
//

import Foundation


struct Book {
    var bookName: String
    var Units: [Day]
    
    struct Day {
        var dayName: String
        var Questions: [Question]
        
        struct Question {
            var questionWord: [QuestionWord]
            
            struct QuestionWord {
                var title: String
                var img: String
                var audio: String
            }
        }
        
    }

}
