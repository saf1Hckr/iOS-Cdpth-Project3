//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mubashirul Islam on 3/12/25.
//

struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
    let categoryImageName: String // Name of the category image
}

let questions: [Question] = [
    Question(
        text: "Question1/3",
        options: ["Albert Einstein", "Edward Jenner", "Louis Pasteur", "Alexander Fleming"],
        correctAnswer: "Alexander Fleming",
        categoryImageName: "Discovery"
    ),
    
    Question(
        text: "Question2/3",
        options: ["Black Widow", "Hauntsman Spider", "Wolf Spider", "Goliath Birdeater"],
        correctAnswer: "Goliath Birdeater",
        categoryImageName: "Insect"
    ),
    
    Question(
        text: "Question3/3",
        options: ["1800", "1945", "1900", "1861"],
        correctAnswer: "1861",
        categoryImageName: "History"
    )
    
]
