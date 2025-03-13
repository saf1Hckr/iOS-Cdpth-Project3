//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Mubashirul Islam on 3/12/25.
//

import UIKit

class TriviaViewController: UIViewController {


    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var catergoryQuestion: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1Button: UIButton!
    

    @IBOutlet weak var option2Button: UIButton!
    
   
    @IBOutlet weak var option3Button: UIButton!
    
    
    @IBOutlet weak var option4Button: UIButton!
    
    
    
    private var questions = [Question]() // Tracks all quiz questions
    private var currentQuestionIndex = 0 // Tracks which question is being shown, defaults to 0

    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createMockData()
        configure(with: questions[currentQuestionIndex]) // Show the first question
    }

    // Returns an array of fake Question data models to display
    private func createMockData() -> [Question] {
        let mockData1 = Question(
            text: "Question1/3",
            options: ["Albert Einstein", "Edward Jenner", "Louis Pasteur", "Alexander Fleming"],
            correctAnswer: "Alexander Fleming",
            categoryImageName: "Discovery"
        )
        
        let mockData2 = Question(
            text: "Question2/3",
            options: ["Black Widow", "Hauntsman Spider", "Goliath Birdeater", "Wolf Spider"],
            correctAnswer: "Goliath Birdeater",
            categoryImageName: "Insect"
        )
        
        let mockData3 = Question(
            text: "Question3/3",
            options: ["1800", "1861", "1900", "1945"],
            correctAnswer: "1861",
            categoryImageName: "History"
        )
        
        let questions: [Question] = [mockData1, mockData2, mockData3]
        
        return questions
    }
    
    private func configure(with question: Question) {
        categoryImageView.image = UIImage(named: question.categoryImageName) // Set category image
        questionLabel.text = question.text // Set question text
        catergoryQuestion.text = question.categoryImageName
        
        // Assign answer choices to buttons
        option1Button.setTitle(question.options[0], for: .normal)
        option2Button.setTitle(question.options[1], for: .normal)
        option3Button.setTitle(question.options[2], for: .normal)
        option4Button.setTitle(question.options[3], for: .normal)
    }



    
    @IBAction func AnswerButtonTapped(_ sender: UIButton) {

            // Ensure the user can only tap one answer before proceeding
            guard let selectedAnswer = sender.currentTitle else { return }
            
            let correctAnswer = questions[currentQuestionIndex].correctAnswer

            // Check if the answer is correct
            if selectedAnswer == correctAnswer {
                sender.backgroundColor = UIColor.green // Correct answer
                correctAnswersCount += 1 // Track correct answers
            } else {
                sender.backgroundColor = UIColor.red // Incorrect answer
            }

            // Move to the next question after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.nextQuestion()
            }
        }

        // Track the number of correct answers
        private var correctAnswersCount = 0

        private func nextQuestion() {
            // Reset button colors
            option1Button.backgroundColor = UIColor.clear
            option2Button.backgroundColor = UIColor.clear
            option3Button.backgroundColor = UIColor.clear
            option4Button.backgroundColor = UIColor.clear

            // Move to the next question
            currentQuestionIndex += 1

            if currentQuestionIndex < questions.count {
                configure(with: questions[currentQuestionIndex]) // Load next question
            } else {
                // Show final score popup
                showFinalScore()
            }
        }

        // Function to display the final score in a popup
        private func showFinalScore() {
            let alert = UIAlertController(
                title: "Quiz Completed!",
                message: "You got \(correctAnswersCount) out of \(questions.count) correct.",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.restartQuiz() // Restart the quiz if needed
            }))
            
            present(alert, animated: true)
        }

        // Function to restart the quiz
        private func restartQuiz() {
            currentQuestionIndex = 0
            correctAnswersCount = 0
            configure(with: questions[currentQuestionIndex])
            
            // Show buttons again in case they were hidden
            option1Button.isHidden = false
            option2Button.isHidden = false
            option3Button.isHidden = false
            option4Button.isHidden = false
        }
    

}
